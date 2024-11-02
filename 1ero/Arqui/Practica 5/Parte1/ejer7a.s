; a) longitud: Recibe en $a0 la dirección de un string y retorna su longitud en $v0

.data
str: .asciiz "hola, soy blas"
long: .word 0

.code
daddi $a0, $0, str ; paso la dir
jal lenght
sd $v0, long($0)
halt

lenght: dadd $v0, $0, $0
while: lbu $t0, 0($a0)
daddi $a0, $a0, 1
beqz $t0, toEnd
daddi $v0, $v0, 1
j while
toEnd: jr $ra