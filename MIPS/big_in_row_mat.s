# Big element in each row of a 3x4 matrix
ROWS = 3
COLS = 4 
	.text
main:
	la   $a0, prompt
	li   $v0, 4
	syscall
	
	la	 $t0, matrix
	li   $t1, 0
	
outer_loop:
	li   $t2, 0
inner_loop:

	move $t3, $t1
	mul  $t3, $t3, COLS
	add  $t3, $t3, $t2
	mul  $t3, $t3, 4
	add  $t3, $t3, $t0
	
	lw   $a0, ($t3)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t2, $t2, 1
	blt  $t2, COLS, inner_loop
	
	li   $a0, '\n'
	li   $v0, 11
	syscall
	
	addi $t1, $t1, 1
	blt  $t1, ROWS, outer_loop
	
	li   $t1, 0
	
big_outer_loop:
	li   $t2, 0
	
	move $t3, $t1
	mul  $t3, $t3, COLS
	add  $t3, $t3, $t2
	mul  $t3, $t3, 4
	add  $t3, $t3, $t0
	
	lw   $t4, ($t3)   
big_inner_loop:

	move $t3, $t1
	mul  $t3, $t3, COLS
	add  $t3, $t3, $t2
	mul  $t3, $t3, 4
	add  $t3, $t3, $t0
	
	lw   $t5, ($t3)
	
	ble  $t5, $t4, next_step
	move $t4, $t5
next_step:
	
	addi $t2, $t2, 1
	blt  $t2, COLS, big_inner_loop
	
	la   $a0, result1
	li   $v0, 4
	syscall
	
	move $a0, $t1
	li   $v0, 1
	syscall
	
	la   $a0, result2
	li   $v0, 4
	syscall

	move $a0, $t4
	li   $v0, 1
	syscall
	
	addi $t1, $t1, 1
	blt  $t1, ROWS, big_outer_loop
	

	jr	 $ra
	.data
prompt:
	.asciiz "\nMatrix Content: \n"
result1:
	.asciiz "\nBig in the Row: "
result2:
	.asciiz " is: "
matrix:
	.word 3, 6, 2, 8, 9, 3, 1, 5, 6, 7, 7, 2
