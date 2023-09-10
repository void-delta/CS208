.data
  result_msg: .asciiz "The number is"
.text
.globl main

main:
  li $t0, 1         # Initialize $t0 to 1 (start with the first number to check)

loop:
  li $t1, 1         # Initialize $t1 for the first cube
  li $t2, 1         # Initialize $t2 for the second cube

inner_loop:
  beq $t1, 11, increment_t0   # If $t1 exceeds 10, increment $t0 and reset $t1 and $t2

  bne $t1, $t2, check_sum    # Ensure $t1 and $t2 are different

  addi $t2, $t2, 1   # Increment $t2 for the second cube
  j inner_loop

check_sum:
  add $t3, $t1, $t2     # Calculate the sum of the first pair of cubes
  add $t4, $t0, $t3     # Calculate the total number to check

  # Check if $t4 can be expressed as the sum of two different pairs of cubes
  li $t5, 1             # Initialize $t5 for the first cube in the second pair
  li $t6, 1             # Initialize $t6 for the second cube in the second pair

  inner_check_loop:
    beq $t5, 11, increment_t0   # If $t5 exceeds 10, increment $t0 and reset $t5 and $t6

    bne $t5, $t6, found_result   # Ensure $t5 and $t6 are different

    addi $t6, $t6, 1   # Increment $t6 for the second cube in the second pair
    j inner_check_loop

found_result:
  add $t7, $t5, $t6   # Calculate the sum of the second pair of cubes
  beq $t7, $t4, print_result   # If the sums match, we found the result

  addi $t5, $t5, 1   # Increment $t5 for the first cube in the second pair
  j inner_check_loop

print_result:
  # Print the result
  li $v0, 4
  la $a0, result_msg
  syscall

  li $v0, 1
  move $a0, $t4
  syscall

  # Exit the program
  li $v0, 10
  syscall

increment_t0:
  addi $t0, $t0, 1   # Increment $t0 (the number to check)
  j loop
