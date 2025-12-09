* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* soma_rec
  6:     ST  0,-1(6)    store return address
  7:     LD  0,-2(6)    load local
  8:     ST  0,-20(6)    push left
  9:    LDC  0,0(0)    const
 10:     LD  1,-20(6)    load left
 11:    SUB  0,1,0    op <
 12:    JLT  0,2(7)    br
 13:    LDC  0,0(0)    false
 14:    LDA  7,1(7)    skip
 15:    LDC  0,1(0)    true
 17:    LDC  0,0(0)    const
 18:     LD  7,-1(6)    return to caller
 16:    JEQ  0,3(7)    jmp false
 20:     LD  0,-2(6)    load local
 21:    LDC  1,0(0)    clear AC1
 22:    ADD  1,0,1    move index
 23:    LDC  0,0(0)    base
 24:    ADD  0,0,5    base+GP
 25:    ADD  1,1,0    addr
 26:     LD  0,0(1)    load [addr]
 27:     ST  0,-20(6)    push left
 28:     LD  0,-2(6)    load local
 29:     ST  0,-21(6)    push left
 30:    LDC  0,1(0)    const
 31:     LD  1,-21(6)    load left
 32:    SUB  0,1,0    op -
 33:     ST  0,-23(6)    push argument
 34:     ST  6,-21(6)    store old MP
 35:    LDA  6,-21(6)    push new frame
 36:    LDC  0,38(0)    load return address
 38:     LD  6,0(6)    pop frame
 39:     LD  1,-20(6)    load left
 40:    ADD  0,1,0    op +
 41:     LD  7,-1(6)    return to caller
 19:    LDA  7,22(7)    jmp end
 42:     LD  7,-1(6)    return to caller
* <- Fim Funcao
* -> Inicio Funcao
* main
 43:     ST  0,-1(6)    store return address
 44:    LDC  0,0(0)    const
 45:     ST  0,-2(6)    store local
 46:     LD  0,-2(6)    load local
 47:     ST  0,-20(6)    push left
 48:    LDC  0,5(0)    const
 49:     LD  1,-20(6)    load left
 50:    SUB  0,1,0    op <
 51:    JLT  0,2(7)    br
 52:    LDC  0,0(0)    false
 53:    LDA  7,1(7)    skip
 54:    LDC  0,1(0)    true
 56:     LD  0,-2(6)    load local
 57:     ST  0,-20(6)    save index
 58:     LD  0,-2(6)    load local
 59:     ST  0,-21(6)    push left
 60:    LDC  0,1(0)    const
 61:     LD  1,-21(6)    load left
 62:    ADD  0,1,0    op +
 63:     LD  1,-20(6)    restore index
 64:     ST  0,-20(6)    save value
 65:    LDC  0,0(0)    base
 66:    ADD  0,0,5    base+GP
 67:    ADD  1,1,0    addr = base + index
 68:     LD  0,-20(6)    restore value
 69:     ST  0,0(1)    store array
 70:     LD  0,-2(6)    load local
 71:     ST  0,-20(6)    push left
 72:    LDC  0,1(0)    const
 73:     LD  1,-20(6)    load left
 74:    ADD  0,1,0    op +
 75:     ST  0,-2(6)    store local
 76:    LDA  7,-31(7)    jmp loop
 55:    JEQ  0,21(7)    jmp exit
 77:    LDC  0,4(0)    const
 78:     ST  0,-22(6)    push argument
 79:     ST  6,-20(6)    store old MP
 80:    LDA  6,-20(6)    push new frame
 81:    LDC  0,83(0)    load return address
 83:     LD  6,0(6)    pop frame
 84:    OUT  0,0,0    write integer
 85:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,43(0)    jump main
 82:    LDC  7,6(0)    jump func
 37:    LDC  7,6(0)    jump func
