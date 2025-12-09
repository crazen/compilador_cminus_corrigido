* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* quadrado
  6:     ST  0,-1(6)    store return address
  7:     LD  0,-2(6)    load local
  8:     ST  0,-20(6)    push left
  9:     LD  0,-2(6)    load local
 10:     LD  1,-20(6)    load left
 11:    MUL  0,1,0    op *
 12:     LD  7,-1(6)    return to caller
 13:     LD  7,-1(6)    return to caller
* <- Fim Funcao
* -> Inicio Funcao
* main
 14:     ST  0,-1(6)    store return address
 15:    LDC  0,0(0)    const
 16:     ST  0,-2(6)    store local
 17:     LD  0,-2(6)    load local
 18:     ST  0,-20(6)    push left
 19:    LDC  0,10(0)    const
 20:     LD  1,-20(6)    load left
 21:    SUB  0,1,0    op <
 22:    JLT  0,2(7)    br
 23:    LDC  0,0(0)    false
 24:    LDA  7,1(7)    skip
 25:    LDC  0,1(0)    true
 27:     IN  0,0,0    read integer
 28:     ST  0,0(5)    store global
 29:     LD  0,0(5)    load global
 30:     ST  0,-22(6)    push argument
 31:     ST  6,-20(6)    store old MP
 32:    LDA  6,-20(6)    push new frame
 33:    LDC  0,35(0)    load return address
 35:     LD  6,0(6)    pop frame
 36:    OUT  0,0,0    write integer
 37:     LD  0,-2(6)    load local
 38:     ST  0,-20(6)    push left
 39:    LDC  0,1(0)    const
 40:     LD  1,-20(6)    load left
 41:    ADD  0,1,0    op +
 42:     ST  0,-2(6)    store local
 43:    LDA  7,-27(7)    jmp loop
 26:    JEQ  0,17(7)    jmp exit
 44:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,14(0)    jump main
 34:    LDC  7,6(0)    jump func
