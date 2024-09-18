; dispositivo de E/S
; diseñado para impresoras centronics, no sirve para otros dispositivos
; manda señal de strobe de manera automatica

; registros Dato/Estado no requieren configuracion

; para imprimir
; byte del ascii

dato equ 40h
estado equ 41h

org 1000h
char db 'a'

org 2000h
mov al, char
out dato, al
int 0
end

org 2000h
loop: in al, estado
and al, 1
jnz loop ; mientras busy = 0, sigo saltando
mov al, char
out dato, al
int 0
end

org 1000h
str db "Milanesas"

org 2000h
mov cl, 9
mov bx, offset str
loop: in al, estado ; se hace consulta de estado
and al, 1
jnz loop
mov al, [bx] ; traigo la info para enviarla a la impresora
out dato, al
inc bx
dec cl
jnz loop
int 0
end
