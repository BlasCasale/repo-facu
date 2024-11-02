; En WinMIPS no existen las instrucciones PUSH y POP. Por ese motivo, deben implementarse utilizando
; otras instrucciones existentes. No solo eso, sino que el registro SP es en realidad un registro usual, r29,
; que con la convención se puede llamar por otro nombre, $sp. El siguiente programa debería intercambiar
; los valores de $t0 y $t1 utilizando la pila. No obstante, así como está no va a funcionar porque push y pop
; no son instrucciones válidas. Implementar la funcionalidad que tendrían estas operaciones utilizando
; instrucciones daddi, sd y ld para que el programa funcione correctamente. Recordar que los registros
; ocupan 8 bytes, y por ende el push y el pop deberán modificar a $sp con ese valor.
; 2/6

; v0 devuelve 1 si a0 es par y 0 dlc
; a0 número entero cualquiera
.code
daddi $sp, $0, 0x400
daddi $a0, $0, 5
jal push
daddi $a0, $0, 8
jal push
jal pop
dadd $t0, $v0, $0 ; muevo el valor a $t0
jal pop
dadd $t1, $v0, $0 ; muevo el otro valor a $t1
halt

; por $a0 se le pasan los args
push: daddi $sp, $sp, -8
sd $a0, 0($sp)
jr $ra

; por $v0 se retorna lo quitado de la pila
pop: ld $v0, 0($sp)
daddi $sp, $sp, 8
jr $ra