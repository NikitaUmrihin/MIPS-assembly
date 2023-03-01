
main:				
addi $a0 $a0 7			# x = 7
jal fact			# fact (x)

addi $t1, $t1 1111		# counter to see how many times the program has executed completely



fact:				# public int fact(int x) {

#	 BASE CASE OF RECURSION

slti $t0 $a0 1			# if (x < 1)
beq $t0 $zero L1		# {
addi $v0 $zero 1		# 	result = 1
addi $sp $sp 8
jr $ra				# 	return result
				# }
L1:				# else
				# {
addi $sp $sp -8			# 	make place in memory
sw $ra 4($sp)			# 	save ra , cause we jump soon
sw $a0 0($sp)			# 	save x

addi $a0 $a0 -1			# 	x--
jal fact			# 	fact (x)

# 	this loop is being executed as long as $ra saved in memory is from previous command
				
lw $a0 0($sp)			# 	bring x from memory
lw $ra 4 ($sp)			# 	bring ra
addi $sp $sp 8			# 	point to right location

mul $v0 $a0 $v0			# 	res = res * x
jr $ra				# }

