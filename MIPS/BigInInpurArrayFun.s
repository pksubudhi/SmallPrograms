#
# WAP to read 10 integers to an integer array and find out the biggest among array elements
# through a separate function
#

ARRAY_SIZE=10

	##################
	# main() function
	###################
	
	.text
main:
	
	addiu $sp, $sp, -4
	sw	 $ra, ($sp)
	
	la	 $t0, arr		# Base address of the array
	li	 $t1, 1			# Counter initialized
	
	la	 $a0, prompt	# Loading prompt String
	li	 $v0, 4			# Displaying Prompt
	syscall
	
input_loop:				# Starting loop
	
	li	 $v0, 5			# Reading Data
	syscall
	
	sw   $v0, ($t0)		# Storing it at appropriate position
	addi $t0, $t0, 4	# Moving pointer to next location
	addi $t1, $t1, 1	# Incrementing counter
	ble  $t1, ARRAY_SIZE, input_loop
	
	la  $a0, arr		# Parameter to function 'big'
	
	jal big				# Calling function ''big''
	
	move $t0, $v0		# Return value from function 'big'
	
	la	 $a0, result	# Loading result String
	li	 $v0, 4			# Displaying result Prompt
	syscall
	
	move $a0, $t0		# Result in $a0
	li   $v0, 1			# Displaying it
	syscall
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	
	jr   $ra
	
	##################
	# Big() function
	###################
	.text
big:
	addiu $sp, $sp, -4
	sw	 $ra, ($sp)
	
	move $t0, $a0		# Collecting array address passed as parameter in $t0
	lw   $t2, ($t0)		# getting first data in $t2
	addi $t0, $t0, 4
	
	li   $t1, 2			# Initializing counter for second element
	
big_loop:				# Loop starts
	lw   $t3, ($t0)		# Getting next element
	ble  $t3, $t2, next_line	# Checking if <=
	move $t2, $t3		# Keepting it in $t2 (if looks big)
	
next_line:
	addi $t0, $t0, 4	# Moving pointer to next element
	addi $t1, $t1, 1	# Incrementing counter
	ble  $t1, ARRAY_SIZE, big_loop
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	
	move $v0, $t2
	
	jr   $ra
	
	.data
prompt:
	.asciiz "Type 10 integers: "
result:
	.asciiz "\nResult is: "
	
arr:
	.word ARRAY_SIZE	

