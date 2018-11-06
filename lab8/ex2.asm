.data
 newline:    .asciiz "\n"
.text
main:
	########################
	#   $t0 = start
	#   $t1 = R
	#   $t2 = B
	########################
	# read in value for start
	# set R = start
	addi 	$v0, $0, 5	# read value to start
	syscall
	add	$t0, $0, $v0
	
	add	$t1, $t0, $0	# set R = start
shift:
	addi	$v0, $0, 1	# print R
	add	$a0, $0, $t1
	syscall
	
	addi	$v0, $0, 4	# print R
	la	$a0, newline
	syscall
	
	srl 	$t2, $t1, 4	# shift right by four and bitwise and with 0x01
	andi	$t2, $t2, 0x01
	
	srl 	$t3, $t1, 2	# shift right by 2 and bitwise and with 0x01
	andi	$t3, $t3, 0x01
	
	xor	$t2, $t2, $t3	# xor of R's 2nd and 4th bit, shiift it left by 1, then add the result of this line to the end
	andi	$t1, $t1, 0x0F
	sll	$t1, $t1, 1
	or	$t1, $t1, $t2
	
	bne	$t0, $t1, shift
exit:
	addi 	$v0, $0, 10
	syscall
	
	
	