	.text
	# Declare main as a global function
	.globl	main
	
# The label 'main' represents the starting point
main:

jal	print_example

# Code for syscall: exit
li	$v0,10
syscall

print_example:
	# Run the print_string syscall which has code 4
	li	$v0,4		# Code for syscall: print_string
	la	$a0, msg	# Pointer to string (load the address of msg)
	syscall
	
	# Printing out the number
	add $t0,$0,$0
	li $v0, 1
	move $a0, $t0

	# Return from function
	jr $ra # Jump to addr stored in $ra
					
	# All memory structures are placed after the
	# .data assembler directive
	.data

msg:	.asciiz	"Hello World!\n"
