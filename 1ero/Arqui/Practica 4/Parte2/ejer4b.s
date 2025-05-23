; Cambio de color ⭐Modifique el programa original para que el punto vaya cambiando de color, desde negro
; (255,0,0) hasta rojo puro (255,0,0)

.data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 0, 0, 255, 0 ; color: máximo rojo + máximo azul =>
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $t1, DATA($zero) ; $t1 = dirección de DATA
lwu $t3, color($zero) ; $t3 = valor de color a pintar (4 bytes)
daddi $t5, $0, 255 ; cargo el 255 para cortar loop
while: sw $t3, 0($t1) ; DATA recibe el valor del color a pintar
lbu $t2, coorX($zero) ; $t2 = valor de coordenada X
sb $t2, 5($t1) ; DATA+5 recibe el valor de coordenada X
lbu $t2, coorY($zero) ; $t2 = valor de coordenada Y
sb $t2, 4($t1) ; DATA+4 recibe el valor de coordenada Y
daddi $t2, $zero, 5 ; $t2 = 5  función 5 salida gráfca
sd $t2, 0($t0) ; CONTROL recibe 5 y produce el dibujo del punto
daddi $t3, $t3, 1
andi $t4, $t3, 0x00000000000000FF
bne $t4, $t5, while
halt 