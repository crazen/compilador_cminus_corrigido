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
  9:    LDC  0,0(0)    const
 10:     ST  0,-3(6)    store local
 11:     LD  0,-2(6)    load local
 12:     ST  0,-20(6)    push left
 13:    LDC  0,5(0)    const
 14:     LD  1,-20(6)    load left
 15:    SUB  0,1,0    op <
 16:    JLT  0,2(7)    br
 17:    LDC  0,0(0)    false
 18:    LDA  7,1(7)    skip
 19:    LDC  0,1(0)    true
 21:     LD  0,-2(6)    load local
 22:     ST  0,-20(6)    save index
 23:     IN  0,0,0    read integer
 24:     LD  1,-20(6)    restore index
 25:     ST  0,-20(6)    save value
 26:    LDC  0,0(0)    base
 27:    ADD  0,0,5    base+GP
 28:    ADD  1,1,0    addr = base + index
 29:     LD  0,-20(6)    restore value
 30:     ST  0,0(1)    store array
 31:     LD  0,-2(6)    load local
 32:     ST  0,-20(6)    push left
 33:    LDC  0,1(0)    const
 34:     LD  1,-20(6)    load left
 35:    ADD  0,1,0    op +
 36:     ST  0,-2(6)    store local
 37:    LDA  7,-27(7)    jmp loop
 20:    JEQ  0,17(7)    jmp exit
 38:    LDC  0,0(0)    const
 39:     ST  0,-2(6)    store local
 40:     LD  0,-2(6)    load local
 41:     ST  0,-20(6)    push left
 42:    LDC  0,5(0)    const
 43:     LD  1,-20(6)    load left
 44:    SUB  0,1,0    op <
 45:    JLT  0,2(7)    br
 46:    LDC  0,0(0)    false
 47:    LDA  7,1(7)    skip
 48:    LDC  0,1(0)    true
 50:     LD  0,-3(6)    load local
 51:     ST  0,-20(6)    push left
 52:     LD  0,-2(6)    load local
 53:    LDC  1,0(0)    clear AC1
 54:    ADD  1,0,1    move index
 55:    LDC  0,0(0)    base
 56:    ADD  0,0,5    base+GP
 57:    ADD  1,1,0    addr
 58:     LD  0,0(1)    load [addr]
 59:     LD  1,-20(6)    load left
 60:    ADD  0,1,0    op +
 61:     ST  0,-3(6)    store local
 62:     LD  0,-2(6)    load local
 63:     ST  0,-20(6)    push left
 64:    LDC  0,1(0)    const
 65:     LD  1,-20(6)    load left
 66:    ADD  0,1,0    op +
 67:     ST  0,-2(6)    store local
 68:    LDA  7,-29(7)    jmp loop
 49:    JEQ  0,19(7)    jmp exit
 69:     LD  0,-3(6)    load local
 70:    OUT  0,0,0    write integer
 71:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,6(0)    jump main
