; 4) Tecla F10 con pantalla y terminación ⭐⭐
;   A) Escribir un programa que muestre en pantalla “Vamos las interrupciones!” 
;   cada vez que se presiona la tecla F10. El programa nunca termina.
;   B) Idem A pero ahora el programa termina luego de mostrar 5 veces el mensaje 
;   (es decir, luego de que presione 5 veces la tecla F10).

EOI equ 20h
IMR equ 21h
INT0 equ 24h
I_F10 equ 22

org 88
dir_intF10 dw f10

org 1000h
str db "Vamos las interrupciones!"
ln db 10
finish db ?

org 3000h
f10: push ax
call print
mov al, EOI
out EOI, al
pop ax
iret

org 3100h
print: push ax
push bx
mov al, offset finish - offset str
mov bx, offset str
int 7
pop bx
pop ax
ret

org 2000h
cli
push ax
mov al, 0feh
out IMR, al
mov al, I_F10
out INT0, al
pop ax
sti
loop: jmp loop
end