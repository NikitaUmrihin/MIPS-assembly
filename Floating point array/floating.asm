.data
# Array[16] = {0.478, 936.78, 936.78, -5.465, -7.778, 0.573, 0.000, 1.980, 9.092, 8.555, 87964.086, 12.410, -6.879, 2.662, -0.669, 0.612};
.float 30.478, 936.78, 936.78, -5.465, -7.778, 0.573, 0.000, 1.980, 9.092, 8.555, 87964.086, 12.410, -6.879, 2.662, -0.669, 0.612
# result should be = { 0, 1, 0, -1, -1, 1, -1, 1, 1, -1, 1, -1, -1, 1, -1, 1 }

.text
# void main(void)

main_loop:
	

lui $s0 0x1001
addi $s1 $s0 64

#	s0 = first array address = A1[] => index i
#	s1 = second array address = A2[] => index j
#	t0 = end of array
#	t1 = count
#

addi $t0, $s0, 64	# t0 = end of first array

add $t1, $s0, $zero	# int count = 0
sw $zero, 0($s1)	# A2[0] = 0

loop:			# do {	
addi $s1, $s1, 4	# j ++

lwc1 $f0, 0($s0)	# f0 = A1[i]	
addi $s0, $s0, 4	# i++
lwc1 $f2, 0($s0)	# f1 = A1[i]

addi $t3, $zero, 1	# int t3 = 1
addi $t4 $zero, -1	# int t4 = -1

c.le.s $f0, $f2 	# (if A1[i] < A1[i+1])
movt $t2, $t3		# int temp = 1
c.le.s	$f2, $f0	# (if A1[i+1] < A1[i])
movt $t2, $t4		# temp = -1
c.eq.s	$f0, $f2	# if A1[i] == A1[i+1]
movt $t2 $zero		# temp = 0

sw $t2, 0($s1)		# A2[j] = temp

addi $t1, $t1, 4	# count ++			
			# }
bne $t1, $t0 loop	# (while count != end of array)
jal finito
finito:
