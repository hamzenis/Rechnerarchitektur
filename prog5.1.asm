.text
	#Zeile 1-3
	addiu $4, $0, 210
	addiu $5, $0, 28
	add $2, $0, $5

	#Zeile 4
	beq $4, $0, loop
	
	#Zeile 5
z5:
	beq $5, $0, z9
	
	#Zeile6
z6a:
	slt $27, $5, $4
	bne $27, $0, z6b
	

	#Zeile7
z7a:
	beq $27, $0, z7b
	
	#Zeile8
z8:
	j z5			#Jump Back

	
#Zeile6
z6b:
	subu $4, $4, $5
	j z7a			#Jump Back
	
#Zeile7
z7b:
	subu $5, $5, $4
	j z8			#Jump Back
		
#Zeile 9
z9:
	add $2, $4, $0
	
#Zeile 10
loop:
	j loop
	
	
