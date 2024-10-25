; a) Definir un vector con 10 valores , y escribir programas para:
; - Contar positivos. Contar la cantidad de elementos positivos, y guardar la cantidad en una variable llamada POS.
; - Calcular máximo. Calcular el máximo elemento del vector y guardarlo en una variable llamada MAX.
; - Modificar valores Modificar los elementos del vector, de modo que cada elemento se multiplique por 2.

.data
positive: .word 0
max: .word 0
v: .word 2, 5, 6, 8, 11, 4, 3, 9, 10, 15

.code
daddi $t9, $0, 10 ; cantidad de elementos
daddi $t8, $0, v ; direccionamiento indirecto
daddi $t7, $0, 2 ; para multiplicar por 2
daddi $t6, $0, 0 ; contador de positivos
daddi $t5, $0, 0 ; para el valor maximo
loop: ld $t0, 0($t8)
andi $t1, $t0, 1
bnez $t1, notPositive
daddi $t6, $t6, 1
notPositive: slt $t4, $t0, $t5 ; con esto seteo en t4 el 1 para saber si el max es menor al actual
bnez $t4, notMax
dadd $t5, $t0, $0
notMax: dmul $t0, $t0, $t7
sd $t0, 0($t8)
daddi $t8, $t8, 8
daddi $t9, $t9, -1
bnez $t9, loop
sd $t6, positive($0)
sd $t5, max($0)
halt