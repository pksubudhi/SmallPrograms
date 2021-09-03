# WAP to read an integer and display its content in binary
#	
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
	la	 $a0, _prompt	# Displaying Input Prompt
	li	 $v0, 4
	syscall
	
	li	 $v0, 5			# Reading Input Number
	syscall
	
	move $t0, $v0		# Storing input in $t0
	
	li	 $t1, 1	
	li   $t2, 0x8000
loop:
	and  $t3, $t0, $t2

	beq  $t3, 0, print_zero
	li   $a0, 1
	li   $v0, 1
	syscall
	b next_part
	
print_zero:
	li   $a0, 0
	li   $v0, 1
	syscall
	
next_part:

	sra  $t2, $t2, 1
	addi $t1, $t1, 1
	ble  $t1, 16, loop
	
	jr 	 $ra
	
############################
#        DATA
############################

	.data

_prompt:
	.asciiz "Type an integer: "
_result:
	.asciiz "\nThe Binary vesion is: "
