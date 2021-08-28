# WAP to display content of an initialized array
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
	la	 $a0, _prompt
	li	 $v0, 4
	syscall
	la	 $t1, _array	# Loading address of the array
	li	 $t0, 0			# Initializing counter to 0
loop:
	lw	 $t2, ($t1)		# Getting value 
	move $a0, $t2
	li	 $v0, 1
	syscall
	
	li	 $a0, ' '
	li	 $v0, 11
	syscall
	
	addi $t1, $t1, 4	# Moving pointer to next element WORD=4
	addi $t0, $t0, 1	# Incrementing counter
	ble  $t0, 4, loop	# Iterating loop
	jr 	 $ra
	
############################
#        DATA
############################

	.data
_array:
	.word 5, 7 8, 9, 2
_prompt:
	.asciiz "Array content: "
