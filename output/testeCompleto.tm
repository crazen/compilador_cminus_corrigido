* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* fatorial
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
* output_print
 37:     ST  0,-1(6)    store return address
 38:     LD  0,-2(6)    load local
 39:    OUT  0,0,0    write integer
 40:     LD  7,-1(6)    return to caller
* <- Fim Funcao
* -> Inicio Funcao
* main
 41:     ST  0,-1(6)    store return address
 42:    LDC  0,0(0)    const
 43:     ST  0,-2(6)    store local
 44:     LD  0,-2(6)    load local
 45:     ST  0,-20(6)    push left
 46:    LDC  0,5(0)    const
 47:     LD  1,-20(6)    load left
 48:    SUB  0,1,0    op <
 49:    JLT  0,2(7)    br
 50:    LDC  0,0(0)    false
 51:    LDA  7,1(7)    skip
 52:    LDC  0,1(0)    true
 54:     LD  0,-2(6)    load local
 55:     ST  0,-20(6)    save index
 56:     LD  0,-2(6)    load local
 57:     ST  0,-21(6)    push left
 58:    LDC  0,1(0)    const
 59:     LD  1,-21(6)    load left
 60:    ADD  0,1,0    op +
 61:     LD  1,-20(6)    restore index
 62:     ST  0,-20(6)    save value
 63:    LDC  0,0(0)    base
 64:    ADD  0,0,5    base+GP
 65:    ADD  1,1,0    addr = base + index
 66:     LD  0,-20(6)    restore value
 67:     ST  0,0(1)    store array
 68:     LD  0,-2(6)    load local
 69:     ST  0,-20(6)    push left
 70:    LDC  0,1(0)    const
 71:     LD  1,-20(6)    load left
 72:    ADD  0,1,0    op +
 73:     ST  0,-2(6)    store local
 74:    LDA  7,-31(7)    jmp loop
 53:    JEQ  0,21(7)    jmp exit
 75:    LDC  0,4(0)    const
 76:    LDC  1,0(0)    clear AC1
 77:    ADD  1,0,1    move index
 78:    LDC  0,0(0)    base
 79:    ADD  0,0,5    base+GP
 80:    ADD  1,1,0    addr
 81:     LD  0,0(1)    load [addr]
 82:     ST  0,-22(6)    push argument
 83:     ST  6,-20(6)    store old MP
 84:    LDA  6,-20(6)    push new frame
 85:    LDC  0,87(0)    load return address
 87:     LD  6,0(6)    pop frame
 88:     ST  0,-3(6)    store local
 89:     LD  0,-3(6)    load local
 90:     ST  0,-22(6)    push argument
 91:     ST  6,-20(6)    store old MP
 92:    LDA  6,-20(6)    push new frame
 93:    LDC  0,95(0)    load return address
 95:     LD  6,0(6)    pop frame
 96:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,41(0)    jump main
 94:    LDC  7,37(0)    jump func
 86:    LDC  7,6(0)    jump func
 28:    LDC  7,6(0)    jump func
