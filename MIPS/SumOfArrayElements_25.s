# WAP to calculate sum of all array elements
#	
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
		
	la	 $t1, _array	# Loading address of the array
	li	 $t0, 0			# Initializing counter to 0
	#li	 $t2, 0
	li   $t3, 0
loop:
	lw	 $t2, ($t1)
	add	 $t3, $t3, $t2		# Getting value 
	addi $t1, $t1, 4	# Moving pointer to next element WORD=4
	addi $t0, $t0, 1	# Incrementing counter
	blt  $t0, 10, loop	# Iterating loop
	
	la	 $a0, _result	# Displaying result prompt
	li	 $v0, 4
	syscall
	
	move $a0, $t3		# Displaying big value
	li   $v0, 1
	syscall
	
	jr 	 $ra
	
############################
#        DATA
############################

	.data
_array:
	.word 8, 5, 4, 7 8, 1, 6, 9, 5, 2	# Initialized array of 10 elements

_result:
	.asciiz "\nSum of array element is: "
