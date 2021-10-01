ARRAY_SIZE = 10

	.text
main:
	addiu $sp, $sp, -4
	sw   $ra, ($sp)
	
	la   $a0, prompt1
	li   $v0, 4
	syscall
	
	la   $t0, arr1
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
	
	la   $a0, prompt2
	li   $v0, 4
	syscall
	
	la   $t0, arr2
	li   $t1, 1
second_loop:
	lw  $a0, ($t0)
	li  $v0, 1
	syscall
	
	li  $a0, ' '
	li  $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARRAY_SIZE, second_loop
	
	la   $a0, arr1
	la   $a1, arr2
	la   $a2, target
	
	jal add_arr
	
	la   $a0, prompt3
	li   $v0, 4
	syscall
	
	la   $t0, target
	li   $t1, 1
target_loop:
	lw  $a0, ($t0)
	li  $v0, 1
	syscall
	
	li  $a0, ' '
	li  $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARRAY_SIZE, target_loop
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	jr	 $ra
	
	.text
	
add_arr:
	
	addiu $sp, $sp, -4
	sw   $ra, ($sp)
	
	move $t0, $a0	# First Array
	move $t1, $a1	# Second Array
	lw   $t6, ($t1)
	addi $t1, $t1, 4
	
	move $t2, $a2
	
	li   $t3, 1
	
fun_loop:
	
	beq  $t3, ARRAY_SIZE, next_line
	
	lw   $t4, ($t0)
	lw   $t5, ($t1)
	add  $t4, $t4, $t5
	
	sw   $t4, ($t2)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	
	j last_line
	
next_line:
	lw  $t4, ($t0)
	add $t4, $t4, $t6
	
	sw   $t4, ($t2)
	
	addi $t0, $t0, 4
	addi $t2, $t2, 4
	
last_line:
	addi $t3, $t3, 1
	ble  $t3, ARRAY_SIZE, fun_loop
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	jr	 $ra

	
	.data
	
prompt1:
	.asciiz "Content of first array: "
prompt2:
	.asciiz "\nContent of first array: "
prompt3:
	.asciiz "\nContent of first array: "
arr1:
	.word 5, 6, 2, 8, 5, 3, 6, 2, 1, 8
arr2:
	.word 8, 1, 2, 2, 4, 8, 3, 6, 5, 7
target:
	.word ARRAY_SIZE
	
	
