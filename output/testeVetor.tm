* C-Minus TM Code
  0:    LDC  6,1023(0)    init SP
  1:    LDC  5,0(0)    init GP
  2:     ST  0,0(0)    clear 0
  3:    LDC  0,5(0)    ret addr
  5:   HALT  0,0,0    END
* -> Inicio Funcao
* main
  6:     ST  0,-1(6)    store return address
  7:    LDC  0,0(0)    const
  8:     ST  0,-2(6)    store local
  9:     LD  0,-2(6)    load local
 10:     ST  0,-20(6)    push left
 11:    LDC  0,5(0)    const
 12:     LD  1,-20(6)    load left
 13:    SUB  0,1,0    op <
 14:    JLT  0,2(7)    br
 15:    LDC  0,0(0)    false
 16:    LDA  7,1(7)    skip
 17:    LDC  0,1(0)    true
 19:     LD  0,-2(6)    load local
 20:     ST  0,-20(6)    save index
 21:     LD  0,-2(6)    load local
 22:     ST  0,-21(6)    push left
 23:    LDC  0,1(0)    const
 24:     LD  1,-21(6)    load left
 25:    ADD  0,1,0    op +
 26:     LD  1,-20(6)    restore index
 27:     ST  0,-20(6)    save value
 28:    LDC  0,0(0)    base
 29:    ADD  0,0,5    base+GP
 30:    ADD  1,1,0    addr = base + index
 31:     LD  0,-20(6)    restore value
 32:     ST  0,0(1)    store array
 33:     LD  0,-2(6)    load local
 34:     ST  0,-20(6)    save index
 35:    LDC  0,2(0)    const
 36:     LD  1,-20(6)    restore index
 37:     ST  0,-20(6)    save value
 38:    LDC  0,5(0)    base
 39:    ADD  0,0,5    base+GP
 40:    ADD  1,1,0    addr = base + index
 41:     LD  0,-20(6)    restore value
 42:     ST  0,0(1)    store array
 43:     LD  0,-2(6)    load local
 44:     ST  0,-20(6)    push left
 45:    LDC  0,1(0)    const
 46:     LD  1,-20(6)    load left
 47:    ADD  0,1,0    op +
 48:     ST  0,-2(6)    store local
 49:    LDA  7,-41(7)    jmp loop
 18:    JEQ  0,31(7)    jmp exit
 50:    LDC  0,0(0)    const
 51:     ST  0,-3(6)    store local
 52:    LDC  0,0(0)    const
 53:     ST  0,-2(6)    store local
 54:     LD  0,-2(6)    load local
 55:     ST  0,-20(6)    push left
 56:    LDC  0,5(0)    const
 57:     LD  1,-20(6)    load left
 58:    SUB  0,1,0    op <
 59:    JLT  0,2(7)    br
 60:    LDC  0,0(0)    false
 61:    LDA  7,1(7)    skip
 62:    LDC  0,1(0)    true
 64:     LD  0,-3(6)    load local
 65:     ST  0,-20(6)    push left
 66:     LD  0,-2(6)    load local
 67:    LDC  1,0(0)    clear AC1
 68:    ADD  1,0,1    move index
 69:    LDC  0,0(0)    base
 70:    ADD  0,0,5    base+GP
 71:    ADD  1,1,0    addr
 72:     LD  0,0(1)    load [addr]
 73:     ST  0,-21(6)    push left
 74:     LD  0,-2(6)    load local
 75:    LDC  1,0(0)    clear AC1
 76:    ADD  1,0,1    move index
 77:    LDC  0,5(0)    base
 78:    ADD  0,0,5    base+GP
 79:    ADD  1,1,0    addr
 80:     LD  0,0(1)    load [addr]
 81:     LD  1,-21(6)    load left
 82:    MUL  0,1,0    op *
 83:     LD  1,-20(6)    load left
 84:    ADD  0,1,0    op +
 85:     ST  0,-3(6)    store local
 86:     LD  0,-2(6)    load local
 87:     ST  0,-20(6)    push left
 88:    LDC  0,1(0)    const
 89:     LD  1,-20(6)    load left
 90:    ADD  0,1,0    op +
 91:     ST  0,-2(6)    store local
 92:    LDA  7,-39(7)    jmp loop
 63:    JEQ  0,29(7)    jmp exit
 93:     LD  0,-3(6)    load local
 94:    OUT  0,0,0    write integer
 95:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,6(0)    jump main
