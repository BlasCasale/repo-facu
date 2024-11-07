; c) es_vocal: Determina si un carácter es vocal o no, ya sea mayúscula o minúscula. La rutina debe recibir el
; carácter y debe retornar el valor 1 si es una vocal ó 0 en caso contrario. Para implementar es_vocal, utilizar
; la subrutina contiene, de modo que para preguntar si un carácter es una vocal, se pregunte si un string con
; todas las vocales posibles contiene a este carácter

.data
vocals: .asciiz "aeiou"
char: .ascii "b"
result: .word 0

.code
daddi $sp, $0, 0x400
daddi $a0, $0, vocals
ld $a1, char($0)
jal foundChar
sd $v0, result($0)
halt

; paso por a0 la dir y los paso a t9 y en a1 recibo el char a comparar
foundChar: dadd $t9, $0, $a0
dadd $v0, $0, $0 ; por defecto no esta
daddi $sp, $sp, -8
sd $ra, 0($sp) ; hago el push del ra por la llamada de la otra sub
while: lbu $a0, 0($t9) ; cargo cada vocal
daddi $t9, $t9, 1 ; sumo una dir
nop
beqz $a0, toEnd ; si llega 0 corto
jal itsVocal ; llamo a es vocal
bnez $v0, toEnd ; si retorna 1 corto por el tru
j while ; sino sigo saltando hasta salir
toEnd: ld $ra, 0($sp) ; cargo lo que guarde en la pila y sumo
nop
daddi $sp, $sp, 8
jr $ra

; a0 recibo la vocal del str y en a1 el char a buscar
itsVocal: beq $a0, $a1, true
daddi $a0, $a0, -32 ; le resto para llegar a las mayus
nop
beq $a0, $a1, true
j toCut
true: daddi $v0, $0, 1
toCut: jr $ra