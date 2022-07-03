.data
z1:   .word 0
n1:   .word 0

aussage1: .asciiz "\nGeben Sie Ihren Zaehler ein: "
aussage2: .asciiz "\nGeben Sie Ihren Nenner ein: "
aussage3: .asciiz "\nFehler Nenner = 0"
dialog: .asciiz "Wollen Sie das Programm erneuert ausführen?"

.text

main:	
	# Print String
	la $a0, aussage1
	li $v0, 4
	syscall
	
	# Read int 
	li $v0, 5
	syscall
	move $t8, $v0		# $t8 beinhaltet Zaehler

	# Print String
	la $a0, aussage2
	li $v0, 4
	syscall
	
	# Read int 
	li $v0, 5
	syscall
	move $t9, $v0		# $t9 beinhaltet Nenner
	
	# Laden der Argumente und Aufruf der Funktion
	move $a0, $t8		# Zaehler
	move $a1, $t9		# Nenner
	la $a2, z1		# Adresse von z1
	la $a3, n1		# Adresse von n1
	jal reduce_fraction
	move $t0, $v0 		# Return Wert speichern
	beqz $t0, fehler	# Falls Return Wert 0 (Wenn Nenner = 0)
	
ende:
	li $v0, 50
	la $a0, dialog
	syscall
	beqz $a0, main
	li $v0, 10
	syscall
	
# Wenn $v0 = 0 dann Fehler Aussage
fehler:
	# Print String
	la $a0, aussage3
	li $v0, 4
	syscall
	j ende

# int reduce_fraction(int z, int n, int *z1, int *n1)

reduce_fraction:
	beqz $a1, jumpBackZero
	
	# Retten von $ra in Stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# Jump zu Euklid
	jal euklid
	
	# Moven des Ergebnisses von Euklid (int t == $t0)
	move $t0, $v0
	
	# Wiederherstellen von $ra und Stack
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	# Div von z1 und n1
	div $t8, $t0
	mflo $t1
	div $t9, $t0
	mflo $t2
	
	# Speichern der Ergebnisse in z1 und n1
	sw $t1, ($a2)
	sw $t2, ($a3)
	
	# Rückgabe von $t0 (int t) vorbereiten
	move $v0, $t0

	
# Normaler Jumpback
jumpback:
	jr $31
	
# Falls der Nenner 0 ist Jumpback
jumpBackZero:
	li $v0, 0
	jr $31
	
	

# Code aus prog5.1c.asm (Optimierung Möglich)
euklid:

        add $2, $0, $5
        beq $4, $0, finish
        
    z5:
        beq $5, $0, z9

    z6a:
        slt $t7, $5, $4
        bne $t7, $0, z6b
        
    z7a:
        beq $t7, $0, z7b

    z8:
        j z5			

    z6b:
        subu $4, $4, $5
        j z7a

    z7b:
        subu $5, $5, $4
        j z8

    z9:
        add $2, $4, $0

    finish:
        jr $31
