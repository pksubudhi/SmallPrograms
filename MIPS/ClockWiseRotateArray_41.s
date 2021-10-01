ARRAY_SIZE=10

	.text
main:
	addiu $sp, $sp, -4
	sw   $ra, ($sp)
	
	la   $a0, prompt1
	li   $v0, 4
	syscall
	
	la   $t0, arr
	li   $t1, 1
first_loop:
	lw  $a0, ($t0)
	li  $v0, 1
	syscall
	
	li  $a0, ' '
	li  $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARRAY_SIZE, first_loop
	
	la   $a0, arr
	jal  rotate_arr
	
	la   $a0, prompt2
	li   $v0, 4
	syscall
	
	la   $t0, arr
	li   $t1, 1
result_loop:
	lw  $a0, ($t0)
	li  $v0, 1
	syscall
	
	li  $a0, ' '
	li  $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARRAY_SIZE, result_loop
	
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	jr	 $ra

rotate_arr:
	addiu $sp, $sp, -4
	sw   $ra, ($sp)
	
	move $t0, $a0
	move $t1, $a0
	lw   $t2, ($t1)		# Ye jo pehle rakhe he
	addi $t1, $t1, 4
	
	li   $t3, 1
fun_loop:
	lw   $t4, ($t1)
	sw   $t4, ($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t3, $t3, 1
	
	blt  $t3, ARRAY_SIZE, fun_loop
	
	sw   $t2, ($t0)
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	jr   $ra
			
	.data
	
prompt1:
	.asciiz "Content of array: "
prompt2:
	.asciiz "\nContent of array after rotation: "
arr:
	.word 5, 6, 2, 8, 5, 3, 6, 2, 1, 8
