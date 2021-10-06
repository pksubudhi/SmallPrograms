# WAP to read 12 element sof a 3x4 matrix and display it's content
# Oct'21
# P K Subudhu

ROWS=3
COLUMNS=4
	.text
main:
	la   $a0, prompt
	li   $v0, 4
	syscall
	
	la   $t2, arr
	
	li   $t0, 1
outer:
	li   $t1, 1
inner:
	li   $v0, 5
	syscall
	sw   $v0, ($t2)
	addi $t2, $t2, 4
	addi $t1, $t1, 1
	ble  $t1, COLUMNS, inner
	addi $t0, $t0, 1
	ble  $t0, ROWS, outer

	
	la   $a0, result
	li   $v0, 4
	syscall
	
	la   $t2, arr
	
	li   $t0, 1
res_outer:
	li   $t1, 1
res_inner:
	lw   $a0, ($t2)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t2, $t2, 4
	addi $t1, $t1, 1
	
	ble  $t1, COLUMNS, res_inner
	
	li   $a0, '\n'
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 1
	ble  $t0, ROWS, res_outer
	jr	 $ra

	.data
prompt:
	.asciiz "Type 12 elements: "
result:
	.asciiz "\nMatrix is\n"
arr:
	.word ROWS * COLUMNS
