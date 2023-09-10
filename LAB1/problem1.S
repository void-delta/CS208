.data
    num1:   .word 1      # First number
    num2:   .word 2      # Second number
    result: .word 0      # Result will be stored here

.text
.globl main
    main:
    lw $t0, num1
    lw $t1, num2
    add $t2, $t0, $t1

    sw $t2, result

    li $v0, 10
    syscall
