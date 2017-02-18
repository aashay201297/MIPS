.data
	size:	.word 5
	array:  .space 100

.globl main 

.text 		

main:
	lw $s0, size
	la $s1, array
	li $t0, 0
loop:	
	beq $t0, $s0, exit
	li  $v0,5		# read_int syscall code = 5
	syscall
	sw $v0, ($s1)
	addi $s1, $s1, 4
	addi $t0, $t0, 1
	b loop
	
exit:
	li $v0, 10 # Sets $v0 to "10" to select exit syscall
	syscall # Exit
