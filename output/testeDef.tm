* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* main
  6:     ST  0,-1(6)    store return address
  7:    LDC  0,5(0)    const
  8:     ST  0,-2(6)    store local
  9:    LDC  0,2(0)    const
 10:     ST  0,-3(6)    store local
 11:     LD  0,-2(6)    load local
 12:     ST  0,-20(6)    push left
 13:     LD  0,-3(6)    load local
 14:     LD  1,-20(6)    load left
 15:    MUL  0,1,0    op *
 16:     ST  0,-2(6)    store local
 17:     LD  0,-2(6)    load local
 18:    OUT  0,0,0    write integer
 19:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,6(0)    jump main
