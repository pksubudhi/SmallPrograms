#
# WAP to display the following pattern
#
#	1 1 1 1 1 1 
#   2 2 2 2 2 2
#   3 3 3 3 3 3
#   4 4 4 4 4 4
#   5 5 5 5 5 5
#
# 	P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# 	Web: www.pksubudhi.com
# 	Mid Aug'21
#

############################
#         CODE
############################

main:
	li	 $t0, 1				# Initializing counter to 1
	
outer_loop:					# Starting point of the Loop
	li   $t1, 1				# Another counter for inner loop
inner_loop:
	move $a0, $t0			# Moving value to $a0
	li	 $v0, 1				# Printing
	syscall
	
	li   $a0, ' '			# Printing a space
	li 	 $v0, 11
	syscall
	addi $t1, $t1, 1
	ble  $t1, 6, inner_loop
	
	li   $a0, '\n'			# Printing a space
	li 	 $v0, 11
	syscall
	
	addi $t0, $t0, 1		# Incrementing counter
	ble	 $t0, 5, outer_loop	# Continiouing loop if it is less than equal 10
	
	li 	$v0, 0
	jr	 $ra				# Quiting program
