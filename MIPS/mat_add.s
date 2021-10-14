# WAP to display content of a 3X4 matrix, where the matrix is initialised.

ROWS = 3
COLUMNS = 4

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
    mul  $t3, $t3, COLUMNS
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
    blt  $t2, COLUMNS, inner_loop1

    li  $a0, '\n'
    li  $v0, 11
    syscall

    addi $t1, $t1, 1
    blt  $t1, ROWS, outer_loop1
    
    la  $a0, prompt2
    li  $v0, 4
    syscall
	li  $t1, 0

outer_loop2:                 # for Rows
    
    li  $t2, 0

inner_loop2:                 # for Columns
    
    move $t3, $t1
    mul  $t3, $t3, COLUMNS
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
    blt  $t2, COLUMNS, inner_loop2

    li  $a0, '\n'
    li  $v0, 11
    syscall

    addi $t1, $t1, 1
    blt  $t1, ROWS, outer_loop2

	# ADDING CORRESPONDING ELEMENT
	
	li  $t1, 0

outer_loop_pro:                 # for Rows
    
    li  $t2, 0

inner_loop_pro:                 # for Columns
    
    move $t3, $t1
    mul  $t3, $t3, COLUMNS
    add  $t3, $t3, $t2
    mul  $t3, $t3, 4        # EACH ELEMENT OCCUPIES 4 BYTES
    
    add  $t6, $t3, $t0
	
	lw   $t7, ($t6)
	add  $t6, $t3, $t4
	lw   $t8, ($t6)
	add  $t7, $t7, $t8
	
	add  $t6, $t3, $t5
	sw   $t7, ($t6)
	
    addi $t2, $t2, 1
    blt  $t2, COLUMNS, inner_loop_pro

    addi $t1, $t1, 1
    blt  $t1, ROWS, outer_loop_pro
    
    la  $a0, prompt3
    li  $v0, 4
    syscall
    li  $t1, 0

outer_loop3:                 # for Rows
    
    li  $t2, 0

inner_loop3:                 # for Columns
    
    move $t3, $t1
    mul  $t3, $t3, COLUMNS
    add  $t3, $t3, $t2
    mul  $t3, $t3, 4        # EACH ELEMENT OCCUPIES 4 BYTES
    
    add  $t3, $t3, $t5

    lw   $a0, ($t3)
    li   $v0, 1
    syscall

    li  $a0, ' '
    li  $v0, 11
    syscall

    addi $t2, $t2, 1
    blt  $t2, COLUMNS, inner_loop3

    li  $a0, '\n'
    li  $v0, 11
    syscall

    addi $t1, $t1, 1
    blt  $t1, ROWS, outer_loop3


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
    .word 7, 4, 2, 1, 3, 5, 6, 8, 1, 5, 7, 2
mat3:
    .word ROWS*COLUMNS


