; c) Línea azul ⭐⭐: Modifique el programa original para pintar una línea horizontal de 50 pixeles desde el 0,0
; hasta el 0,49 de azul puro.

.data
coorX: .byte 0 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul =>
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $t1, DATA($zero) ; $t1 = dirección de DATA
lwu $t2, color($zero) ; $t2 = valor de color a pintar (4 bytes)
sw $t2, 0($t1) ; DATA recibe el valor del color a pintar
lbu $t2, coorY($zero) ; $t2 = valor de coordenada Y
sb $t2, 4($t1) ; DATA+4 recibe el valor de coordenada Y
lbu $t3, coorX($zero) ; $t2 = valor de coordenada X
while: sb $t3, 5($t1) ; DATA+5 recibe el valor de coordenada X
daddi $t2, $zero, 5 ; $t2 = 5  función 5 salida gráfca
sd $t2, 0($t0) ; CONTROL recibe 5 y produce el dibujo del punto
daddi $t3, $t3, 1
slti $t4, $t3, 50
bnez $t4, while
halt 