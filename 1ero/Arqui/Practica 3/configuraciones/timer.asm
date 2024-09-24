; posee 2 registros
; COMP 10h: registro de comparacion
; CONT 11h: registro contador => se aumenta 1 vez por seg automaticamente

; cuando COMP = CONT => BEEP, interrupción del timer

EOI equ 20h
IMR equ 21h
INT1 equ 25h

CONT equ 10h
COMP equ 11h

org 80
dw imprimir

org 1000h
msj db "Hola"
flag db 0

org 3000h
imprimir: push ax
push bx
mov bx, offset msj
mov al, offset flag - offset msj
int 7
mov al, 20h
out EOI, al
mov flag, 1
pop bx
pop ax
iret

org 2000h
cli
; configuracion del PIC
mov al, 0fdh ; 1111 1101 => con esto se habilita solo el timer
out IMR, al

mov al, 20 ; id de interrupción
out INT1, al

; configuracion del timer
mov al, 0
out CONT, al
mov al, 10
out COMP, al
sti

loop: cmp flag, 1
jnz loop
int 0
end

; Registro CONT 
; se incrementa una vez por segundo
; es de 8 bits
; puede contar hasta 255, cuando llega al limite vuelve a 0
; cuando el valor de CONT y COMP tienen el mismo valor se dispara un interrupción => no vuelve a 0 sino que sigue incrementandose
