.text
.globl main

main:
    li $t0, 0          # Counter for contiguous sequences of 1s (initialize to 0)
    li $t1, 0          # Bitwise mask for checking each bit (initialize to 0)

loop:
    bge $t1, 32, done  # Exit loop when all bits have been checked

    sll $t2, $t1, 1    # Shift 1 to the left by $t1 to create a bitmask
    and $t2, $t2, $s1  # Use the bitmask to extract the current bit from r1

    beqz $t2, reset    # If the current bit is 0, reset the flag
    beq $t3, 1, skip   # If the flag is already set, skip this step

    # If the current bit is 1 and the flag is not set, it's the start of a new sequence
    addi $t0, $t0, 1   # Increment the counter
    li $t3, 1          # Set the flag

skip:
    addi $t1, $t1, 1   # Move to the next bit
    j loop

reset:
    li $t3, 0          # Reset the flag
    addi $t1, $t1, 1   # Move to the next bit
    j loop

done:
    # Store the result in r2
    move $s2, $t0

    # Exit the program
    li $v0, 10
    syscall
