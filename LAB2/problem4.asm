.text
.globl main
main:
    li $t1 ,   22222   # number to be checked
    move $t0 , $t1
    li $t7 , 10   # will be used to find remainder and divide the number
    li $t3 , 0    # will store the palindrome
    li $s0 , 0    # will be used for comparison

    loop:

    div $t0 , $t7
    mfhi $t2
    mul $t3 ,$t3 ,$t7  
    add $t3,$t3,$t2
    mflo $t0
    bge $t0 , $t7 loop
    beq $t3 , $t1 palindrome

    notp:
    li $t8 ,0
    j end

    palindrome:
    li $t8 ,1
    end:nop
    li $v0, 10
    syscall