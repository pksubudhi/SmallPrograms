#
# WAP to read an integer and check if the input nnumber is Odd or Even.
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
	la	 $a0, _input_prompt	# Displaying Input Prompt
	li	 $v0, 4
	syscall
	
	li	 $v0, 5				# Reading Input Number
	syscall
	
	move $t0, $v0			# Moving input value from $v0 to temp register $t0
	rem  $t0, $t0, 2		# Getting remainder by diving it by 2
	beq  $t0, 0, even_label	# If remainder is 0 then jump to _evem_label
	
	la	 $a0, _odd_number	# Displaying the number is Odd
	li	 $v0, 4				
	syscall
	
	b end_line				# Jumping to End of the Program
	
even_label:
	la	 $a0, _even_number	# Displaying the number is Even
	li	 $v0, 4
	syscall
	
end_line:
	li   $v0, 0
    jr   $ra				# Returning to Caller location
    
############################
#        DATA
############################
	.data
_input_prompt:
	.asciiz "Enter an integer: "
	
_odd_number:
	.asciiz "Odd Number"
	
_even_number:
	.asciiz "Even Number"
