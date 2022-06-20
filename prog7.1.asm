.data
ausgabe1: .asciiz "Geben Sie einen String ein:"
ausgabe2: .asciiz "Geben Sie einen Char ein:"
ausgabe3: .asciiz "Moechten Sie das Programm noch einmal laufen lassen? (1 = Yes / 0 = No):"
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
	move $s0, $v0		# Speichern des Char an ein "sicheres" Register
	
	la $a0, buffer
	jal ncstr
	jal menue
	

	
ende:
	j ende
	
menue:	
				# Ausgabe der Aufforderung
	li $v0, 4
	la $a0, ausgabe3	
	syscall
				# Eingabe eines Integers wegen der Aufforderung die gestellt wurde
	li $v0, 5		# Code zur Eingabe eines Int
	syscall
	move $t0, $v0		# Speichern des Ints an ein "sicheres" Register
	
	bnez $t0, main		# Falls Die eingabe keiner 0 entspricht springt es zur main
	jr $31			# Ansonsten springt es zurück 
	
	
	
# int ncstr(char *str, char c)
# Start of ncstr

ncstr:
	addiu $a1, $a0, 0 	# Kopie der Adresse
	add $s1, $0, $0		# Leeren VON $s1
	
loopNcstr:
	lbu $t0, ($a1)		# Laden des Asciizeichen in $t0
	beqz $t0, jumpbackNcstr	# Falls das Asciizeichen eine 0 ist, wird das Programm beendet
	addiu $a1, $a1, 1	# Erhöhen der Adresse
	seq $t1, $t0, $s0	# $t1 wird auf 1 gesetzt, wenn das Asciizeichen in $t0 und der eingegebene Char gleich sind
	bnez $t1, zaehler	# Falls das Register nicht 0 ist
	j loopNcstr
	
zaehler:
	addi $s1, $s1, 1	# Zaehler der die Anzahl der gleichen Buchstaben speichert ($s1)
	j loopNcstr	

jumpbackNcstr:
	jr $31












