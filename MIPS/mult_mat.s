# WAP to display content of a 3X4 matrix, where the matrix is initialised.

ROWS1 = 3
COLS1 = 4
ROWS2 = 4
COLS2 = 2
ROWS3 = 3
COLS3 = 2

    .text

main: 
    la  $a0, prompt1
    li  $v0, 4
    syscall

    la  $t0, mat1
    la  $t4, mat2
    la  $t5, mat3
    
    li  $t1, 0

outer_loop1:                 # for Rows
    
    li  $t2, 0

inner_loop1:                 # for Columns
    
    move $t3, $t1
    mul  $t3, $t3, COLS1
    add  $t3, $t3, $t2
    mul  $t3, $t3, 4        # EACH ELEMENT OCCUPIES 4 BYTES
    
    add  $t3, $t3, $t0

    lw   $a0, ($t3)
    li   $v0, 1
    syscall

    li  $a0, ' '
    li  $v0, 11
    syscall

    addi $t2, $t2, 1
    blt  $t2, COLS1, inner_loop1

    li  $a0, '\n'
    li  $v0, 11
    syscall

    addi $t1, $t1, 1
    blt  $t1, ROWS1, outer_loop1
    
    la  $a0, prompt2
    li  $v0, 4
    syscall
	li  $t1, 0

outer_loop2:                 # for Rows
    
    li  $t2, 0

inner_loop2:                 # for Columns
    
    move $t3, $t1
    mul  $t3, $t3, COLS2
    add  $t3, $t3, $t2
    mul  $t3, $t3, 4        # EACH ELEMENT OCCUPIES 4 BYTES
    
    add  $t3, $t3, $t4

    lw   $a0, ($t3)
    li   $v0, 1
    syscall

    li  $a0, ' '
    li  $v0, 11
    syscall

    addi $t2, $t2, 1
    blt  $t2, COLS2, inner_loop2

    li  $a0, '\n'
    li  $v0, 11
    syscall

    addi $t1, $t1, 1
    blt  $t1, ROWS2, outer_loop2
	
	# ADDING CORRESPONDING ELEMENT
	la  $s0, mat1
	la  $s1, mat2
	la  $s2, mat3
	
	li  $t1, 0

outer_loop_pro:                 # for Rows
    
    li  $t2, 0

inner_loop_pro:                 # for Columns
    
    li  $t3, 0
    li  $t4, 0
    
inner_most_loop:				# $t1, $t2 and $t are like i, j, k counter var
	
	move $t5, $t1
	mul  $t5, $t5, COLS1
	add  $t5, $t5, $t3
	mul  $t5, $t5, 4
	add  $t5, $t5, $s0			# Address a[i][k]
	
	lw   $t6, ($t5)
	 
	move $t5, $t3
	mul  $t5, $t5, COLS2
	add  $t5, $t5, $t2
	mul  $t5, $t5, 4
	add  $t5, $t5, $s1			# Address b[k][j]
	
	lw   $t7, ($t5)
	
	mul  $t6, $t6, $t7
	add  $t4, $t4, $t6
	
	
	
    addi $t3, $t3, 1
    blt  $t3, COLS1, inner_most_loop
    
    move $t5, $t1
	mul  $t5, $t5, COLS3
	add  $t5, $t5, $t2
	mul  $t5, $t5, 4
	add  $t5, $t5, $s2
	
	move $a0, $t5
	li   $v0, 1
	syscall
	
	sw   $t4, ($t5)
	
	addi $t2, $t2, 1
    blt  $t2, COLS3, inner_loop_pro

	
    addi $t1, $t1, 1
    blt  $t1, ROWS3, outer_loop_pro
    
    la  $a0, prompt3
    li  $v0, 4
    syscall
    
    li  $t1, 0

outer_loop3:                 # for Rows
    
    li  $t2, 0

inner_loop3:                 # for Columns
    
    move $t3, $t1
    mul  $t3, $t3, COLS3
    add  $t3, $t3, $t2
    mul  $t3, $t3, 4        # EACH ELEMENT OCCUPIES 4 BYTES
    
    add  $t3, $t3, $s2

    lw   $a0, ($t3)
    li   $v0, 1
    syscall

    li  $a0, ' '
    li  $v0, 11
    syscall

    addi $t2, $t2, 1
    blt  $t2, COLS3, inner_loop3

    li  $a0, '\n'
    li  $v0, 11
    syscall

    addi $t1, $t1, 1
    blt  $t1, ROWS3, outer_loop3


    jr  $ra

    .data
prompt1:
    .asciiz "\nContent of 1st matrix is: \n"
prompt2:
    .asciiz "\nContent of 2nd matrix is: \n"
prompt3:
    .asciiz "\nContent of 3rd matrix is: \n"
    
mat1:
    .word 1, 3, 5, 6, 7, 2, 4, 5, 3, 4, 5, 9
mat2:
    .word 7, 4, 2, 1, 3, 5, 6, 8
mat3:
    .word ROWS3*COLS3


