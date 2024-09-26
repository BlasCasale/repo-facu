; Imprimir mensaje leído, longitud arbitraria ⭐. Escribir un programa que solicite
; ingresar caracteres por teclado y los almacene en la memoria. Al presionar la tecla
; F10, se envían a la impresora a través de la PIO.
; No es necesario mostrar los caracteres en la pantalla

EOI equ 20h
IMR equ 21h
INT0 equ 24h
PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h
I_F10 equ 10

org 40
dw print

org 1000h
str db ?

org 3000h
print: push ax
push bx
push dx
cmp cl, 0
jz toRet
mov bx, 1000h
add bx, dx
inc dx
call poll
mov al, [bx]
out PB, al
call risingEdge
inc bx
dec cl
mov al, EOI
out EOI, al
toRet: pop dx
pop bx
pop ax
iret

org 3100h
risingEdge: push ax
in al, PA
and al, 0fdh
out PA, al
in al, PA
or al, 02h
out PA, al
pop ax
ret

org 3200h
poll: in al, PA
and al, 1
jnz poll
ret

org 3300h
initPio: mov al, 0fdh
out CA,al
mov al, 0
out CB, al
ret

org 2000h
mov bx, offset str
mov cl, 0 ; el contador de los char que me quedan
mov dx, 0 ; contador de donde voy imprimiendo
call initPio
cli
mov al, 0feh
out IMR, al
mov al, I_F10
out INT0, al
sti
loop: int 6
inc cl
jmp loop
int 0
end