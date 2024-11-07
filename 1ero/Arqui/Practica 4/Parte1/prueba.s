.data
a: .word 90

.code
ld r3, a(r0)
dadd r3, r3, r3
loop: daddi r3, r3, -1
  bnez r3, loop
halt