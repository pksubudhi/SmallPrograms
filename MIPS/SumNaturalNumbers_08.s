#
# WAP to sum-up N natural numbers
#
#	If N is 7 [NOTE: N must be +ve integer]
#   Output would be (1+2+3+4+5+6+7) = 28
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
	la 	 $a0, _prompt		# Displaying Prompt
	li	 $v0, 4
	syscall
	
	li	 $v0, 5				# Reading input N
	syscall
	move $t1, $v0			# Moving it to $t1
	
	li	 $t2, 0				# To store result in $t2
	li	 $t0, 1				# Initializing counter to 1

	ble  $t1, 0, end_line	# If user input is zero or negative
loop:						# Starting point of the Loop
	
	add  $t2, $t2, $t0		# Adding current value
	addi $t0, $t0, 1		# Incrementing counter
	ble	 $t0, $t1, loop		# Continiouing loop if it is less than equal value in $t1
	
end_line:

	la 	 $a0, _result		# Displaying Result Prompt
	li	 $v0, 4
	syscall
	
	move $a0, $t2			# Displaying result
	li	 $v0, 1
	syscall
	
	li 	$v0, 0
	jr	 $ra				# Quiting program
	
	
############################
#        DATA
############################

	.data
	
_prompt:
	.asciiz "Enter value of n: "
_result:
	.asciiz "\nSum is: "
