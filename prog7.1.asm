.data
ausgabe1: .asciiz "\nGeben Sie einen String ein:"
ausgabe2: .asciiz "\nGeben Sie einen Char ein:"
ausgabe3: .asciiz "\nMoechten Sie das Programm noch einmal laufen lassen?"
ausgabe4: .asciiz "\nDie Anzahl der Chars:"
buffer: .space 128

.text

main:
				# Ausgabe der Aufforderung
	li $v0, 4		# Code zum Ausgeben eines Strings
	la $a0, ausgabe1	
	syscall
	
				# Eingabe eines Strings
	li $v0, 8		# Code zum Eingeben eines Strings
	la $a0, buffer		# Speicheradresse unseres Strings
	la $a1, 128		# Max Groeße von dem String (0-127)
	syscall
	
				# Ausgabe der Aufforderung
	li $v0, 4		
	la $a0, ausgabe2	
	syscall
	
				# Eingabe zum Lesen eines Char
	li $v0, 12		# Code zum Einlesen eines Char
	syscall
	move $a1, $v0
	
	la $a0, buffer
	jal ncstr
	
	move $t0, $v0		# Moven der Rückgabe in $t0
	
				# Ausgabe der Aufforderung
	li $v0, 4		
	la $a0, ausgabe4
	syscall
				# Ausgabe Int
	li $v0, 1		
	la $a0, ($t0)
	syscall
	
	jal menue
	

	
ende:
	j ende
	
menue:	
				# Ausgabe der Aufforderung
	li $v0, 4
	la $a0, ausgabe3	
	syscall
				# Eingabe eines Integers wegen der Aufforderung die gestellt wurde
	li $v0, 50		# Code ConfirmDialog
	syscall
	
	beqz $a0, main		# Falls Die eingabe 0 entspricht springt es zur main
	jr $31			# Ansonsten springt es zurück 
	
	
	
# int ncstr(char *str, char c)
# Start of ncstr

ncstr:
	addiu $t2, $a0, 0 	# Kopie der Adresse
	add $v0, $0, $0		# Leeren von $v0
	
loopNcstr:
	lbu $t0, ($t2)		# Laden des Asciizeichen in $t0
	beqz $t0, jumpbackNcstr	# Falls das Asciizeichen eine 0 ist, wird das Programm beendet
	addiu $t2, $t2, 1	# Erhöhen der Adresse
	seq $t1, $t0, $a1	# $t1 wird auf 1 gesetzt, wenn das Asciizeichen in $t0 und der eingegebene Char gleich sind
	bnez $t1, zaehler	# Falls das Register nicht 0 ist
	j loopNcstr
	
zaehler:
	addi $v0, $v0, 1	# Zaehler der die Anzahl der gleichen Buchstaben speichert ($s1)
	j loopNcstr	

jumpbackNcstr:
	jr $31


