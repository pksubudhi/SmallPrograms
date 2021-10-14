# Replace 0 or 1 depending upon even or odd element in the 5x5 matrix
# and then check if the result matrix is unit matrix or not
#
#
# Let the matrix is 
# 5 2 8 6 4 
# 2 3 6 6 8 
# 4 4 7 2 4 
# 8 6 4 1 6 
# 2 4 2 8 5

N = 5


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
	move $t3, $t1
	mul  $t3, $t3, N
	add  $t3, $t3, $t2
	mul  $t3, $t3, 4
	add  $t3, $t3, $t0
	
	lw   $a0, ($t3)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	# Saving 0 or 1
	lw   $t4, ($t3)
	rem  $t4, $t4, 2
	sw   $t4, ($t3)
	
	addi $t2, $t2, 1
	blt  $t2, N, inner_loop
	
	li   $a0, '\n'
	li   $v0, 11
	syscall
	
	addi $t1, $t1, 1
	blt  $t1, N, outer_loop
	
	# Showing Bit matrix
	
	la	 $a0, result
	li   $v0, 4
	syscall
	
	li   $t1, 0
result_outer_loop:
	li   $t2, 0
result_inner_loop:

	move $t3, $t1
	mul  $t3, $t3, N
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
	blt  $t2, N, result_inner_loop
	
	li   $a0, '\n'
	li   $v0, 11
	syscall
	
	addi $t1, $t1, 1
	blt  $t1, N, result_outer_loop
	
	li   $t1, 0
check_outer_loop:
	li   $t2, 0
check_inner_loop:

	move $t3, $t1
	mul  $t3, $t3, N
	add  $t3, $t3, $t2
	mul  $t3, $t3, 4
	add  $t3, $t3, $t0
	
	lw   $t4, ($t3)
	beq  $t1, $t2, check_for_one
	beq  $t4, 0, continue_loop
	b show_not_unit
check_for_one:
	beq  $t4, 1, continue_loop
	b show_not_unit
continue_loop:
	addi $t2, $t2, 1
	blt  $t2, N, check_inner_loop
	
	addi $t1, $t1, 1
	blt  $t1, N, check_outer_loop
	
	la   $a0, unit_matrix
	li   $v0, 4
	syscall
	
	b end_part
show_not_unit:
	la   $a0, not_unit_matrix
	li   $v0, 4
	syscall
end_part:

	jr	 $ra
	.data
prompt:
	.asciiz "\nMatrix is:\n"
result:
	.asciiz "\nBit Matrix is:\n"
unit_matrix:
	.asciiz "\nThe above matrix is Unit matrix."
not_unit_matrix:
	.asciiz "\nAlas! Not Unit Matrix!"
matrix:
	.word 5, 2, 8, 6, 4, 2, 3, 6, 6, 8, 4, 4, 7, 2, 4, 8, 6, 4, 1, 6, 2, 5, 2, 8, 5
