#
# WAP to Reverse in order of digits in an input number
#
#	If N is 3456 [NOTE: N must be +ve integer]
#   Output would be 6543
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

	ble  $t1, 0, end_line	# If user input is zero or negative
loop:						# Starting point of the Loop
	
	mul $t2, $t2, 10
	rem $t3, $t1, 10
	add $t2, $t2, $t3
	div $t1, $t1, 10
	
	bgt $t1, 0, loop
	
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
	.asciiz "\nSum of digit is: "
