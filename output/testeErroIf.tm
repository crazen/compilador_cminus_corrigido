* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* main
  6:     ST  0,-1(6)    store return address
  7:    LDC  0,10(0)    const
  8:     ST  0,-2(6)    store local
  9:     LD  0,-2(6)    load local
 10:     ST  0,-20(6)    push left
 11:    LDC  0,5(0)    const
 12:     LD  1,-20(6)    load left
 13:    SUB  0,1,0    op >
 14:    JGT  0,2(7)    br
 15:    LDC  0,0(0)    false
 16:    LDA  7,1(7)    skip
 17:    LDC  0,1(0)    true
 19:    LDC  0,50(0)    const
 20:     ST  0,-3(6)    store local
 21:     LD  0,-3(6)    load local
 22:    OUT  0,0,0    write integer
 18:    JEQ  0,5(7)    jmp false
 23:    LDA  7,0(7)    jmp end
 24:     LD  0,-2(6)    load local
 25:    OUT  0,0,0    write integer
 26:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,6(0)    jump main
