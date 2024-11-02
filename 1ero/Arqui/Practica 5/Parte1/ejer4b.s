; b) Valor y Pila: Pasando los parámetros por valor desde el programa principal a través de la pila, y
; devolviendo el resultado a través de un registro por valor.

.data
base: .word 3
exponent: .word 3
result: .word 0

.code
daddi $sp, $0, 0x400
ld $a0, base($0)
jal push
ld $a0, exponent($0)
jal push
jal pow
sd $v0, result($0)
halt

push: daddi $sp, $sp, -8
sd $a0, 0($sp)
jr $ra

pop: ld $v0, 0($sp)
daddi $sp, $sp, 8
jr $ra

pow: dadd $s0, $0, $ra ; me guardo la dir de retorno
jal pop
dadd $t1, $v0, $0
jal pop
dadd $t0, $v0, $0
daddi $v0, $0, 1
while: beqz $t1, finish
daddi $t1, $t1, -1 
dmul $v0, $v0, $t0
j while
finish: dadd $ra, $s0, $0 ; vuelvo a dejar en el $ra la dir de ret
jr $ra