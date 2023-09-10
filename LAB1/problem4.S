.data
    L:      .word 5     # Length (integer)
    W:      .word 3     # Width (integer)
    H:      .word 2     # Height (integer)
    Volume: .word 0     # Volume will be stored here (integer)
    SA:     .word 0     # Surface Area will be stored here (integer)

.text
.globl main          # Entry point of the program

main:
    # Load the values of L, W, and H into registers
    lw $t0, L
    lw $t1, W
    lw $t2, H

    # Calculate the volume (L * W * H) and store it in $t3
    mul $t3, $t0, $t1     # $t3 = L * W
    mul $t3, $t3, $t2     # $t3 = (L * W) * H

    # Calculate the surface area (2lw + 2lh + 2wh) and store it in $t4
    mul $t4, $t0, $t1     # $t4 = L * W
    mul $t5, $t0, $t2     # $t5 = L * H
    mul $t6, $t1, $t2     # $t6 = W * H
    add $t4, $t4, $t5     # $t4 = L * W + L * H
    add $t4, $t4, $t6     # $t4 = L * W + L * H + W * H
    add $t4, $t4, $t4     # $t4 = 2 * (L * W + L * H + W * H)

    # Store the calculated volume and surface area in memory
    sw $t3, Volume
    sw $t4, SA

    # Exit the program
    li $v0, 10
    syscall
