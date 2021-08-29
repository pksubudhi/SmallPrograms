# WAP to reverse ordering of elements in an array
#	
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CONSTANTS
############################

TOT_ELEMENTS = 10


############################
#         CODE
############################

main:

	# PART 1: Displaying the array
	
	la	 $a0, _prompt
	li	 $v0, 4
	syscall
	
	la	 $t1, _array					# Loading address of the array
	li	 $t0, 0							# Initializing counter to 0
	
disp_loop:
	lw	 $t2, ($t1)						# Getting value 
	move $a0, $t2
	li	 $v0, 1
	syscall
	
	li	 $a0, ' '
	li	 $v0, 11
	syscall

	addi $t1, $t1, 4					# Moving pointer to next element WORD=4
	addi $t0, $t0, 1					# Incrementing counter
	blt  $t0, TOT_ELEMENTS, disp_loop	# Iterating loop
	
	# PART 2: Re-ordering element position
	
	la	 $t1, _array					# Loading address of the array
	la	 $t2, _array					# Loading address of the array
	
	li 	 $t3, TOT_ELEMENTS
	addi $t3, $t3, -1					# (TOT_ELEMENTS - 1) * 4 [Word- 32 bit]
	mul  $t3, $t3, 4
	
	add  $t2, $t2, $t3					# Loading address of last elemenet
	
	li   $t3, TOT_ELEMENTS				# Re-initialising $t3 to set final count
	div  $t3, $t3, 2
	addi $t3, $t3, -1					# To process the loop just half of the element
	li	 $t0, 0							# Initializing counter to 0
	
swap_loop:
	lw   $t4, ($t1)
	lw   $t5, ($t2)
	
	sw   $t4, ($t2)
	sw	 $t5, ($t1)
	
	addi $t1, $t1, 4
	addi $t2, $t2, -4
	
	addi $t0, $t0, 1
	
	ble  $t0, $t3, swap_loop
	
	# PART 3: Displaying the result array
	
	la	 $a0, _result
	li	 $v0, 4
	syscall
	
	la	 $t1, _array					# Loading address of the array
	li $t0, 0
disp_result_loop:
	lw	 $t2, ($t1)						# Getting value 
	move $a0, $t2
	li	 $v0, 1
	syscall
	
	li	 $a0, ' '
	li	 $v0, 11
	syscall

	addi $t1, $t1, 4					# Moving pointer to next element WORD=4
	addi $t0, $t0, 1					# Incrementing counter
	blt  $t0, TOT_ELEMENTS, disp_result_loop	# Iterating loop
		
	jr 	 $ra
	
############################
#        DATA
############################

	.data
_array:
	.word 8, 5, 4, 7 8, 1, 6, 9, 5, 2	# Initialized array of 10 elements
_prompt:
	.asciiz "Original Array content: "
_result:
	.asciiz "\nReverse array is: "
