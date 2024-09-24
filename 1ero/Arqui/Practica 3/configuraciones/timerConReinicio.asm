; Escribir un programa que muestre en pantalla la cadena de caracteres 
; "No debo programar en assembler" cada 5 segundos
; El programa nunca termina

CONT equ 10h
COMP equ 11h
EOI equ 20h
IMR equ 21h
INT1 equ 25h
ID_Timer equ 10 ; id 10

org 1000h
str db "No debo programar en assembler"
ln db 10
finishM db ?

org 40 ; id 10 x 4 = 40
dw print

org 3000h
print: push ax
push bx
mov al, offset finishM - offset str
mov bx, offset str
int 7
mov al, 0
out CONT, al
mov al, 20h
out EOI, al
pop bx
pop ax
iret

org 2000h
cli
; configuro el PIC
mov al, 0fdh
out IMR, al
mov al, ID_Timer
out INT1, al
; configuro el Timer
mov al, 0
out CONT, al
mov al, 5
out COMP, al
sti

loop: jmp loop
end