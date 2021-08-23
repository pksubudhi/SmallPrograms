
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
	li	 $t0, 10			# Initialising register $t0
	li 	 $t1, 20			# Initialising register $t1
	
	la	 $a0, _before_swap	# Displying Prompt
	li 	 $v0, 4
	syscall
	
	move $a0, $t0			# Displying first number
	li 	 $v0, 1
	syscall
	
	li 	 $a0, ' '			# A space bettwen two numbers
	li 	 $v0, 11
	syscall
	
	move $a0, $t1			# Displaying second number
	li 	 $v0, 1
	syscall
	
	# Swapping
	
	add $t0, $t0, $t1		# Swapping value in two register $t0, and $t1
	sub $t1, $t0, $t1
	sub $t0, $t0, $t1
	
	li 	 $a0, '\n'			# A new line
	li 	 $v0, 11
	syscall
	
	la	 $a0, _after_swap	# Prompt after swapping
	li 	 $v0, 4
	syscall
	
	move $a0, $t0			# Displaying First nunber after swapping
	li 	 $v0, 1
	syscall
	
	li 	 $a0, ' '			# A space in between
	li 	 $v0, 11
	syscall
	
	move $a0, $t1			# Displaying second number
	li 	 $v0, 1
	syscall
	
	li $v0, 0
	jr $ra
	
	
############################
#        DATA
############################

	.data
	
_before_swap:
	.asciiz "Numbers are: "
_after_swap:
	.asciiz "After swapping numbers are: "
