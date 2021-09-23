#
# WAP to copy content of one string to another
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
	
	la 	 $a0, _prompt
	li	 $v0, 4
	syscall
	
	la 	 $a0, _my_string
	li	 $v0, 4
	syscall
	
	la	 $t0, _my_string
	la   $t1, _tar_string
	move $t3, $t1
	
	
loop:
	lb   $t2, ($t0)
	sb   $t2, ($t1)
	
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	
	bne  $t2, 0, loop
	
	la 	 $a0, _result
	li	 $v0, 4
	syscall
	
	la   $a0, _tar_string
	li	 $v0, 4
	syscall
	
	jr	 $ra
	
############################
#         DATA
############################

	.data
_prompt:
	.asciiz "Source string is: "
	
_result:
	.asciiz "\nTarget string is: "
	
_my_string:
	.asciiz "Hello India"
	
_tar_string:
	.byte 50
