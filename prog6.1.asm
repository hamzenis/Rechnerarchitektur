.data

str: .asciiz "TOLowerCASETeSt"
#str2: .asciiz "LageR"
#str3: .asciiz "RegaR"

.text

main:
	la $a0, str
	jal strtolower
	jal strturnaround
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
	lb $t0, ($a2)
	beqz $t0, subTurn		# Wenn $a2 gleich 0 ist, dann wird zum eigentlichen Umdrehen gesprungen
	addiu $a2, $a2, 1		# Es wird hochgezaehlt bis das Ende des Strings erreicht wurde, der mit einer Null terminiert
	j loopTurnHoch

subTurn:
	addiu $a2, $a2, -1
	
turnAroundloop:
	bleu $a2, $a1,  jumpbackTurnAr	# Wenn die $a2 und die $a1 sich in der Mitte treffen oder $a2 unter $a1 fällt dann Endet die Funktion
	lbu $t0, ($a1)			# Laden der Buchstaben in Registern
	lbu $t1, ($a2)			# s.o.

	sb $t1, ($a1)			# Einspeichern der Buchstaben an den Registern
	sb $t0, ($a2)			# s.o.
	
	addiu $a1, $a1, 1		# Erhöhen der Adressen
	addiu $a2, $a2, 1		# s.o.
	
	j turnAroundloop
	
jumpbackTurnAr:
	jr $31

# End TurnAroundFunction


