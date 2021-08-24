#
# WAP to display all divisors of an input number
#
#	If N is 24 [NOTE: N must be +ve integer]
#   Output would be 1 2 3 4 6 8 12
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
	
	li	 $t0, 1				# Counter
	
	div  $t2, $t1, 2		# To loop upto half of the input number
	
	ble  $t1, 0, end_line	# If user input is zero or negative
	
	la 	 $a0, _result		# Displaying Result Prompt
	li	 $v0, 4
	syscall
	
loop:						# Starting point of the Loop
	
	rem  $t3, $t1, $t0
	bne  $t3, 0, cont
	
	
	move $a0, $t0
	li	 $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
cont:
	addi $t0, $t0, 1
	ble	 $t0, $t2, loop		# Continiouing loop if it is less than equal value in $t1
	
end_line:

	li 	$v0, 0
	jr	 $ra				# Quiting program
	
	
############################
#        DATA
############################

	.data
	
_prompt:
	.asciiz "Enter value of n: "
_result:
	.asciiz "Divisors are: "
