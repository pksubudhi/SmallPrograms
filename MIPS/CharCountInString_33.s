#
# WAP to find out number of characters in a given string
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
	la	 $a0, _prompt
	li	 $v0, 4
	syscall
	
	la	 $t0, _my_string
	
	move $a0, $t0
	li	 $v0, 4
	syscall
	li   $t1, -1
loop:
	lb   $t2, ($t0)
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	bne  $t2, 0, loop
	
	la	 $a0, _result_prompt
	li	 $v0, 4
	syscall
	
	move $a0, $t1
	li   $v0, 1
	syscall
	
	jr	 $ra
############################
#         DATA
############################

	.data
_prompt:
	.asciiz "User string is: "
_my_string:
	.asciiz "Hello India"
_result_prompt:
	.asciiz "\nTotal number of characters is: "
