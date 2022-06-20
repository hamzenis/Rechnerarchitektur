.data
ausgabe1: .asciiz "Geben Sie einen String ein:"
ausgabe2: .asciiz "Geben Sie einen Char ein:"
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
	li $v0, 12
			


# int ncstr(char *str, char c)
# Start of ncstr

ncstr:
