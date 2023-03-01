main:				

addi $a0 $a0 14			# a = 24
addi $a1 $a1 4			# m = 3
jal power			

jal halas

power:				# public int power(int a, int m){
bne $a1 $zero pow_rec   	# if (m = 0)
addi $v0 $zero 1		#	return 1
jr $ra
pow_rec:
addi $sp $sp -12		# make room in memory
sw $a0 0($sp)			# save a
sw $a1 4($sp)			# save m
sw $ra 8($sp)			# save ra 


addi $a1 $a1 -1
jal power			# int pow_res = power(a, m-1)
addi $a0 $v0 0			# x = pow_res
lw $a1 0($sp)			# a = m
jal multiply			# int mult_res = multiply( x , a )
lw $ra 8($sp)			# load ra
addi $sp $sp 12			# point back to correct location
jr $ra				# return mult_res


multiply:			# public int multiply (int x, int y){
addi $v0 $zero 0		# int result = 0
mul_loop:			# do
				# {
add $v0 $v0 $a0			# 	result = result + x
addi $a1 $a1 -1			# 	y = y - 1
				# }
slt $t0 $zero $a1		# while (0 < y);
bne $t0 $zero mul_loop		# 
jr $ra				# return result 



halas:				# stop #
