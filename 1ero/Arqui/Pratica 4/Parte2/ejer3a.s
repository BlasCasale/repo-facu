; a) Suma de números ⭐Escribir un programa que lea dos números enteros y muestre su suma en la salida estándar
; del simulador (ventana Terminal) el resultado numérico

.data
control: .word 0x10000
data: .word 0x10008
str: .asciiz "Ingresa un numero:"

.code
ld $t9, control($0)
ld $t8, data($0)
daddi $t2, $0, str ; cargo la dir
sd $t2, 0($t8) ; envio a data 
daddi $t2, $0, 8 ; t2 para manejo de codigos y data
sd $t2, 0($t9)
ld $s0, 0($t8) ; primer num
daddi $t2, $0, str ; cargo la dir
sd $t2, 0($t8) ; envio a data 
daddi $t2, $0, 8 ; t2 para manejo de codigos y data
sd $t2, 0($t9)
ld $s1, 0($t8) ; segundo num
dadd $s0, $s0, $s1 ; la suma de ambos
sd $s0, 0($t8)
daddi $t2, $0, 1 ; imprimo el num
sd $t2, 0($t9) ; envio el cod
halt