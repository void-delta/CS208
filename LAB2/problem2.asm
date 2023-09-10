.text
.globl main

main:

li $t0 , 27   # t0 = 27 
li $t1 , 21  # t1 = 9
li $t2 , 0 # used in branch instruction to compare if the b in  gcd(a,b) is 0
func:
move $t3 , $t0
div $t3 , $t1   # dividing t3 by t1
move $t0 ,$t1    # t3 =t1
mfhi $t1         # storing the remainder of t3/t1 in t1

bne $t1,$t2 func     # recursive call if t1 is not 0


move $a1 , $t0

li $v0 ,10
syscall