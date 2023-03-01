	
#	void main(void)
#	{
#		int num = 5;
	addi $a0, $zero, -5

#		squared (num)
	jal squared
main_loop:
	j main_loop
#	}
#	
#	


		
squared:				#  int squared (int num) {
	add $v0, $zero, $zero		#    int res ;
	slt $t0, $a0, $zero		#    if num > 0
	beq $t0, $zero, positivo	#    {
	mult $a0, $a0,			#      res = num * num
	mflo $v0			#    }
	j overflow_check		#    
positivo:				#    else
	multu $a0, $a0			#    {
	mflo $v0			#      res = num * num
	j overflow_check		#    }	 
					#
overflow_check:
	mfhi $t1			#  if there's overflow
	beq $t1, $zero no_overflow
	addi $v0, $zero, -1		#  return -1
	jr $ra
	
no_overflow:
	jr $ra				#  return res
