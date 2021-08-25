#
# WAP to check if the input number is Palindrome or not
#
#	If N is 1441 [NOTE: N must be +ve integer]
#   Output would be Palindrome NUmber
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
	move $t4, $v0
	li	 $t2, 0				# To store result in $t2

	ble  $t1, 0, end_line	# If user input is zero or negative
loop:						# Starting point of the Loop
	
	mul  $t2, $t2, 10
	rem  $t3, $t1, 10
	add  $t2, $t2, $t3
	div  $t1, $t1, 10
	
	bgt  $t1, 0, loop
	
	beq  $t2, $t4, palindrome_number
	la   $a0, _not_palindrome_result
	li	 $v0, 4
	syscall
	b end_line
palindrome_number:
	la   $a0, _palindrome_result
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
_palindrome_result:
	.asciiz "\nInput Number is Palindrome!"
_not_palindrome_result:
	.asciiz "\nInput Number is not a Palindrome!"
