#include "globals.h"
#include "symtab.h"
#include "analyze.h"
#include "ast.h"

static int location = 0;
static int currentScope = 0; /* 0 = Global, 1 = Local */

/* Função auxiliar para percorrer a árvore com gerenciamento de escopo */
static void traverse(TreeNode *t,
                     void (*preProc)(TreeNode*),
                     void (*postProc)(TreeNode*)) {
    if (t != NULL) {
        int enterScope = 0;

        if (preProc != NULL) preProc(t);

        /* Caso 1: Função (Inicia Escopo Local e Reseta Memória) */
        if (t->nodekind == StmtK && t->kind.stmt == FunDeclK) {
            if (t->attr.name != NULL) scope_push(t->attr.name);
            else scope_push("func");
            
            enterScope = 1;
            location = 0;     /* Variáveis da função começam do 0 */
            currentScope = 1; /* Muda para Local */
        }
        /* Caso 2: Bloco Composto { ... } (Inicia Novo Escopo, mas CONTINUA Memória) */
        else if (t->nodekind == StmtK && t->kind.stmt == CompoundK) {
            /* Pequena otimização: O corpo da função já tem um escopo criado pelo FunDeclK.
               Para não criar dois escopos seguidos (Func -> Body), poderíamos checar.
               Mas criar um escopo extra "anônimo" não causa erro, apenas aninha mais. 
               Para garantir que IF/WHILE tenham escopo, vamos criar sempre. */
            
            scope_push("block");
            enterScope = 1;
            /* NÃO resetamos 'location' aqui! O bloco continua a pilha da função. */
        }

        int i;
        for (i=0; i < MAXCHILDREN; i++)
            traverse(t->child[i], preProc, postProc);

        if (enterScope) {
            scope_pop();
            /* Se estava saindo de uma função, volta para global */
            if (t->nodekind == StmtK && t->kind.stmt == FunDeclK) {
                currentScope = 0;
            }
        }

        if (postProc != NULL) postProc(t);
        traverse(t->sibling, preProc, postProc);
    }
}

/* FASE 1: Construir Tabela de Símbolos, Definir Tipos e Alocar Memória */
static void insertNode(TreeNode *t) {
    switch (t->nodekind) {
        case StmtK:
            switch (t->kind.stmt) {
                case VarDeclK:
                    t->memloc = location;
                    t->scope = currentScope;
                    
                    /* Array */
                    if (t->child[0] != NULL && t->child[0]->nodekind == ExpK && t->child[0]->kind.exp == ConstK) {
                        location += t->child[0]->attr.val;
                    } else {
                        location++;
                    }
                    
                    st_insert(t->attr.name, t->lineno, t->memloc, t);
                    break;
                    
                case ParamK: 
                    t->memloc = location++;
                    t->scope = currentScope;
                    st_insert(t->attr.name, t->lineno, t->memloc, t);
                    break;
                    
                case FunDeclK:
                    st_insert(t->attr.name, t->lineno, 0, t);
                    break;
                
                case CallK:
                    if (strcmp(t->attr.name, "input") == 0) {
                        t->type = Integer;
                    } else if (strcmp(t->attr.name, "output") == 0) {
                        t->type = Void;
                    } else {
                        TreeNode *funcDef = st_lookup(t->attr.name);
                        if (funcDef != NULL) {
                            t->type = funcDef->type;
                        } else {
                            fprintf(listing,"ERRO SEMANTICO: Funcao '%s' nao declarada - LINHA: %d\n",
                                    t->attr.name, t->lineno);
                            Error = TRUE;
                            t->type = Void;
                        }
                    }
                    break;
                    
                default: break;
            }
            break;
            
        case ExpK:
            switch (t->kind.exp) {
                case IdK:
                    if (t->kind.exp == IdK) {
                        /* st_lookup busca do escopo atual para cima.
                           Isso garante que se houver 'int x' no IF, ele acha esse primeiro. */
                        TreeNode *defn = st_lookup(t->attr.name);
                        if (defn == NULL) {
                            if (strcmp(t->attr.name, "input")!=0 && strcmp(t->attr.name, "output")!=0) {
                                fprintf(listing,"ERRO SEMANTICO: Variavel '%s' nao declarada - LINHA: %d\n",
                                        t->attr.name, t->lineno);
                                Error = TRUE;
                                t->type = Integer;
                            }
                        } else {
                            t->memloc = defn->memloc;
                            t->type = defn->type;
                            t->scope = defn->scope;
                        }
                    }
                    break;
                case ConstK:
                    t->type = Integer;
                    break;
                case OpK:
                    t->type = Integer; 
                    break;
                default: break;
            }
            break;
        default: break;
    }
}

void buildSymtab(TreeNode *syntaxTree) {
    location = 0; 
    currentScope = 0;
    scope_push("global");
    traverse(syntaxTree, insertNode, NULL);
    if (TraceAnalyze) printSymTab(listing);
    scope_pop();
}

/* FASE 2: Checagem de Tipos (Validação) */
static void checkNode(TreeNode *t) {
    switch (t->nodekind) {
        case ExpK:
            switch (t->kind.exp) {
                case OpK:
                    if ((t->child[0]->type == Void) || 
                        (t->child[1] && t->child[1]->type == Void)) {
                        fprintf(listing, "ERRO SEMANTICO: Operacao invalida com tipo void na linha %d\n", t->lineno);
                        Error = TRUE;
                    }
                    break;
                default: break;
            }
            break;
        case StmtK:
            switch (t->kind.stmt) {
                case AssignK:
                    if (t->child[1]->type == Void) {
                        fprintf(listing, "ERRO SEMANTICO: Atribuicao de valor void para variavel na linha %d\n", t->lineno);
                        Error = TRUE;
                    }
                    break;
                case IfK: case WhileK:
                    if (t->child[0]->type == Void) {
                        fprintf(listing, "ERRO SEMANTICO: Condicao nao pode ser void na linha %d\n", t->lineno);
                        Error = TRUE;
                    }
                    break;
                default: break;
            }
            break;
        default: break;
    }
}

void typeCheck(TreeNode *syntaxTree) {
    traverse(syntaxTree, NULL, checkNode);
}