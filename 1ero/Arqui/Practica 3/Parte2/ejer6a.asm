; F10 con Timer
; a) Conteo regresivo ⭐⭐: Escribir un programa que implemente un conteo regresivo 
; a partir de un valor (de 1 a 9) ingresado desde el teclado. El conteo debe comenzar 
; al presionarse la tecla F10. El tiempo transcurrido debe mostrarse en pantalla, 
; actualizándose el valor cada segundo. Por ejemplo, si se ingresa el valor 7, cuando 
; se apreta F10 debe mostrarse en pantalla “7 6 5 4 3 2 1 0” en los 7 segundos 
; siguientes Pista: Una vez leído el dígito se puede activar solamente la interrupción 
; F10, y cuando  se invoque la subrutina F10 activar el Timer para que a partir de ese
; momento se muestre el conteo regresivo.

; b) Conteo regresivo con pausa ⭐⭐: Escribir un programa que cuente de forma regresiva 
; desde 9 hasta 0, mostrando el tiempo en pantalla.. Luego de que termine de contar, 
; si se presiona F10 debe comenzar de nuevo la cuenta desde 9 hasta 0. Además, si en 
; algún momento se presiona la tecla F10 durante el conteo, el mismo debe pausarse, y
; reanudarse sólo cuando se presiona nuevamente F10.
; Pista: Utilizar un flag de estado “PAUSA” que se controla mediante la tecla F10, y
; que la subrutina del timer puede consultar para saber si debe decrementar el contador
; y mostrar en pantalla

CONT equ 10h
COMP equ 11h

EOI equ 20h
IMR equ 21h
INT0 equ 24h
INT1 equ 25h
I_F10 equ 10
I_Timer equ 22

org 40
dir_f10 dw f10

org 88
dir_timer dw timer

org 1000h
counter db ?
char db ?

org 3000h
f10: cli
push ax
mov al, 0fdh
out IMR, al
mov al, 0
out CONT, al
mov al, EOI
out EOI, al
pop ax
iret

org 3100h
timer: push ax
call print
dec counter
dec char
mov al, EOI
out EOI, al
mov al, 0
out CONT, al
pop ax
iret

org 3200h
print: push ax
push bx
mov bx, offset char
mov al, 1
int 7
pop bx
pop ax
ret


org 2000h
mov bx, offset char
int 6
mov ah, char
sub ah, '0'
mov counter, ah
cli
mov al, 0feh
out IMR, al
mov al, I_F10
out INT0, al
mov al, I_Timer
out INT1, al
mov al, 1
out COMP, al
sti
loop: cmp counter, 255
jnz loop
int 0
end