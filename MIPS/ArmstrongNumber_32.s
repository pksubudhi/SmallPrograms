# WAP to check if the input number is Armstrong Number or not
# 
# If sum of cubic of digits is equal to the number itself, then it is Armstrong
#
# Example 153
# Cubic of 1, 5, 3 are 1, 125, 27. If we sum up 1+125+27 we get 153
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
	
	move $t0, $v0			# Input number N in $t0 
	move $t1, $t0			# Take a copy of it in $t1
	li   $t2, 0				# To store result
loop:
	rem  $t3, $t0, 10		# Taking last digit
	mul  $t4, $t3, $t3
	mul  $t4, $t4, $t3
	add  $t2, $t2, $t4
	div  $t0, $t0, 10		# Removing last digit
	bgt  $t0, 0, loop		# Continue until $t0 has a value > ZERO
	
	bne  $t1, $t2, not_armstrong
	
	la	 $a0, armstrong_result
	li 	 $v0, 4
	syscall
	
	b end_line
not_armstrong:
	la	 $a0, not_armstrong_result
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
armstrong_result:
	.asciiz "The input number is ArmStrong!"
not_armstrong_result:
	.asciiz "The input number is not ArmStrong!"
