; Desde teclado⭐Modifique el programa anterior para que las coordenadas X e Y del punto a pintar se lean de
; teclado

.data
coorX: .byte 0 ; coordenada X de un punto
coorY: .byte 0 ; coordenada Y de un punto
color: .byte 255, 0, 255, 0 ; color: máximo rojo + máximo azul =>
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $t1, DATA($zero) ; $t1 = dirección de DATA
daddi $t2, $0, 8 ; leo el num
sd $t2, 0($t0)
ld $t2, 0($t1) ; leo la coordenada
sd $t2, coorX($0)
daddi $t2, $0, 8 ; leo el num
sd $t2, 0($t0)
ld $t2, 0($t1) ; leo la coordenada
sd $t2, coorY($0)
lwu $t2, color($zero) ; $t2 = valor de color a pintar (4 bytes)
sw $t2, 0($t1) ; DATA recibe el valor del color a pintar
lbu $t2, coorX($zero) ; $t2 = valor de coordenada X
sb $t2, 5($t1) ; DATA+5 recibe el valor de coordenada X
lbu $t2, coorY($zero) ; $t2 = valor de coordenada Y
sb $t2, 4($t1) ; DATA+4 recibe el valor de coordenada Y
daddi $t2, $zero, 5 ; $t2 = 5  función 5 salida gráfca
sd $t2, 0($t0) ; CONTROL recibe 5 y produce el dibujo del punto
halt 