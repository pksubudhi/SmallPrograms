#
# WAP to read a string and then count number of characters in a given string
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
	la	 $a0, _prompt_1
	li	 $v0, 4
	syscall
	
	la	 $a0, _my_string
	li	 $v0, 8
	syscall
	
	la	 $a0, _prompt_2
	li	 $v0, 4
	syscall
	
	la	 $a0, _my_string
	li	 $v0, 4
	syscall
	
	la	 $t0, _my_string
	li   $t1, -1
	la   $t3, _tar_string
	move $t4, $t3
loop:
	lb   $t2, ($t0)
	sb   $t2, ($t3)
	

	addi $t0, $t0, 1
	addi $t3, $t3, 1
	
	addi $t1, $t1, 1
	bne  $t2, 0, loop
	
	la	 $a0, _result_prompt
	li	 $v0, 4
	syscall
	
	move $a0, $t1
	li   $v0, 1
	syscall
	
	li   $a0, '\n'
	li    $v0, 11
	syscall
	
	move $a0, $t4
	li   $v0, 4
	syscall
	
	jr	 $ra
############################
#         DATA
############################

	.data
_prompt_1:
	.asciiz "Type a string: "
	
_prompt_2:
	.asciiz "Input string is: "
	
_result_prompt:
	.asciiz "\nTotal number of characters is: "
	
	# Array is declared here of maximum size 100
_my_string:
	.space 100
_tar_string:
	.space 100
	

