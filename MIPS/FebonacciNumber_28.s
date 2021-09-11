# Display Febonacci Number of an input position index
#
# A febonacci series is like 0 1 1 2 3 5 8 13 21 34 55 and so one
# 
# In this program if user types his position index as 10 then
# It should show the 10th value in the Febonacci series which is 34
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

	la	 $a0, prompt
	li 	 $v0, 4
	syscall
	
	li   $v0, 5				# Reading input position index
	syscall
	
	move $t0, $v0
	addi $t0, -2			# Reducing to the count by 2 because we have 
							# following two fixed value
							
	li	 $t1, 0				# Previous of Previous [FIXED]
	li	 $t2, 1				# Previous Valus [FIXED]
	li	 $t3, 1				# Counter Variable
	
loop:
	add  $t4, $t1, $t2		# Current = prev + Prev of Prev
	move $t1, $t2			# Prev of Prev <- Prev
	move $t2, $t4			# Prev <- Current
	
	addi $t3, $t3, 1		# Decrementing counter
	ble  $t3, $t0, loop		# Continuing to loop
	
	la	 $a0, result
	li 	 $v0, 4
	syscall
	
	move $a0, $t4
	li   $v0, 1
	syscall
	
	jr $ra
############################
#         DATA
############################
	.data
prompt:
	.asciiz "Enter Position Index: "
result:
	.asciiz "Febonacci Number is: "
