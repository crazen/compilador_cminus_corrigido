* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* main
  6:     ST  0,-1(6)    store return address
  7:    LDC  0,1(0)    const
  8:     ST  0,-20(6)    push left
  9:    LDC  0,2(0)    const
 10:     ST  0,-21(6)    push left
 11:    LDC  0,3(0)    const
 12:     LD  1,-21(6)    load left
 13:    MUL  0,1,0    op *
 14:     LD  1,-20(6)    load left
 15:    ADD  0,1,0    op +
 16:     ST  0,-2(6)    store local
 17:    LDC  0,10(0)    const
 18:     ST  0,-20(6)    push left
 19:    LDC  0,4(0)    const
 20:     ST  0,-21(6)    push left
 21:    LDC  0,2(0)    const
 22:     LD  1,-21(6)    load left
 23:    DIV  0,1,0    op /
 24:     LD  1,-20(6)    load left
 25:    SUB  0,1,0    op -
 26:     ST  0,-3(6)    store local
 27:    LDC  0,1(0)    const
 28:     ST  0,-20(6)    push left
 29:    LDC  0,2(0)    const
 30:     LD  1,-20(6)    load left
 31:    ADD  0,1,0    op +
 32:     ST  0,-20(6)    push left
 33:    LDC  0,3(0)    const
 34:     LD  1,-20(6)    load left
 35:    MUL  0,1,0    op *
 36:     ST  0,-4(6)    store local
 37:     LD  0,-2(6)    load local
 38:    OUT  0,0,0    write integer
 39:     LD  0,-3(6)    load local
 40:    OUT  0,0,0    write integer
 41:     LD  0,-4(6)    load local
 42:    OUT  0,0,0    write integer
 43:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,6(0)    jump main
