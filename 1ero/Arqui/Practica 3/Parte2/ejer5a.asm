; Timer, tres usos: periódico infinito, periódico finito, y única vez ⭐⭐
; a) Escribir un programa que muestra el mensaje “Vamos las interrupciones!” 
; una vez cada 2 segundos y no termine nunca.
; b) Modificar a) para que termine a los 10 segundos.
; c) Modificar a) para que solo imprima una vez, a los 10 segundos, y luego termine.
; d) Desafío: Modificar a) para que el primer mensaje se imprima luego de 1 segundo, 
; el segundo luego de 2 segundos, el tercero luego de 3, y así sucesivamente, hasta 
; que se espere 255 en el último mensaje, y el programa termine.

CONT equ 10h
COMP equ 11h

EOI equ 20h
IMR equ 21h
INT1 equ 25h
I_Timer equ 22

org 88
dir_intTimer dw intTimer

org 1000h
str db "Vamos las interrupciones!"
ln db 10
finish db ?


org 3000h
intTimer: push ax
call print
mov al, 0
out CONT,al
mov al, EOI
out EOI, al
pop ax
iret

org 3100h
print: push ax
push bx
mov bx, offset str
mov al, offset finish - offset str
int 7
pop bx
pop ax
ret

org 2000h
cli
mov al, 0fdh
out IMR, al
mov al, I_Timer
out INT1, al
mov al, 2
out COMP, al
mov al, 0
out CONT, al
sti
loop: jmp loop
int 0
end