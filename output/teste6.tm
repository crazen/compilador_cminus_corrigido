* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* fib
  6:     ST  0,-1(6)    store return address
  7:     LD  0,-2(6)    load local
  8:     ST  0,-20(6)    push left
  9:    LDC  0,2(0)    const
 10:     LD  1,-20(6)    load left
 11:    SUB  0,1,0    op <
 12:    JLT  0,2(7)    br
 13:    LDC  0,0(0)    false
 14:    LDA  7,1(7)    skip
 15:    LDC  0,1(0)    true
 17:     LD  0,-2(6)    load local
 18:     LD  7,-1(6)    return to caller
 16:    JEQ  0,3(7)    jmp false
 20:     LD  0,-2(6)    load local
 21:     ST  0,-20(6)    push left
 22:    LDC  0,1(0)    const
 23:     LD  1,-20(6)    load left
 24:    SUB  0,1,0    op -
 25:     ST  0,-22(6)    push argument
 26:     ST  6,-20(6)    store old MP
 27:    LDA  6,-20(6)    push new frame
 28:    LDC  0,30(0)    load return address
 30:     LD  6,0(6)    pop frame
 31:     ST  0,-20(6)    push left
 32:     LD  0,-2(6)    load local
 33:     ST  0,-21(6)    push left
 34:    LDC  0,2(0)    const
 35:     LD  1,-21(6)    load left
 36:    SUB  0,1,0    op -
 37:     ST  0,-23(6)    push argument
 38:     ST  6,-21(6)    store old MP
 39:    LDA  6,-21(6)    push new frame
 40:    LDC  0,42(0)    load return address
 42:     LD  6,0(6)    pop frame
 43:     LD  1,-20(6)    load left
 44:    ADD  0,1,0    op +
 45:     LD  7,-1(6)    return to caller
 19:    LDA  7,26(7)    jmp end
 46:     LD  7,-1(6)    return to caller
* <- Fim Funcao
* -> Inicio Funcao
* main
 47:     ST  0,-1(6)    store return address
 48:     IN  0,0,0    read integer
 49:     ST  0,-2(6)    store local
 50:     LD  0,-2(6)    load local
 51:     ST  0,-22(6)    push argument
 52:     ST  6,-20(6)    store old MP
 53:    LDA  6,-20(6)    push new frame
 54:    LDC  0,56(0)    load return address
 56:     LD  6,0(6)    pop frame
 57:    OUT  0,0,0    write integer
 58:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,47(0)    jump main
 55:    LDC  7,6(0)    jump func
 41:    LDC  7,6(0)    jump func
 29:    LDC  7,6(0)    jump func
