; F10 y Luces ⭐⭐Escribir un programa que al presionar F10 encienda todas las luces, 
; y al presionarlo nuevamente las apague. El programa nunca termina

EOI equ 20h
IMR equ 21h
INT0 equ 24h
I_F10 equ 22
PB equ 31h
CB equ 33h

org 88
dw turnLights

org 3000h
turnLights: push ax
in al, PB
xor al, 0ffh
out PB, al
mov al, EOI
out EOI, al
pop ax
iret

org 3100h
initPio: push ax
mov al, 0
out CB, al
pop ax
ret

org 3200h
turnOff: push ax
mov al, 0
out PB, al
pop ax
ret

org 2000h
call initPio
call turnOff
cli
mov al, 0feh
out IMR, al
mov al, I_F10
out INT0, al
sti
loop: jmp loop
int 0
end