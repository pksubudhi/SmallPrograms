# WAP to check if the input number is perfect or not
# 
# Sum of all divisor including 1 (Excluding the number itself) would be same
# as the number itself
# 
# Example: 28 has the following divisors 1, 2, 4, 7, 14
# Sum of allthese is equal to 28 (the number itself)
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
	div  $t1, $t0, 2		# N = N/2
	li   $t2, 2				# Using counter thats starts from 2 [To find all divisors]
	li	 $t3, 1				# To sum up all divisors
loop:
	rem  $t4, $t0, $t2
	bne  $t4, 0, move_on
	add  $t3, $t3, $t2
move_on:
	addi $t2, $t2, 1
	ble  $t2, $t1, loop
	bne  $t3, $t0, not_perfact
	
	la	 $a0, perfect_result
	li 	 $v0, 4
	syscall
	
	b end_line
not_perfact:
	la	 $a0, not_perfect_result
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
perfect_result:
	.asciiz "The input number is Perfect!"
not_perfect_result:
	.asciiz "The input number is not Perfect!"
