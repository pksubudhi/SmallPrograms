#
# WAP to sort an array [SELECTION SORT]
#
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Early Sep'21
#

############################
#         CODE
############################

ARRAY_SIZE = 10

	.text
main:
	la	 $t0, arr
	li	 $t1, 1
	
	la	 $a0, prompt
	li	 $v0, 4
	syscall
	
before_disp_loop:

	lw	 $t2, ($t0)
	
	move $a0, $t2
	li	 $v0,1
	syscall
	
	li	 $a0, ' '
	li	 $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARRAY_SIZE, before_disp_loop
	
	#SORTING 
	
	la	 $t0, arr
	la   $t1, arr
	li	 $t2, 1
outer_loop:
	lw   $t4, ($t0)		# Getting data of the element at current position
	move $t1, $t0
	addi $t1, $t1, 4	# Placing pointer at next element
	addi $t3, $t2, 1	# Counter updated for inner loop
inner_loop:
	
	lw   $t5, ($t1)
	
	bgt  $t5, $t4, next
	
	sw	 $t5, ($t0)
	sw   $t4, ($t1)
	lw	 $t4, ($t0)
next:
	addi $t1, $t1, 4
	addi $t3, $t3, 1
	ble  $t3, ARRAY_SIZE, inner_loop
	
	addi $t0, $t0, 4
	addi $t2, $t2, 1
	blt  $t2, ARRAY_SIZE, outer_loop
	
	la	 $t0, arr
	li	 $t1, 1
	
	la	 $a0, result
	li	 $v0, 4
	syscall
	
after_disp_loop:

	lw	 $t2, ($t0)
	
	move $a0, $t2
	li	 $v0,1
	syscall
	
	li	 $a0, ' '
	li	 $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARRAY_SIZE, after_disp_loop
	
	jr	 $ra
	
	.data
prompt:
	.asciiz "Array Content: "
result:
	.asciiz "\nArray after sorting: "
arr:
	.word 7, 3, 6, 1, 1, 5, 9, 4, 2, 6
