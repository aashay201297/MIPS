# "Hello World" in MIPS assembly
# From: http://labs.cs.upt.ro/labs/so2/html/resources/nachos-doc/mipsf.html
	
# All program code is placed after the
# .text assembler directive
.text

# Declare main as a global function
.globl	main
	
# The label 'main' represents the starting point
main:
	# Run the print_string syscall which has code 4
	li	$v0, 2		# Code for syscall: print_string
	li	$f12, 25E10	# Pointer to string (load the address of msg)
	syscall
	#li	$v0,1    	# Code for syscall: print_int
	#move	$a0, $v0	# Pointer to string (load the address of msg2)
	#syscall
	li	$v0,10		# Code for syscall: exit
	syscall

# All memory structures are placed after the
# .data assembler directive
.data

	# The .asciiz assembler directive creates
	# an ASCII string in memory terminated by
	# the null character. Note that strings are
	# surrounded by double-quotes
	
	msg:	.asciiz	"Hello World!\n"
	msg2:   .asciiz "Whatever!\n"
















