; b) Operaciones con números ⭐⭐Modificar a) para que además de leer los números, se lea un carácter que
; corresponda a distintas operaciones: +, -, * y /. Calcule la operación correspondiente (suma, resta, multiplicación o
; división). Asumir que el usuario siempre ingresa un carácter correspondiente a una operación válida.

.data
str: .asciiz " "
control: .word 0x10000
data: .word 0x10008

.code
ld $t0, control($0)
ld $t1, data($0)
daddi $t9, $0, 43 ; +
daddi $t8, $0, 45 ; -
daddi $t7, $0, 47 ; /
daddi $t2, $0, 8 ; leo el num
sd $t2, 0($t0) ; se envia la orden
ld $s1, 0($t1) ; lei el num
daddi $t2, $0, 8 ; leo el num
sd $t2, 0($t0)
ld $s2, 0($t1) ; lei el num
daddi $t2, $0, 9 ; leo el char
sd $t2, 0($t0)
lbu $s0, 0($t1) ; guardo el char
beq $s0, $t9, add
beq $s0, $t8, sub
beq $s0, $t7, div
dmul $s1, $s1, $s2
j continue
add: dadd $s1, $s1, $s2
j continue
sub: dsub $s1, $s1, $s2
j continue
div: ddiv $s1, $s1, $s2
continue: sd $s1, 0($t1)
daddi $t2, $0, 2
sd $t2, 0($t0) ; se imprime el num
halt