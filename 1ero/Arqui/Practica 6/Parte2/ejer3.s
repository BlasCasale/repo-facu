.data
A: .word 1
B: .word 3
C: .word 0

.code
ld $t1, A($0)
ld $t2, B($0)
loop: dsll $t1, $t1, 1
daddi $t2, $t2, -1
bnez $t2, loop
sd $t1, C($0)
halt