; b) Contar apariciones de carácter Escribir un programa que cuente la cantidad de veces que un determinado carácter
; aparece en una cadena de texto.

.data
str: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
char: .ascii "d" ; carácter buscado
quantity: .word 0 ; cantidad de veces que se repite el carácter car en cadena.

.code
daddi $t9, $0, str ; cargo direccion de str
daddi $t8, $0, 8 ; cargo para sumar 8 despues al registro para dir indirecto
dadd $t7, $0, $0 ; contador
ld $t6, char($0) ; cargo el char para restar
while: ld $t0, 0($t9) ; cargo el reg
cutControl: andi $t1, $t0, 0x00000000000000FF ; and para quedarme con los 8 menos sig
beqz $t1, toEnd ; 0 termina
dsub $t1, $t1, $t6 ; resto para saber si es igual
bnez $t1, continue ; != d
daddi $t7, $t7, 1 ; sumo si es igual
continue: dsrl $t0, $t0, 8 ; desplazo 8 a la der
bnez $t0, cutControl
dadd $t9, $t9, $t8 
j while
toEnd: sd $t7, quantity($0)
halt