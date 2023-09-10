.data
    N:      .word 15       # Value of N (number of words)
    array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15   # Initialize the array with 15 numbers

.text
    .globl main          # Entry point of the program

main:
    lw $t0, N
    la $t3, array         # Load the address of array into $t3
    addi $t3, $t3, 60    # Calculate the end address (60 bytes)
    li $t1, 0

loop:
    beq $t1, $t0, end
    lw $t2, ($t3)
    addi $t2, $t2, 8
    sw $t2, ($t3)
    addi $t3, $t3, 4
    addi $t1, $t1, 1
    j loop

end:
    # Exit the program
    li $v0, 10
    syscall
