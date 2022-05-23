    .text

    # Reg8 = 0
    addi $8, $0, 0

    #Reg9 = 11
    addi $9, $0, 11

    #Reg10 = 0x1000
    ori  $10, $0, 0x1000

    #Reg11 = -1
    addi $11, $0, -1

    #Reg12 = -0x8000
    addi $12, $0, -0x8000

    #Reg13 = 0x8000
    ori $13, $0, 0x8000

    #Reg14 = 0xffff0000
    lui $14, 0xffff

    #Reg15 = 0x7fffffff
    lui $15, 0x7fff
    ori $15, $15, 0xffff

    #Reg24 = 5322
    addi $24, $0, 5322

    #Reg25 = 75
    addi $25, $0, 75
