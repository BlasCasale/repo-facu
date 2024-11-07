; Los siguientes programas tienen errores en el uso de la convención de registros. Indicar qué registros cuál es
; el error y cómo se podría arreglar el problema en cada caso

; A)
.code
daddi $a0, $0, 5
daddi $a1, $0, 7
jal subrutina
sd $v0, variable ($0)
halt

subrutina: daddi $t0, $0, 2
dmul $a0, $a0, $t0
dmul $a1, $a1, $t0
dadd $v0, $a1, $a0
jr $ra

; B)
.code
daddi $t9, $0, tabla
jal subrutina
daddi $t0, $0, 10
daddi $t1, $0, 0
loop: bnez $t0, fn
ld $t2, 0($t9)
dadd $t1, $t1, $t2
daddi $t0, $t0, -1
dadd $t9, $t9, 8
j loop
fn: halt

; C)
.code
daddi $a0, $0, 5
daddi $a1, $0, 7
jal subrutina
dmul $t2, $a0, $v0
sd $t2, variable ($0)
halt

; D)
.code
daddi $t0, $0, 10 ; dimension
daddi $t1, $0, 0 ; contador
daddi $t2, $0, 0 ; desplazamiento
loop: bnez $t0, fn
ld $a0, tabla ($t2)
jal espar
bnez $v0, seguir
dadd1 $t1, $t1, 1
seguir:daddi $t2, $t2, 1
daddi $t0, $t0, -1
dadd $t2, $t2, 8
j loop
sd $t2, resultado($0)
fn: halt
