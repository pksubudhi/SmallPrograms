#
# WAP to display the following pattern
#
#	1 0 0 0 0 0
#   0 1 0 0 0 0
#   0 0 1 0 0 0
#   0 0 0 1 0 0
#   0 0 0 0 1 0
#   0 0 0 0 0 1 
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
	bne  $t0, $t1, set_zero
	li   $a0, 1
	b plot_char
set_zero:
	li   $a0, 0			# Moving value to $a0
plot_char:
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
	ble	 $t0, 6, outer_loop	# Continiouing loop if it is less than equal 10
	
	li 	$v0, 0
	jr	 $ra				# Quiting program
