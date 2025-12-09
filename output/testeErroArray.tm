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
  8:     ST  0,-20(6)    save index
  9:    LDC  0,1(0)    const
 10:     LD  1,-20(6)    restore index
 11:     ST  0,-20(6)    save value
 12:    LDC  0,0(0)    base
 13:    ADD  0,0,5    base+GP
 14:    ADD  1,1,0    addr = base + index
 15:     LD  0,-20(6)    restore value
 16:     ST  0,0(1)    store array
 17:    LDC  0,1(0)    const
 18:     ST  0,-20(6)    save index
 19:    LDC  0,2(0)    const
 20:     LD  1,-20(6)    restore index
 21:     ST  0,-20(6)    save value
 22:    LDC  0,0(0)    base
 23:    ADD  0,0,5    base+GP
 24:    ADD  1,1,0    addr = base + index
 25:     LD  0,-20(6)    restore value
 26:     ST  0,0(1)    store array
 27:    LDC  0,2(0)    const
 28:     ST  0,-20(6)    save index
 29:    LDC  0,4(0)    const
 30:     LD  1,-20(6)    restore index
 31:     ST  0,-20(6)    save value
 32:    LDC  0,0(0)    base
 33:    ADD  0,0,5    base+GP
 34:    ADD  1,1,0    addr = base + index
 35:     LD  0,-20(6)    restore value
 36:     ST  0,0(1)    store array
 37:    LDC  0,3(0)    const
 38:     ST  0,-20(6)    save index
 39:    LDC  0,99(0)    const
 40:     LD  1,-20(6)    restore index
 41:     ST  0,-20(6)    save value
 42:    LDC  0,0(0)    base
 43:    ADD  0,0,5    base+GP
 44:    ADD  1,1,0    addr = base + index
 45:     LD  0,-20(6)    restore value
 46:     ST  0,0(1)    store array
 47:    LDC  0,4(0)    const
 48:     ST  0,-20(6)    save index
 49:    LDC  0,77(0)    const
 50:     LD  1,-20(6)    restore index
 51:     ST  0,-20(6)    save value
 52:    LDC  0,0(0)    base
 53:    ADD  0,0,5    base+GP
 54:    ADD  1,1,0    addr = base + index
 55:     LD  0,-20(6)    restore value
 56:     ST  0,0(1)    store array
 57:    LDC  0,0(0)    const
 58:    LDC  1,0(0)    clear AC1
 59:    ADD  1,0,1    move index
 60:    LDC  0,0(0)    base
 61:    ADD  0,0,5    base+GP
 62:    ADD  1,1,0    addr
 63:     LD  0,0(1)    load [addr]
 64:    LDC  1,0(0)    clear AC1
 65:    ADD  1,0,1    move index
 66:    LDC  0,0(0)    base
 67:    ADD  0,0,5    base+GP
 68:    ADD  1,1,0    addr
 69:     LD  0,0(1)    load [addr]
 70:    LDC  1,0(0)    clear AC1
 71:    ADD  1,0,1    move index
 72:    LDC  0,0(0)    base
 73:    ADD  0,0,5    base+GP
 74:    ADD  1,1,0    addr
 75:     LD  0,0(1)    load [addr]
 76:    OUT  0,0,0    write integer
 77:     LD  7,-1(6)    return to caller
* <- Fim Funcao
  4:    LDC  7,6(0)    jump main
