#ifndef _CGEN_H_
#define _CGEN_H_

#include "globals.h"
#include "ast.h"

/* Gera o código para um único nó (usado internamente ou recursivamente) */
void cGen(TreeNode *t);

/* Função principal de geração de código chamada pelo main */
void codeGen(TreeNode *syntaxTree, char *codefile);

#endif