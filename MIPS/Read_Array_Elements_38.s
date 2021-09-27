#
# WAP in which declare an array of 10 integes and read all 10 elements
#
#

	.text
main:
	la	 $a0, prompt
	li	 $v0, 4
	syscall
	
	la	 $t0, arr	# Base Address of array
	li	 $t1, 1		# Counter
	
loop:
	li	$v0, 5
	syscall
	
	move $t2, $v0
	
	sw  $t2, ($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	ble  $t1, 10, loop
	
	# DISPALYING ARRAY
	la	 $a0, result
	li	 $v0, 4
	syscall
	
	la	 $t0, arr	# Base Address of array
	li	 $t1, 1		# Counter
	
disp_loop:
	lw   $t2, ($t0)
	
	move $a0, $t2
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	ble  $t1, 10, disp_loop
	
	jr   $ra
	
	.data
arr:
	.word 10
prompt: .asciiz "Type 10 integers: "
result: .asciiz "\nArray Content: "
