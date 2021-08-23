#
# WAP that read input mark and display corresponding Grade (or Invalid)
#	If marks < 0 or marks > 100 then Invalid
#	F Grade: 0 - 29
#	C Grade: 30 - 50
#	B Grade: 51 - 75
#	A Grade: 76 - 100
#
# P K Subudhi (WhatsApp: +91-8895174939, Mail: mailtopksubudhi@gmail.com)
# Web: www.pksubudhi.com
# Mid Aug'21
#

############################
#         CODE
############################

main:
	
	la 	 $a0, _prompt			# Displaying Prompt
	li	 $v0, 4
	syscall
	
	li	 $v0, 5					# Reading input marks
	syscall
	move $t0, $v0				# Moving it to $t0
	
	blt	 $t0, 0, invalid_msg	# Checking if invalid i.e. < 0
	ble  $t0, 29, f_grade		# If F Grade
	ble  $t0, 50, c_grade		# C Grade
	ble  $t0, 75, b_grade		# B Grade
	ble  $t0, 100, a_grade		# A grade
	b invalid_msg
a_grade:
	la 	 $a0, _a_grade			# Setting appropriate Msg string
	b end_part
b_grade:
	la 	 $a0, _b_grade
	b end_part
c_grade:
	la 	 $a0, _c_grade
	b end_part
f_grade:
	la 	 $a0, _f_grade
	b end_part
invalid_msg:
	la 	 $a0, _invalid
	
end_part:
	
	li	 $v0, 4					# Displaying message
	syscall
	
	li	 $v0, 0					# Quiting program
	jr	 $ra
	
############################
#        DATA
############################

	.data
	
_prompt:
	.asciiz "Enter Marks of the student: "
_invalid:
	.asciiz "Invalid Mark!"
_a_grade:
	.asciiz "A Grade!"
_b_grade:
	.asciiz "B Grade!"
_c_grade:
	.asciiz "C Grade!"
_f_grade:
	.asciiz "F Grade!"
