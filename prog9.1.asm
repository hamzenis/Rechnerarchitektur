.data

aussage1: .asciiz "\nGeben Sie Ihren p Double Wert ein: "
aussage2: .asciiz "\nGeben Sie Ihren q Double Wert ein: "



.text

main:
	# Print String
	la $a0, aussage1
	li $v0, 4
	syscall
	# Read Double
	li $v0, 7
	syscall
	# Move p in f13:f12
	mov.d $f12, $f0
	
	# Print String
	la $a0, aussage2
	li $v0, 4
	syscall
	# Read Double
	li $v0, 7
	syscall
	# Move q in f15:f14
	mov.d $f14, $f0
	



# unsigned int quadsolve(double p, double q)
quadsolve:
	
	
	
	
	
	
	
	
	
	
	
	
	
	