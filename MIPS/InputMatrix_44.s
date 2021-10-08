# Imput matrix

ROWS = 3
COLUMNS = 4
	.text
main:
	la	 $a0, prompt
	li   $v0, 4
	syscall
	
	la   $t0, matrix
	li   $t1, 0
outer_loop:
	li   $t2, 0
inner_loop:
	
	# Finding address of appropriate element
	
	move $t3, $t1
	mul  $t3, $t3, COLUMNS
	add  $t3, $t3, $t2
	mul  $t3, $t3, 4
	add  $t3, $t3, $t0
	
	li   $v0, 5
	syscall
	
	sw   $v0, ($t3)
	
	addi $t2, $t2, 1
	blt  $t2, COLUMNS, inner_loop
	addi $t1, $t1, 1
	blt  $t1, ROWS, outer_loop
	

	la	 $a0, result
	li   $v0, 4
	syscall
	
	la   $t0, matrix
	li   $t1, 0
result_outer_loop:
	li   $t2, 0
result_inner_loop:
	
	# Finding address of appropriate element
	
	move $t3, $t1
	mul  $t3, $t3, COLUMNS
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
	blt  $t2, COLUMNS, result_inner_loop
	
	li   $a0, '\n'
	li   $v0, 11
	syscall
	
	addi $t1, $t1, 1
	blt  $t1, ROWS, result_outer_loop
	
	jr   $ra
	
	.data
	
prompt:
	.asciiz "Type 12 elements: "
result:
	.asciiz "\nMatrix is...\n"
	
matrix:
	.word ROWS*COLUMNS
	
