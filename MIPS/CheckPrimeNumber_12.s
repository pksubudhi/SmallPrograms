#
# WAP to check if the number is PRIME or not [To know more, please visit https://en.wikipedia.org/wiki/Prime_number]
#
# NOTE: If a number is either divisible by one or by itself none by other then it is called as Prime Number
#
#	If N is 13 [NOTE: N must be +ve integer]
#   Output would be "Prime Number""
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

	li	 $t0, 2				# Counter used to find Divisors
	div  $t2, $t1, 2		# To loop upto half of the input number
	ble  $t1, 1, end_line	# If user input is zero or negative

loop:
	
	rem  $t3, $t1, $t0
	beq  $t3, 0, result
	
	addi $t0, $t0, 1
	ble  $t0, $t2, loop
	
result:
	ble  $t0, $t2, not_a_prime
	
	la 	 $a0, _prime_result		# Displaying result
	li	 $v0, 4
	syscall
	
	b end_line
	
not_a_prime:
	la 	 $a0, _not_prime_result		# Displaying result
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
_prime_result:
	.asciiz "Prime Number!"
_not_prime_result:
	.asciiz "Not a Prime Number!"
	
