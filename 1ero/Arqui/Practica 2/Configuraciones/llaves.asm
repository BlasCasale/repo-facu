; todas las llaves tienen que configurarse como entrada CA = todo 1

; leer valores de llaves

PA equ 30h
CA equ 32h

; 1 entrada
; 0 salida

org 2000h

; configuro CA
mov al, 0ffh
out CA, al

; leo
in al, PA

; adivinar el valor de llaves

org 1000h
clave db 6fh
msj db "Correcto"

org 2000h
mov al, 0ffh
out CA, al
; esto es una consulta de estado
; leo el valor de las llaves
loop: in al, PA
cmp clave, al
jnz loop

; si es 0 se imprimira el msj
mov bx, offset msj
mov al, 8
int 7

fin: int0
end