; c) Referencia y Pila: Pasando los parámetros por referencia desde el programa principal a través de la pila, y
; devolviendo el resultado a través de un registro por valor.

.data
base: .word 3
exponent: .word 3
result: .word 0

.code
daddi $a0, $0, base
jal push
daddi $a0, $0, exponent
jal push
jal pow
sd $v0, result($0)
halt

pow: dadd $s0, $0, $ra ; me guardo la dir de ret
jal pop
ld $t1, 0($v0)
jal pop
ld $t0, 0($v0)
daddi $v0, $zero, 1
while: beqz $t1, finish
daddi $t1, $t1, -1 
dmul $v0, $v0, $t0
j while
finish: dadd $ra, $0, $s0
jr $ra

push: daddi $sp, $sp, -8
sd $a0, 0($sp)
jr $ra

pop: ld $v0, 0($sp)
daddi $sp, $sp, 8
jr $ra