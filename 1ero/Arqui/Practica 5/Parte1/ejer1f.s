; f) Escriba un programa que lea un exponente x y calcule 2^x + 3^x utilizando dos llamadas a potencia.
; Muestre en pantalla el resultado. ¿Funciona correctamente? Si no lo hace, revise su implementación
; del programa ¿Qué sucede cuando realiza una segunda llamada a potencia? Pista: Como caso de prueba,
; intente calcular 2 3+3 ³ = 8 + 27 = 35

.data
base1: .word 2
base2: .word 3
result: .word 0
control: .word 0x10000
data: .word 0x10008

.code
ld $a0, base1($0)
jal readNum
dadd $a1, $0, $v0
jal pow
dadd $a2, $0, $v0 ; cargo el resultado para usarlo despues
ld $a0, base2($0)
jal readNum
dadd $a1, $0, $v0
jal pow
dadd $a3, $0, $v0 ; cargo el segundo resultado
jal getResult 
sd $v0, result($0) ; guardo el mem el resultado final
halt

; a1 exponente y a0 base
pow: daddi $v0, $zero, 1
while: beqz $a1, finish
daddi $a1, $a1, -1 
dmul $v0, $v0, $a0
j while
finish: jr $ra

readNum: ld $t0, control($0)
ld $t1, data($0)
daddi $t2, $0, 8 ; leo el num
sd $t2, 0($t0) ; envio la orden
ld $v0, 0($t1)
jr $ra

getResult: dadd $v0, $a2, $a3
jr $ra