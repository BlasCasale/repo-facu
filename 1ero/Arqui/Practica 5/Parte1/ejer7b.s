; b) contiene: Recibe en $a0 la dirección de un string y en $a1 un carácter (código ascii) y devuelve en $v0 1 si
; el string contiene el carácter $a1 y 0 de lo contrario

.data
str: .asciiz "hola, soy blas casale"
char: .ascii "w"
result: .word 0

.code
ld $a1, char($0)
daddi $a0, $0, str
jal foundChar
sd $v0, result($0)
halt

; en $a1 se recibe el char a buscar y en $a0 la dir del str
foundChar: dadd $v0, $0, $0 ; por defecto no esta
while: lbu $t0, 0($a0)
daddi $a0, $a0, 1
nop
beq $t0, $a1, true
beqz $t0, toEnd
j while
true: daddi $v0, $0, 1
toEnd: jr $ra