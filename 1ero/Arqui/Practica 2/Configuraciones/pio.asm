; dispositivo interno de E/S
; es programable y configurable => sirve para varios dispositivos
; no conoce las impresoras centronics => señal de strobe a mano

; para imprimir un caracter
; tengo que configurar CA y CB
; escribir el caracter en PB
; mandar la señal al strobe por flance ascendente

; CA = XXXX XX01
; CB = 0000 0000
; PB = 'a'

; Strobe (PA) = 0
; Strobe (PB) = 1

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h
char db 'a'

org 2000h
; configurando CA
mov al, 01h
out CA, al
; configurando CB
mov al, 00h
out CB, al

poll: in al, PA ; con esto hago consulta de estado del busy
and al, 1
jnz poll

; se envia el caracter
mov al, char
out PB, al
; poner strobe en 0
in al, PA
and al, 0fdh
out PA, al
; poner strobe en 1
in al, PA
or al, 02h
out PA, al

int 0
end