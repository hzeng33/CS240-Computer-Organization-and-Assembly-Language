# calc.asm-- A program that takes two int inputs and performs 
# an operation on them.

.data
Operand1: .asciiz "enter first number: "
Operand2: .asciiz "enter second number: "
Operation: .asciiz "enter the operation: "
Result: .asciiz "\n answer is: "


.text
main:
# Get first number from user, put into $t0.

     la $a0, Operand1         # print out "enter first number"
     jal print                # call print function

     li $v0, 5                # load syscall read_int into $v0.
     syscall                  # make the syscall.
     add $s0, $v0 , $0        # move the number read into $s0.


# Get second number from user, put into $t1.

     la $a0, Operand2         # print out "enter second number"
     jal print                # call print function

     li $v0, 5                # load syscall read_int into $v0.
     syscall                  # make the syscall.
     add $s1, $v0 , $0        # move the number read into $s1.

# Get operation from user

     la $a0, Operation         # print out "enter the operation"
     jal print                # call print function

     li $v0, 12                # load syscall read_char into $v0.
     syscall                  # make the syscall.
     add $s2, $v0 , $0        # move the number read into $s2.


     li $t0, 43               # check if operation is '+' (ascii 43)
     beq $s2, $t0, addition        # branches to add operation

     li $t0, 42               # check if operation is '*' (ascii 42)
     beq $s2, $t0, multiply       # branches to mult operation

     li $t0, 45               # check if operation is '-' (ascii 45)
     beq $s2, $t0, subtract   # branches to sub operation

     li $t0, 47               # check if operation is '/' (ascii 47)
     beq $s2, $t0, divide        # branches to div operation







addition:
     la $a0, Result
     jal print                # print "Result=" 
     add $a0, $s0, $s1        # $a0 = $s0 + $s1    
     li $v0, 1                # load syscall print_int into $v0.
     syscall                  # make the syscall.

     li $v0, 10               # exit.
     syscall                  # make the syscall.


subtract:
     la $a0, Result
     jal print                # print "Result="      
     sub $a0, $s0, $s1        # $a0 = $s0 - $s1
     li $v0, 1                # load syscall print_int into $v0.
     syscall                  # make the syscall.

     li $v0, 10               # exit.
     syscall                  # make the syscall.


multiply:
    la $a0, Result
    jal print                # print "Result="      
    mul $a0, $s0, $s1        # $a0 = $s0 * $s1          
    li $v0, 1                # load syscall print_int into $v0.
    syscall                  # make the syscall.

    li $v0, 10               # exit.
    syscall                  # make the syscall.

divide:
    la $a0, Result
    jal print                # print "Result=" 
    div $a0, $s0, $s1        # $a0 = $s0 / $s1         
    li $v0, 1                # load syscall print_int into $v0.
    syscall                  # make the syscall.

    li $v0, 10               # exit.
    syscall                  # make the syscall.



print:

    li $v0, 4                # load code for printing string
    syscall
    jr $ra                   # return from function