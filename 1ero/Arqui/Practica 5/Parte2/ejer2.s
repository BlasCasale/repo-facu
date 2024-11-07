; Escribir un programa que imprime alternativamente un punto rojo y uno azul en la pantalla gráfica, y llena
; toda la pantalla de esta forma.
; Para ello, implementar una subrutina fila_alternativa que recibe un número de fila y dos colores, y llena toda
; la fila con pixeles de los dos colores de forma alternativa. Utilizando fila_alternativa, escriba un programa
; que pinte toda la pantalla de rojo y azul, de forma tal que en la primera fila se comience con el color rojo, en
; la 2da con azul, y así sucesivamente.

.data
control: .word 0x10000
data: .word 0x10008
red: .byte 255, 0, 0, 0
blue: .byte 0, 0, 255, 0

; t9 => y
; a0 => x
; t0 => control
; t1 => data
; t2 => print
; a1 => red/blue
; a2 => blue/red
.code
ld $t0, control($0)
ld $t1, data($0)
daddi $t9, $0, 0 ; inicia en 0
daddi $t2, $0, 5 ; salida grafica
for: daddi $a0, $0, 0 ; inicia en 0 para imprimir toda la fila
lwu $a1, red($0) ; cargo rojo
lwu $a2, blue($0) ; cargo azul
sb $t9, 4($t1) ; cargo la coord Y a pintar
jal alternativeRow
daddi $t9, $t9, 1 ; sumo para la sig fila
daddi $a0, $0, 0 ; inicio de nuevo en 1 la fila a imprimir
lwu $a1, blue($0) ; cambio de color
lwu $a2, red($0) ; cambio de color
slti $t8, $t9, 50 ; si t9 es menor a 50 (cant max) sigo
sb $t9, 4($t1) ; cargo la coord Y
jal alternativeRow
bnez $t8, for
halt

alternativeRow: sw $a1, 0($t1) ; cargo el primero
sb $a0, 5($t1) ; envio la coord x (impar)
nop
nop
sd $t2, 0($t0) ; envio orden
daddi $a0, $a0, 1
sw $a2, 0($t1) ; cargo el segundo
nop
nop
sb $a0, 5($t1) ; envio la coord x aumentada (par)
slti $t7, $a0, 50
sd $t2, 0($t0) ; envio orden
bnez $t7, alternativeRow
jr $ra