.data
	int1:		.word 0
	int2:		.word 0
	operator:	.word 0
	
	
	intpr1:		.asciiz "Enter first integer: "
	intpr2:		.asciiz "Enter second integer: "
	operation: 	.asciiz "Enter operation (1=+, 2=-, 3=*, 4=/): "
	space:		.asciiz "\n"
.text 

main: 
	#Print "Enter first integer: "
	li $v0, 4
	la $a0, intpr1
	syscall
	# Read input as an integer stored in $t0
	li $v0, 5
	la $t0, int1
	syscall
	move $t0, $v0
	sw $t0, int1
	
	#Print "Enter second integer: "
	li $v0, 4
	la $a0, intpr2
	syscall
	# Read input as an integer stored in $t1
	li $v0, 5
	la $t1, int2
	syscall
	move $t1, $v0
	sw $t1, int2
	
	# Print "Enter operation (1=+, 2=-, 3=*, 4=/): "
	li $v0, 4
	la $a0, operation
	syscall
	# Read input as an integer stored in $t2
	li $v0, 5
	la $t2, operator
	syscall
	move $t2, $v0
	sw $t2, operator
	
	# Compare the value of input $t2 to see what operation to perform 
	beq $t2, 1, addition
	beq $t2, 2, subtraction 
	beq $t2, 3, multiplication
	beq $t2, 4, division
		
	# Operation functions
	addition: 
		add $t3, $t0, $t1
		j result
		
	subtraction: 
		sub $t3, $t0, $t1
		j result
		
	multiplication: 
		mul $t3, $t0, $t1
		j result
		
	division:
		div $t3, $t0, $t1
		j result
		
		
	# Prints answer
	result: 
		li $v0, 1
		move $a0, $t3
		syscall
		# Prints blank space
		li $v0, 4
		la $a0, space
		syscall		
	j main 
	
	
	
