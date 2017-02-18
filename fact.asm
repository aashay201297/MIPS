.data 
	msg_str: 		.asciiz "Enter some Number: "
.text
.globl main
main:
	la		$a0, msg_str
	li		$v0, 4
	syscall
	li		$v0, 5
	syscall
	move		$a0,$v0			# compute 4!
	jal		fac
	move	        $a0,$v0			# get result
	li		$v0,1			# print integer
	syscall
	li		$v0,10
	syscall
#       |--------------------|
#       |  return address    |  +4
#       |--------------------|  
#  $sp->|       saved $s0    |  +0
#       |--------------------|
fac:
# prologue to procedure
	addi            $sp,$sp,-8		# push space for activation frame
	sw		$s0,0($sp)		# save $s0, which we use
	sw		$ra,4($sp)		# save return address
# start of actual procedure work
	move            $s0,$a0			# get argument ($a0)
	li		$v0,1	# 1
	beq		$s0,$v0,L2		# end of recursion?
	addi            $a0,$s0,-1		# set up argument (f-1)
	jal		fac			# recursive call 
	mult            $v0,$s0			# multiply
	mflo            $v0			# return mul result
	j		L3			# exit procedure via epilogue
L2:
	li		$v0,1          # return value
# epilogue to exit procedure
L3:
	lw		$ra,4($sp)		# restore $ra
	lw		$s0,0($sp)		# restore $s0
	addi            $sp,$sp,8		# pop activation frame
	jr		$ra				# return

