; leer un dig de teclado (1 al 7) y luego prender la luz del bit prendido
PB equ 31h
CB equ 33h

org 1000h
digito db ?
cero db "0"

org 2000h

mov al, 00h
out CB, al

; leer digito
mov bx, offset digito
int 6
mov cl, [bx]

; restar ascii
; del 0 ("3" -> 3)
sub cl, cero

; rotar izq
; cl veces
mov al, 1
loop: cmp cl, 0
  jz mandar
  add al, al
  dec cl
  jmp loop
; prendo las luces
mandar: out PB, al
int 0
end;