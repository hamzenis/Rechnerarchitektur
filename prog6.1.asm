.data

#str: .asciiz "TOLowerCASETeSt"
#str2: .asciiz "LageR"
#str3: .asciiz "RegaR"
str4: .asciiz "Lagerkegal"

.text

main:
	la $a0, str4
	jal strtolower
	jal strturnaround
	jal strispalindrom
	#la $a0, str2
	#jal strtolower
	#la $a0, str3
	#jal strtolower
	
end:
	j end


# void strtolower(char *str)
# Start To LowerCase Function
strtolower:
	addiu $8, $0, 0x40	# Grenzen der Großbuchstaben in Ascii : 0x41 = A, 0x5a = Z
	addiu $9, $0, 0x5b	# siehe oben
	addiu $10, $a0, 0	# Kopie der Adresse mit dem String

loopToLow:
    	lbu $11, 0($10)			# Laedt den ersten Buchstaben in Register 11
   	addiu $10, $10, 1		# Increment für den nächsten Durchlauf
   	beq $11, $0, jumpbackToLow	# Wenn leer dann jumpback
   	slt $12, $11, $9		# Wenn der Buchstabe in $11 kleiner ist als die Grenze der Großbuchstaben Ascii's , die in $9 gespeichert sind
    	slt $13, $8, $11		# Logik wie oben nur anders rum
    	bne $12, $13, loopToLow		# Falls die Grenzen nicht passen, dann nächster Buchstabe
    	addiu $11, $11, 32		# Mit +32 dez wird vom Großbuchstaben in den Bereich der Kleinbuchstaben Ascii's
    	addiu $20, $10, -1		# Decrement zum speichern an der richtigen Adresse, aber mit einem anderen Register
    	sb $11, 0($20)			# Store des Kleinbuchstaben
    	j loopToLow
    
jumpbackToLow:
    	jr $31
# End To LowerCase Function


# void strturnaround(char *str)
# Start TurnAroundFunction
strturnaround:
	addiu $a1, $a0, 0 		# Kopie der Startadresse des Strings
	addiu $a2, $a0, 0		# Wird für die Endadresse verwendet
	
loopTurnHoch:
	lb $t0, ($a2)			# Laden des AsciiZeichens
	beqz $t0, subTurn		# Wenn $a2 gleich 0 ist, dann wird zum eigentlichen Umdrehen gesprungen
	addiu $a2, $a2, 1		# Es wird hochgezaehlt bis das Ende des Strings erreicht wurde, der mit einer Null terminiert
	j loopTurnHoch

subTurn:
	addiu $a2, $a2, -1		# Damit das letzte Zeichen erreicht wird, weil der Zeiger auf dem Zeichen danach ist
	
turnAroundloop:
	bleu $a2, $a1,  jumpbackTurnAr	# Wenn die $a2 und die $a1 sich in der Mitte treffen oder $a2 unter $a1 fällt dann Endet die Funktion
	lbu $t0, ($a1)			# Laden der Buchstaben in Registern
	lbu $t1, ($a2)			# s.o.

	sb $t1, ($a1)			# Einspeichern der Buchstaben an den Registern
	sb $t0, ($a2)			# s.o.
	
	addiu $a1, $a1, 1		# Erhöhen der Adresse
	addiu $a2, $a2, -1		# Erniedrigen der Adresse
	
	j turnAroundloop
	
jumpbackTurnAr:
	jr $31

# End TurnAroundFunction


# int strispalindrom(char *str)
# Start isPalindrom Function


strispalindrom:
	addiu $a1, $a0, 0 		# Kopie der Startadresse des Strings
	addiu $a2, $a0, 0		# Wird für die Endadresse verwendet
	
loopPalinHoch:
	lb $t0, ($a2)			# Laden des AsciiZeichens
	beqz $t0, subPalin		# Wenn $a2 gleich 0 ist, dann wird zum eigentlichen Umdrehen gesprungen
	addiu $a2, $a2, 1		# Es wird hochgezaehlt bis das Ende des Strings erreicht wurde, der mit einer Null terminiert
	j loopPalinHoch

subPalin:
	addiu $a2, $a2, -1		# Damit das letzte Zeichen erreicht wird, weil der Zeiger auf dem Zeichen danach ist

palinCheck:
	bleu $a2, $a1, jumpbackPalin	# Wenn die $a2 und die $a1 sich in der Mitte treffen oder $a2 unter $a1 fällt dann Endet die Funktion
	lbu $t0, ($a1)			# Laden der Buchstaben in Registern
	lbu $t1, ($a2)			# s.o.

	seq $a3, $t0, $t1		# If $t1 = $t0 dann wird $a3 auf 1 gesetzt, sonst 0
	beq $a3, $0, jumpbackPalin	# Jumpback falls false
	
	addiu $a1, $a1, 1		# Erhöhen der Adresse
	addiu $a2, $a2, -1		# Erniedrigen der Adresse
	j palinCheck
	
	
jumpbackPalin:
	move $s0, $a3			# In $s0 soll der Rückgabewert gespeichert werden
	jr $31

# End isPalindrom Function
