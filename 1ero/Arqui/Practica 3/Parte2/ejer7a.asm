; Impresión con HANDSHAKE mediante interrupciones ⭐⭐
; a) Escribir un programa que imprime “UNIVERSIDAD NACIONAL DE LA PLATA” en la impresora a
; través del HAND-SHAKE. El envío de los caracteres se realiza por interrupciones emitidas
; desde el HAND-SHAKE cada vez que detecta que la impresora se desocupa.
; b) Probar el programa utilizando:
; 1) Una velocidad de reloj del 100%, y una velocidad de impresión del 25%
; 2) Una velocidad de reloj del 25%, y una velocidad de impresión del 100%
; ¿En qué caso sería mejor utilizar consulta de estado en lugar de interrupciones?
; c) Modificar a) de modo que el string a imprimir se lea desde teclado. El string a 
; leer tiene una longitud fija de 10 caracteres, y se lee de forma completa antes de 
; comenzar la impresión. Tener en cuenta entonces que las interrupciones deben esperar 
; a que se ingrese todo el string.
; d) Modificar b) de modo que cuando se presione F10 se cancele la impresión. En tal 
; caso, deben desactivarse las interrupciones del HANDSHAKE para evitar que se envíen
; más caracteres a imprimir

EOI equ 20h
IMR equ 21h
INT2 equ 26h
I_INT equ 30

DATA equ 40h
STATE equ 41h

org 120
dir_hs dw int_hs

org 1000h
str db "UNIVERSIDAD NACIONAL DE LA PLATA"
finish db ?

org 3000h
int_hs: push ax
mov al, [bx]
out DATA, al
inc bx
dec cl
jnz toFinish
mov al, 0ffh
out IMR, al
toFinish: mov al, EOI
out EOI, al
pop ax
iret

org 2000h
mov bx, offset str
mov cl, offset finish - offset str
cli
mov al, 0fbh
out IMR, al
mov al, I_INT
out INT2, al
mov al, 80h ; con esto habilitamos que el hs haga interrupciones
out STATE, al
sti
loop: cmp cl, 0
jnz loop
in al, STATE
and al, 7fh
out STATE, al
int 0
end