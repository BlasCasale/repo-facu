; b) positivos: Idem a), pero la subrutina debe contar la cantidad de números positivos. Para ello, implementar y
; usar otra subrutina llamada es_positivo, que reciba un número en $a0 y devuelva en $v0 1 si es positivo y 0
; de lo contrario

.data
v: .word 2, 8, 10, 11, 13
elem: .word 5
result: .word 0

.code
daddi $a0, $0, v
daddi $sp, $0, 0x400
ld $a1, elem($0)
jal roamV
sd $v0, result($0)
halt

roamV: dadd $t9, $0, $a0 ; le paso la dir a este registro
daddi $sp, $sp, -8
sd $ra, 0($sp) ; guardo la dir de ret
dadd $t0, $0, $0 ; aca llevo el contador
while: dadd $v0, $0, $0 ; por defecto siempre es negativo
ld $a0, 0($t9) ; cargo el dato
jal itsPositive
daddi $a1, $a1, -1
beqz $v0, continue
daddi $t0, $t0, 1
continue: beqz $a1, toRet
daddi $t9, $t9, 8 ; sumo 8 dir
j while
toRet: dadd $v0, $0, $t0 ; cargo en v0 el contador para el return
ld $ra, ($sp) ; cargo en ra la pos de ret de la primera llamada
daddi $sp, $sp, 8
jr $ra

itsPositive: andi $a0, $a0, 1
bnez $a0, false
daddi $v0, $0, 1 ; es positivo porque dio 0
false: jr $ra