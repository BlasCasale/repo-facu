.data
A: .word 8
B: .word 7
C: .word 0

.code
ld $t1, A($0)
ld $t2, B($0)
bne $t1, $t2, no
daddi $t3, $0, 1
j fin
no: daddi $t3, $0, 0
fin: sd $t3, C($0)
halt
; no veo posibles cambios