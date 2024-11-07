; a) suma: Escribir una subrutina que reciba como argumento en $a0 la dirección de una tabla de números
; enteros de 64 bits, y en $a1 la cantidad de números de la tabla. La subrutina debe devolver en $v0 la suma de
; los números de la tabla

.data
v: .word 244,53,905,128,506
elem: .word 5
result: .word 0

.code
daddi $a0, $0, v
ld $a1, elem($0)
jal reduce
sd $v0, result($0)
halt

reduce: dadd $v0, $0, $0
while: ld $t0, 0($a0) ; cargo el elemento
daddi $a1, $a1, -1 ; le resto uno a la cant de iteraciones
daddi $a0, $a0, 8 ; una dir mas
dadd $v0, $t0, $v0 ; sumo lo que tenia mas lo que saque de mem
bnez $a1, while
jr $ra