; a) Referencia y Registro: Pasando los parámetros por referencia desde el programa principal a través de
; registros, y devolviendo el resultado a través de un registro por valor.

.data
base: .word 3
exponent: .word 3
result: .word 0

.code
daddi $a0, $0, base
daddi $a1, $0, exponent
jal pow
sd $v0, result($0)
halt

; a1 exponente y a0 base
pow: daddi $v0, $zero, 1
ld $t0, 0($a0)
ld $t1, 0($a1)
while: beqz $t1, finish
daddi $t1, $t1, -1 
dmul $v0, $v0, $t0
j while
finish: jr $ra