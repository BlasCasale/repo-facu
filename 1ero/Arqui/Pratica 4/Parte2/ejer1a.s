.data
texto: .asciiz "Hola, Mundo!" ; El mensaje a mostrar
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $t1, DATA($zero) ; $t1 = dirección de DATA
daddi $t2, $zero, texto ; $t2 = dirección del mensaje a mostrar
sd $t2, 0($t1) ; DATA recibe el puntero al comienzo del mensaje
daddi $t2, $zero, 4 ; $t2 = 4  función 4 salida de una cadena ASCII
sd $t2, 0($t0) ; CONTROL recibe 4 y produce la salida del mensaje
halt

; a) ¿Qué valor tienen los registros $t0 y $t1?
; En t0 queda almacenado 10000 en hexa y en t1 10008 en hexa
; b) Modifique el programa (a) para que el mensaje se muestre 10 veces