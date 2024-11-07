; Escribir un programa para VonSim que debera utilizar las luces y llaves de la siguiente
; forma:
; a) Cada vez que llaves cambien de valor, se muestran en pantalla el codigo ASCII 
; correspondiente a los 8 bits de las llaves. Por ejemplo, si todas las llaves salvo la del
; bit 0 y 6 estan prendidas, se muestra el caracter 'A' correspondiente al codigo ASCII
; "01000001".
; b) Cada vez que se encuentre prendida la ultima llave (msb), se deben invertir las luces
; (las que estaban prendidas se apagan y viceversa).
; c) En el caso particular en que todas las llaves esten apagadas, se deben apagar todas 
; las luces y finaliza el programa.

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h
char db ?

org 3000h
initPio: push ax
mov al, 0ffh
out CA, al
mov al, 0
out CB, al
pop ax
ret

org 3100h
print: push ax
in al, PA
mov [bx], al
mov al, 1
int 7
pop ax
ret

org 3200h
invert: push ax
in al, PB
not al
out PB, al
pop ax
ret

org 3300h
msb: push ax
in al, PA
and al, 80h
jz toRet
call invert
toRet: pop ax
ret

org 3400h
turnOff: push ax
mov al, 0
out PB, al
pop ax
ret

org 2000h
mov bx, offset char
call initPio
loop: in al, PA
cmp al, 0
jz toEnd
mov ah, al
in al, PA
cmp al, 0
jz toEnd
cmp al, ah
jz loop
call print
call msb
in al, PA
xor al, 0
jnz loop
toEnd: int 0
end


; Escribir un programa para VonSim que envie la cadena de caracteres 
; "Arquitectura de computadoras" a un dispositivo nuevo, conectado a los 8 bits del puerto
; PA. Este dispositivo recibe la cadena de a un caracter a la vez. Para que el dispositivo
; reconozca que se va a enviar un dato, luego de enviar un caracter debe enviar el valor
; 255. El programa debe finalizar cuando se han enviado todos los caracteres de la cadena,
; o cuando pasan 30 segundos desde que inicio el programa, lo que suceda primero.

CONT equ 10h
COMP equ 11h
EOI equ 20h
IMR equ 21h
INT1 equ 25h
PA equ 30h
CA equ 32h
I_Timer equ 10

org 40
dw intTimer

org 1000h
str db "Arquitectura de computadoras"
flag db 1

org 3000h
intTimer: push ax
mov flag, 0
mov al, EOI
out EOI, al
pop ax
iret

org 3100h
initPio: push ax
mov al, 0
out CA, al
pop ax
ret

org 3200h
print: push ax
mov al, [bx]
out PA, al
mov al, 255
out PA, al
inc bx
dec ah
jnz toRet
mov flag, 0
toRet: pop ax
ret

org 2000h
mov bx, offset str
mov ah, offset flag - offset str
call initPio
cli
mov al, 0fdh
out IMR, al
mov al, I_Timer
out INT1, al
mov al, 0
out CONT, al
mov al, 30
out COMP, al
sti
loop: cmp flag, 0
jz toEnd
call print
cmp flag, 0
jnz loop
toEnd: int 0
end