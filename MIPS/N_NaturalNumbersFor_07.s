#
# WAP to display initial N natural numbers side by side. i.e. Where N is user input
#
#	1 2 3 4 5 6 7 8 9 10
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

	li	 $t0, 1				# Initializing counter to 1
loop:						# Starting point of the Loop
	move $a0, $t0			# Moving value to $a0
	li	 $v0, 1				# Printing
	syscall
	
	li   $a0, ' '			# Printing a space
	li 	 $v0, 11
	syscall
	
	addi $t0, $t0, 1		# Incrementing counter
	ble	 $t0, $t1, loop		# Continiouing loop if it is less than equal value in $t1
	
	li 	$v0, 0
	jr	 $ra				# Quiting program
	
	
############################
#        DATA
############################

	.data
	
_prompt:
	.asciiz "Enter value of n: "
