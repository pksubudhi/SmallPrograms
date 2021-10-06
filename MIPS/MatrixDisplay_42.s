# WAP to display an initialized 3x4 matrix
# Oct'21
# P K Subudhu

ROWS=3
COLUMNS=4

	.text
main:
	
	
	la   $a0, result
	li   $v0, 4
	syscall
	
	la   $t2, arr
	
	li   $t0, 0
res_outer:
	li   $t1, 0
res_inner:
	move $t3, $t0			# Row-Number
	mul  $t3, $t3, COLUMNS	# Row-Number * COLUMNS
	add  $t3, $t3, $t1		# [Row-Number* COLUMNS]+Column-Number
	mul  $t3, $t3, 4		# Multiplied by4 (size of each element)
	add  $t3, $t3, $t2		# Adding it with base address
	
	lw   $a0, ($t3)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	
	addi $t1, $t1, 1
	
	blt  $t1, COLUMNS, res_inner
	
	li   $a0, '\n'
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 1
	blt  $t0, ROWS, res_outer
	jr	 $ra

	.data

result:
	.asciiz "\nMatrix is\n"
arr:
	.word 4, 2, 7, 1, 4, 4, 9, 3, 5, 1, 7, 8
