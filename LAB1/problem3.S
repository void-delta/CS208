.data
    arr: .word 10, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

.text
.globl main
    main:
    lw $t0, arr #counter

    iloop:
        la $a1, arr #pointer j
        addi $a1, $a1, 4

        lw $t1, arr # counter
        addi $t1, $t1, -1
        jloop:
            lw $t2, 0($a1)
            lw $t3, 4($a1)

            bge $t3, $t2, skip

            sw $t2, 4($a1)
            sw $t3, 0($a1)
            skip:
                addi $a1, $a1, 4
                addi $t1, $t1, -1
                bne $t1, 0, jloop
        
        addi $t0, $t0, -1
        bne $t0, 0, iloop

    li $v0, 10
    syscall
