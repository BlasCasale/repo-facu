; Longitud de un string: Escribir un programa que cuente la longitud de un string iterando el mismo hasta llegar al
; valor 0 y guarde el resultado en una variable llamada LONGITUD. Probarlo con el string “ArquiTectuRa de
; ComPutaDoras”

.data
str: .asciiz "ArquiTectuRa de ComPutaDoras"
long: .word 0

.code
dadd $t9, $0, $0 ; el contador de la longitud
dadd $t8, $0, $0 ; suma para direccion base
while: ld $t0, str($t8)
cutControl: andi $t1, $t0, 0x00000000000000FF ; and para saber el num y comprobar que no esa 0 despues
beqz $t1, toEnd
daddi $t9, $t9, 1 ; uno mas a la long
dsrl $t0, $t0, 8 ; desplazo los bits
bnez $t0, cutControl ; mientras no haya terminado el str dentro del reg, sigo
daddi $t8, $t8, 8 ; sumo 8 a la dir
j while
toEnd: sd $t9, long($0)
halt