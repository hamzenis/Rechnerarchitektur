.data

str: .asciiz "TOLowerCASETeSt"
str2: .asciiz "Lager"
str3: .asciiz "Regal"

.text

main:
	la $a0, str
	jal strtolower
	
end:
	j end


# void strtolower(char *str)

# Start To LowerCase Function
strtolower:
	addiu $8, $0, 0x40	# Grenzen der Großbuchstaben in Ascii : 0x41 = A, 0x5a = Z
	addiu $9, $0, 0x5b	# siehe oben
	addiu $10, $a0, 0	# Kopie der Adresse mit dem String

loopToLow:
    	lbu $11, 0($10)		# Laedt den ersten Buchstaben in Register 11
   	addiu $10, $10, 1	# Increment für den nächsten Durchlauf
   	beq $11, $0, jumpbackToLow	# Wenn leer dann jumpback
   	slt $12, $11, $9	# Wenn der Buchstabe in $11 kleiner ist als die Grenze der Großbuchstaben Ascii's , die in $9 gespeichert sind
    	slt $13, $8, $11	# Logik wie oben nur anders rum
    	bne $12, $13, loopToLow	# Falls die Grenzen nicht passen, dann nächster Buchstabe
    	addiu $11, $11, 32	# Mit +32 dez wird vom Großbuchstaben in den Bereich der Kleinbuchstaben Ascii's
    	addiu $20, $10, -1	# Decrement zum speichern an der richtigen Adresse, aber mit einem anderen Register
    	sb $11, 0($20)		# Store des Kleinbuchstaben
    	j loopToLow
    
jumpbackToLow:
    	jr $31
# End To LowerCase Function

#void strturnaround(char *str)

strturnaround:
	
	
	
# Start of Length Function
length:
	addiu $10, $a0, 0	# Kopieren der Adresse
	add $7, $0, $0		# Setzen des Register 7 auf NULL zum uebergeben der Laenge spaeter

loopLen:
	lbu $11, 0($10)
	beq $11, $0, jumpbackLen
	addiu $

jumpbackLen:
	jr $31	
	
# End of Length Function	