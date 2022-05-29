.text

	#jump zur main:
	j main
	
func:
	#Zeile 3
	add $2, $0, $5

	#Zeile 4
	beq $4, $0, loop
	
	#Zeile 5
	beq $5, $0, z9
	
	#Zeile6
	slt $27, $5, $4
	bne $27, $0, z6
	sll $0, $0, 0	#No Op
	
	#Zeile7
	beq $27, $0, z7
	sll $0, $0, 0	#No Op
	
	#Zeile8
	or $26, $0, $0		#Jump Back
	lui $26, 0x0040
	ori $26, $26, 0xc
	jr $26			#Jump Back
	
	
#Zeile6
z6:
	subu $4, $4, $5
	or $26, $0, $0		#Jump Back
	lui $26, 0x0040
	ori $26, $26, 0x18
	jr $26			#Jump Back
	
#Zeile7
z7:
	subu $5, $5, $4
	or $26, $0, $0		#Jump Back
	lui $26, 0x0040
	ori $26, $26, 0x20
	jr $26			#Jump Back
		
#Zeile 9
z9:
	add $2, $4, $0
	
#Zeile 10
loop:
	j loop


main: 
	addiu $4, $0, 210
	addiu $5, $0, 28
	jal func