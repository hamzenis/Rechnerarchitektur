# void strtolower(char *str)

.data

str: .asciiz "TOLowerCASE"


.text

main:
	la  $a0, str
	jal strtolower
	
	
end:
	j end



strtolower:
	addiu $8, $0, 0x40	# Grenzen der Großbuchstaben in Ascii : 0x41 = A, 0x5a = Z
	addiu $9, $0, 0x5b	# siehe oben
	addiu $10, $a0, 0	# Kopie der Adresse mit dem String

	loop:
		lbu $11, 0($10)		# Laedt den ersten Buchstaben in Register 11
		addiu $10, $10, 1
		beq $11, $0, jumpback	# Wenn leer dann jumpback
		slt $12, $11, $9	# Wenn der Buchstabe in $11 kleiner ist als die Grenze der Großbuchstaben Ascii's , die in $9 gespeichert sind
		slt $13, $8, $11	# Logik wie oben nur anders rum
		bne $12, $13, loop	# Falls die Grenzen nicht passen, dann nächster Buchstabe
		addiu $11, $11, 32	# Mit +32 dez wird vom Großbuchstaben in den Bereich der Kleinbuchstaben Ascii's
		addiu $20, $10, -1	# Decrement
		sb $11, 0($20)
		j loop
		
		
	jumpback:
		jr $31
	
