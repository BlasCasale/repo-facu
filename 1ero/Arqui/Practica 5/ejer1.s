.data
base: .word 5
exponente: .word 4
result: .word 0

.code
ld $a0, base($zero)
ld $a1, exponente($zero)
jal potencia
sd $v0, result($zero)
halt

potencia: daddi $v0, $zero, 1
lazo: beqz $a1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra

; a) ¿Qué hace el programa? ¿Cómo está estructurado el código del mismo?
; El programa deberia calcular la potencia pero estaba mal hecho

; b) ¿Qué acciones produce la instrucción jal? ¿Y la instrucción jr?
; jal es una llamada a una subrutina y hace un salto a la etiqueta, jr es el retorno a la direccion que se almaceno en $ra

; c) ¿Qué valor se almacena en el registro $ra? ¿Qué función cumplen los registros $a0 y $a1? ¿Y el
; registro $v0? ¿Qué valores posibles puede recibir en $a0 y $a1 la subrutina potencia?
; en $ra se almacena la direccion de retorno de la subrutina, los registros $a0 y $a1 son registros de argumentos, $v0 es de retorno de valores
; $a0 y $a1 pueden recibir la base y el exponente

; d) Supongamos que el WinMIPS no posee la instrucción dmul ¿Qué sucede si la subrutina potencia
; necesita invocar a otra subrutina para realizar la multiplicación en lugar de usar la instrucción dmul?
; ¿Cómo sabe cada una de las subrutinas a que dirección de memoria debe retornar?
; se debería salvar en la pila que uno implementa la direccion de retorno cada vez que uno invoca una subrutina