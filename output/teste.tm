* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* fat
  6:     ST  0,-1(6)    store return address
  7:     LD  0,-2(6)    load local
  8:     ST  0,-20(6)    push left
  9:    LDC  0,1(0)    const
 10:     LD  1,-20(6)    load left
 11:    SUB  0,1,0    op >
 12:    JGT  0,2(7)    br
 13:    LDC  0,0(0)    false
 14:    LDA  7,1(7)    skip
 15:    LDC  0,1(0)    true
 17:     LD  0,-2(6)    load local
 18:     ST  0,-20(6)    push left
 19:     LD  0,-2(6)    load local
 20:     ST  0,-21(6)    push left
 21:    LDC  0,1(0)    const
 22:     LD  1,-21(6)    load left
 23:    SUB  0,1,0    op -
 24:     ST  0,-23(6)    push argument
 25:     ST  6,-21(6)    store old MP
 26:    LDA  6,-21(6)    push new frame
 27:    LDC  0,29(0)    load return address
 29:     LD  6,0(6)    pop frame
 30:     LD  1,-20(6)    load left
 31:    MUL  0,1,0    op *
 32:     LD  7,-1(6)    return to caller
 16:    JEQ  0,17(7)    jmp false
 34:    LDC  0,1(0)    const
 35:     LD  7,-1(6)    return to caller
 33:    LDA  7,2(7)    jmp end
 36:     LD  7,-1(6)    return to caller
* <- Fim Funcao
* -> Inicio Funcao
* main
 37:     ST  0,-1(6)    store return address
 38:     IN  0,0,0    read integer
 39:     ST  0,-2(6)    store local
 40:     LD  0,-2(6)    load local
 41:     ST  0,-22(6)    push argument
 42:     ST  6,-20(6)    store old MP
 43:    LDA  6,-20(6)    push new frame
 44:    LDC  0,46(0)    load return address
 46:     LD  6,0(6)    pop frame
 47:    OUT  0,0,0    write integer
 48:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,37(0)    jump main
 45:    LDC  7,6(0)    jump func
 28:    LDC  7,6(0)    jump func
