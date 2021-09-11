# WAP to check if the number is Palindrome or not
# 
# If a number after it's reverse ordering of digit gives us the same number then
# it is called as Palindrome Number
#
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Early Sep'21
#

############################
#         CODE
############################
	.text
main:
	la	 $a0, prompt
	li 	 $v0, 4
	syscall
	
	li   $v0, 5				# Reading a number
	syscall
	
	move $t0, $v0			# Input number in $t0
	move $t1, $t0			# A copy of the input number in $t1
	
	li   $t2, 0				# To store reverse number
loop:
	rem  $t3, $t0, 10		# Get last digit by taking remainer (base 10)
	mul  $t2, $t2, 10		# Multiply the result register by 10
	add  $t2, $t2, $t3		# Add remainder
	div  $t0, $t0, 10		# Divide the input by 10 to remove last digit
	bgt  $t0, 0, loop		# Loop as long as $t0 contain a value > ZERO
	
	bne  $t2, $t1, not_palindrome
	
	la	 $a0, palindrome_result
	li 	 $v0, 4
	syscall
	
	b end_line
not_palindrome:
	la	 $a0, not_palindrome_result
	li 	 $v0, 4
	syscall
	
end_line:
	jr $ra
############################
#         DATA
############################
	.data
prompt:
	.asciiz "Enter a Number: "
palindrome_result:
	.asciiz "The input number is Palindrome!"
not_palindrome_result:
	.asciiz "The input number is not Palindrome!"
