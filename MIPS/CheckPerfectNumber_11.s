#
# WAP to check if the number is perfect or not [To know more, please visit https://en.wikipedia.org/wiki/Perfect_number]
#
# NOTE: If Sum of all divisors excluding the number itself, is equal to the number itself then it is called as Perfect
#
#	If N is 6 [NOTE: N must be +ve integer]
#   Output would be 1+2+3 = 6
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
	
	li   $t4, 0
	
loop:						# Starting point of the Loop
	
	rem  $t3, $t1, $t0
	bne  $t3, 0, cont

	add $t4, $t4, $t0
	
cont:
	addi $t0, $t0, 1
	ble	 $t0, $t2, loop		# Continiouing loop if it is less than equal value in $t1
	
	bne  $t4, $t1, not_a_perfect
	
	la 	 $a0, _perfect_result		# Displaying result
	li	 $v0, 4
	syscall
	
	b end_line
	
not_a_perfect:
	la 	 $a0, _not_perfect_result		# Displaying result
	li	 $v0, 4
	syscall
	
end_line:

	li 	$v0, 0
	jr	 $ra				# Quiting program
	
	
############################
#        DATA
############################

	.data
	
_prompt:
	.asciiz "Enter value of n: "
_perfect_result:
	.asciiz "Perfect Number!"
_not_perfect_result:
	.asciiz "Not a Perfect Number!"
	
