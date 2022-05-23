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


    #4.3

    #Reg2 = Reg10 + Reg9
    add $2, $10, $9

    #Reg3 = Reg10 - Reg9
    sub $3, $10, $9

    #Reg4 = NOT(GPR[9]) + Reg10 +1
    nor $4, $0, $9
    addi $4, $4, 1
    add $4, $4, $10

    #Reg5 = Reg13 <<  5
    sll $5, $13, 5

    #Reg6 = Reg13 >> 5 arithmetic
    sra  $6, $13, 5

    #Reg7 = Reg12 >> 5 arithmetic
    sra $7, $12, 5

    #Reg16 = Reg12 >> 5 logical
    srl $16, $12, 5

    #Reg17 = Reg13 >> Reg9 logical
    srlv $17, $13, $9

    #Reg18 = Reg24/Reg25
    div $24, $25   #Hi Reg = Rest || Low Reg = Quotient
    mfhi $18

    #Reg19 = GPR[24] % GPR[25]
    mflo $19

    #Reg20 = GPR[15] + 1 (unsigned)
    addiu $20, $15, 1

    #Reg21 = GPR[15] + 1 (signed)
     #addi $21, $15, 1
        
    #Reg22 = count_leading_ones(GPR[11])
    clo $22, $11

    #Reg23 = count_leading_ones(GPR[14])
    clo $23, $14
