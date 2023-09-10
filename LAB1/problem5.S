.data
    result: .word 0   # Result will be stored here

.text
.globl main      

main:
    li $t0, 0         # $t0 will be used for the sum
    li $t1, 1         # $t1 will be used for the loop counter

loop:
    mul $t2, $t1, $t1
    add $t0, $t0, $t2
    addi $t1, $t1, 1
    bne $t1, 16, loop
    sw $t0, result
    li $v0, 10
    syscall
