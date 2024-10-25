;Contar mayúsculas Escribir un programa que cuente la cantidad de letras mayúsculas de un string. Probarlo con el
; string “ArquiTectuRa de ComPutaDoras”. Pista: El código ASCII de la “A” es 65, y el de la “Z” es 90.

.data
str: .asciiz "ArquiTectuRa de ComPutaDoras"
control: .word 91
quantity: .word 0
.code 
dadd $t6, $0, $0 ; contdor
daddi $t7, $0, str ; direccion
daddi $t8, $0, 8 ; desplazamiento por reg 
ld $t9, control($0) ; el proximo a la ult mayus
while: ld $t0, 0($t7) 
cutControl: andi $t1, $t0, 0x00000000000000FF ; and para quedarme con el ultimo del str
beqz $t1, toEnd
dsrl $t0, $t0, 8 ; corrimiento para seguir
slt $t2, $t1, $t9 ; si queda 1 $t1 es mayus
bnez $t2, continue
daddi $t6, $t6, 1
continue: bnez $t0, cutControl
daddi $t7, $t8, $t7
j while
sd $t6, quantity($0)
halt
