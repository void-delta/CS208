.data
msg1: .asciiz "Enter N: "

msg2: .asciiz "\nThe Number is Armstrong Number"
msg3: .asciiz "\nThe Number is Not Armstrong Number"

.globl main
.text

main:

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    move $t1,$t0
    li $t6, 0
    li $t7, 10
    li $t5, 0

loop:
    div		$t1, $t7			# $t1 / $t7
    mflo	$t1					# $t1 = floor($t1 / $t7) 
    mfhi	$t3					# $t3 = $t1 % $t7
    li $t4, 1
    move $t2, $t0
l1:
    div		$t2, $t7			# $t0 / $t7
    mflo	$t2					# $t2 = floor($t0 / $t7) 
    
    mul $t4, $t4, $t3
    bne $t2, $zero, l1



    add $t5, $t5, $t4
    bne $t1, $zero, loop

    bne $t5, $t0, skip
    
    li $v0, 4
    la $a0, msg2
    syscall
    j exit

skip:
    li $v0, 4
    la $a0, msg3
    syscall

exit:
    li $v0, 10
    syscall