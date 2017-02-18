.data
	msg1: .asciiz "Enter integer values followed by return (-1 terminates input): \n"
	msg2: .asciiz " "
	msg5: .asciiz "\n"
	msg6: .asciiz "Ans:\n"
.text 				

.globl main
main:
	move $s0,$gp			#get the intial point to save array 
	#addi $t0,1
	li $t0,1			# $t0 = 1
	li $t1,0		 
	li $t2,0		 
	li $t3,0		 
	li $t4,0		 
	li $t6,0		
	li $t7,0		# terminate        
	li $t8,0
	#li $v0,4		# system call to put the string
	#la $a0,msg1		# 
	#syscall		
	add $s1,$s0,$zero	# copy the pointer to array in $s1
	li $v0,5
	syscall
	move $t7,$v0
entervalues:
	beq $t8,$t7,bubblesort # end of string run to bubblesort
	li $v0,5		# get the value in v0 
	syscall		# 
	sb $v0,0($s1)	# put the value at the position pointed by $s1
	addi $s1,$s1,1		# move the $s1 pointer by one
	addi $t8,$t8,1
	add $t5,$s1,$zero # $t5 stores the end value
	j entervalues
bubblesort:
	add $t4,$s0,$zero
	addi $t6,$t6,1
#s1-1 -> s0
	sub $s1,$s1,$t0
	beq $s1,$s0,ending  	# we have sorted everything
#s0 -> s1
	add $s2,$s0,$zero
loopinterno:
	lb $t1,0($s2)		# first element
	lb $t2,1($s2)		# second element
	slt $t3,$t2,$t1		# 
	beq $t3,$zero,proximo	# 
	sb $t2,0($s2)		# 
	sb $t1,1($s2)		#		
proximo:
	addi $s2,$s2,1		#
	bne $s2,$s1,loopinterno #
	jal bubblesort	
ending:
	li $v0,4		# system call to put the string
	la $a0,msg6		# 
	syscall		#
imprime:
	li $v0,1
	lb $a0,0($t4)
	syscall
	li $v0,4
	la $a0,msg2
	syscall		
	addi $t4,$t4,1
	bne $t4,$t5,imprime

	li $v0,10
	syscall	 
