# Starter file for ex1.asm

.data
question: .asciiz "Enter two integers (for n and k) separated by a space:\n"
        
.text 0x3000

main:
	#...
	#...

	#----------------------------------------------------------------#
	# Write code here to do exactly what main does in the C program.
	#
	# Please follow these guidelines:
	#
	#	Use syscall 5 each time to read an integer (scanf("%d", ...))
	#	Then call NchooseK to compute the function
	#	Then use syscall 1 to print the result
	#   Put all of the above inside a loop
	#----------------------------------------------------------------#
	ori     $sp, $0, 0x3000 	# Initialize stack pointer to the top word below .text
                                	# The first value on stack will actually go at 0x2ffc
                                	#   because $sp is decremented first.
    	addi    $fp, $sp, -4        	# Set $fp to the start of main's stack frame
	
	#  store value for n in $a0
	addi	$v0, $0, 5			# system call 5 is for reading an integer
  	syscall 				# integer value read is in $v0
  	add 	$a0, $0, $v0
	#  store value for k in $a1
	addi	$v0, $0, 5			# system call 5 is for reading an integer
  	syscall 				# integer value read is in $v0
  	add 	$a1, $0, $v0
  	
  	# call NchooseK
  	jal NchooseK
  	# print result in $v0
  	add 	$a0, $0, $v0
  	addi 	$v0, $0, 1  			# system call 1 is for printing an integer
  	syscall           			# print the integer 
  	
  	# if (n == 0 and k == 0) j to end 
  	# else loop
  	bne 	$a0, $0, main
  	beq	$a1, $0, end
	
	


end: 
	ori   $v0, $0, 10     # system call 10 for exit
	syscall               # we are out of here.



NchooseK:
	#----------------------------------------------------------------#
	# $a0 has the number n, $a1 has k, from which to compute n choose k
	#
	# Write code here to implement the function you wrote in C.
	# Your implementation MUST be recursive; an iterative
	# implementation is not acceptable.
	#
	# $v0 should have the NchooseK result to be returned to main.
	#----------------------------------------------------------------#
	sw $fp, -4($sp)
	sw $ra, -8($sp)
	addi $sp, $sp , -8
	slt $t1, $a0, $a1
	
	#...
	#...
	jr	$ra