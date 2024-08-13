; Escribir un programa que, utilizando las mismas variables y 
; datos que el programa del punto anterior (TABLA, FIN,
; TOTAL, MAX), determine cuántos de los elementos de TABLA 
; son menores o iguales que MAX. Dicha cantidad
; debe almacenarse en la celda TOTAL.

ORG 1000H
TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB 0
MAX DB 13
ORG 2000H
MOV AL, 0
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
MOV DL, MAX
SUMA: ADD AL, [BX]
mov dh, [bx]
cmp dh, dl
js lessEqual
jz lessEqual
continue: INC BX
DEC CL
JNZ SUMA
jmp jEnd
lessEqual: inc total
jmp continue
jEnd: HLT
END