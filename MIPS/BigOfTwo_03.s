#
# WAP to read two integers and display the biggest one.
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
	la	 $a0, _input_prompt_1	# Displaying Input Prompt
	li	 $v0, 4
	syscall
	
	li	 $v0, 5					# Reading Input Number
	syscall
	
	move $t0, $v0				# Moving input value from $v0 to temp register $t0
	
	la	 $a0, _input_prompt_2	# Displaying Input Prompt
	li	 $v0, 4
	syscall
	
	li	 $v0, 5					# Reading Input Number
	syscall
	
	move $t1, $v0				# Moving input value from $v0 to temp register $t1

	blt  $t0, $t1, y_label		# If remainder is 0 then jump to _evem_label
	
	move $a0, $t0				# Displaying first number is big
	li $v0, 1
	syscall
	
	la	 $a0, _output_prompt	# Displaying the number is Odd
	li	 $v0, 4				
	syscall
	
	b end_line					# Jumping to End of the Program
	
y_label:

	move $a0, $t1				# Displaying second number is big
	li $v0, 1
	syscall
	
	la	 $a0, _output_prompt	# Displaying the number is Even
	li	 $v0, 4
	syscall
	
end_line:
	li   $v0, 0
    jr   $ra					# Returning to Caller location
    
############################
#        DATA
############################
	.data
_input_prompt_1:
	.asciiz "Enter an integer: "
	
_input_prompt_2:
	.asciiz "Enter another integer: "
	
_output_prompt:
	.asciiz " is the biggestNumber"
	

