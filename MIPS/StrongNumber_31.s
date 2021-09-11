# WAP to check if the input number is Strong Number or not
# 
# Sum of digits of an iput number is equal to the number itself
#
# Example 145, it's digits are 1, 4 and 5. 
# Their factorials are 1, 24 and 120, if we add them we get 145
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
	
	# CALCULATING FACTORIAL
	li   $t4, 1				# To save factorial
fact_loop:
	mul  $t4, $t4, $t3		# Multiplying the num to factorial storage
	sub  $t3, $t3, 1		# Decerementing
	bgt  $t3, 1, fact_loop	# Loop unto to it has a value > 1
	
	add  $t2, $t2, $t4
	
	div  $t0, $t0, 10		# Removing last digit
	bgt  $t0, 0, loop		# Continue until $t0 has a value > ZERO
	
	bne  $t1, $t2, not_strong
	
	la	 $a0, strong_result
	li 	 $v0, 4
	syscall
	
	b end_line
not_strong:
	la	 $a0, not_strong_result
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
strong_result:
	.asciiz "The input number is Strong!"
not_strong_result:
	.asciiz "The input number is not Strong!"
