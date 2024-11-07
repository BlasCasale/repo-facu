; e) Escriba un programa que utilice potencia. En el programa principal se solicitará el ingreso de la base y
; del exponente (ambos enteros) y se deberá utilizar la subrutina potencia para calcular el resultado
; pedido. Muestre el resultado numérico de la operación en pantalla.

.data
control: .word 0x10000
data: .word 0x10008
result: .word 0

.code
jal readNum
dadd $a0, $v0, $0 ; base
jal readNum
dadd $a1, $v0, $0 ; exponente
jal pow
sd $v0, result($0)
halt

readNum: ld $t0, control($0)
ld $t1, data($0)
daddi $t2, $0, 8 ; para leer un num
sd $t2, 0($t0) ; se leyo el num
ld $v0, 0($t1)
jr $ra

pow: daddi $v0, $zero, 1
lazo: beqz $a1, finish
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
finish: jr $ra