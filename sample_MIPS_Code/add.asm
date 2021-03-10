# Read two values from memory x and y and store x+y in z
# Print out values

	.data
x: .word 5
y: .word 7
z: .space 4

	.text
	.globl main
main:	la $t0, x		# $t0 = address of x
	la $t1, y		# $t1 = address of y
	la $t2, z		# $t2 = address of z
	lw $s0, 0($t0)		# $s0 = x
	lw $s1, 0($t1)		# $s1 = y
	add $s3, $s0, $s1	# $s3 = $s0 + $s1
	sw $s3, 0($t2)		# z = $s3
# Print out "x {value of x}"
	li $v0, 11		# print_char
	li $a0, 120		# 'x'
	syscall
	li $a0, 32		# space
	syscall
	li $v0, 1		# print_int
	add $a0, $s0, $zero	# $a0 = $s0 (x)
	syscall

# Print out "y {value of y}"
	li $v0, 11		# print_char
	li $a0, 121		# 'y'
	syscall

	li $a0, 32		# space
	syscall	
	li $v0, 1
	add $a0,$s1, $zero
	syscall

# Print out "\z {value of z}"
	li $v0, 11		# print_char
	li $a0, 122		# 'z'
	syscall

	li $a0, 32		# space
	syscall	
	li $v0, 1
	add $a0,$s3, $zero
	syscall



	jr $ra			# return to o/s

