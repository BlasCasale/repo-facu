; 1) configurar el registro IMR
; 2) configurar el registro INTX, donde X es la linea de interrupcion
;   a) INT0 para el F10
;   b) INT1 para el Timer....
; 3) implementar la subrutina de atención, que termina con
;   a) mandar el valor 20h al registro EOI
;   b) Instruccion iret (interrupt return)
; 4) poner dirección de la subrutina en el vector de interrupciones

EOI equ 20h
IMR equ 21h
INT0 equ 24h
ID_F10 equ 22
I_F10 equ 88

org I_F10
dir_saludar dw saludar

org 1000h
msj db "chau"

; Paso 3: sub

org 3000h
saludar: push bx
push ax
mov bx, offset msj
mov al, 4
int 7
; todas las subrutinas por interrupcion de hardware terminan igual
mov al, 20h
out EOI, al
pop ax
pop bx
iret

org 2000h
; Paso 1: configurar el IMR
; F10 conectada al bit 0
; Habilitacion depende del bit 0 (LSB) del IMR
; IMR
; 1 => deshabilitada  0 => habilitada   1111 1110 0FEh
cli ; para interrumpir las interrupciones
mov al, 0feh
out IMR, al

; Paso 2: configurar el registro INT0
; Registro INT0 tiene el ID de interrupción
; Elijo un ID => 22

mov al, ID_F10
out INT0, al

; Paso 4: dir. de la sub en el vec de Int.
; ID de interrupción es 22
; posición 22 del vector => dirección 22 * 4 = 88
; Dirección de la sub = 3000h

; mov bx, I_F10 => si arriba guardo en las direcciones la sub, no necesito hacer esto
; mov word ptr [bx], saludar

sti ; restablezco las int
loop: jmp loop
end