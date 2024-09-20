; Si bien el PIO solo permite conectarse a las luces, interruptores y la impresora en este 
; simulador, al ser un dispositivo programable podríamos utilizarlo para interactuar con 
; nuevos dispositivos que no cuenten con un hardware especializado para interactuar con ellos.
; En los siguientes incisos, te proponemos escribir programas que usen nuevos dispositivos 
; ficticios, pero con un protocolo de comunicación definido. Nota: los dispositivos
; nuevos no están implementados en el simulador, pero podés probar el funcionamiento del 
; programa utilizando las luces y las llaves haciendo de cuenta que sirven como entrada y 
; salida del dispositivo.

; Escribir un programa que, utilizando el puerto PB del PIO, envíe la cadena de caracteres 
; “UNLP” a un dispositivo nuevo. Este dispositivo debe recibir la cadena de a un carácter 
; a la vez. Para distinguir entre caracteres, el dispositivo necesita que antes de cada 
; carácter nuevo se envíe el código ASCII 0. Además, para indicar que se finalizó el envío,
; debe mandarse el código ASCII 255.
; Ejemplo: Para transmitir la cadena “UNLP”, debe enviarse: 0, “U”, 0, “N”, 0, “L”, 0, “P”, 255

PB equ 31h
CB equ 33h

org 1000h
char db 'U', 'N', 'L', 'P'
zero db 0
max db 255

org 3000h
initPio: mov al, 0 ; inicio las luces en 0 para mandarle datos de salida
out CB, al
ret

org 3010h
turnLight: mov al, [bx] ; prendo la apuntado en bx
out PB, al
ret

org 3020h
turnOff: mov al, zero ; se imprime el intervalo
out PB, al
ret

org 3030h
turnOn: mov al, max ; se imprime el 255 que es el corte
out PB, al
ret

org 3040h
roamVec: mov bx, offset char
mov ah, offset zero - offset char
loop: call turnOff
call turnLight
inc bx
dec ah
jnz loop
call turnOn
ret

org 2000h
push ax
push bx
call initPio
call roamVec
pop bx
pop ax
int 0
end