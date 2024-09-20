; Si bien el PIO solo permite conectarse a las luces, interruptores y la impresora en este 
; simulador, al ser un dispositivo programable podríamos utilizarlo para interactuar con 
; nuevos dispositivos que no cuenten con un hardware especializado para interactuar con ellos.
; En los siguientes incisos, te proponemos escribir programas que usen nuevos dispositivos 
; ficticios, pero con un protocolo de comunicación definido. Nota: los dispositivos
; nuevos no están implementados en el simulador, pero podés probar el funcionamiento del 
; programa utilizando las luces y las llaves haciendo de cuenta que sirven como entrada y 
; salida del dispositivo.

; b) Escribir un programa que reciba una cadena de caracteres de un dispositivo nuevo 
; conectado a los puertos PA y PB. Este dispositivo envía la cadena de a un carácter a 
; la vez. Para que el dispositivo sepa cuándo la CPU está lista para recibir un carácter, 
; la CPU deberá enviar el valor FF al dispositivo a través del puerto PB. Luego, la CPU 
; deberá leer desde el puerto PA, y volver a enviar el valor FF al dispositivo. La 
; transmisión termina cuando se recibe el código ASCII 0. 
; Ejemplo para recibir la cadena “ASD”: CPU envía el FF por PB → CPU recibe “A” por 
; PA → CPU envía el FF por PB → CPU recibe “S” por PA → CPU envía el FF por PB → CPU 
; recibe “D” por PA → CPU envía el FF por PB → CPU recibe 0 por PA

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h
quantity db 3

org 3000h
initPio: mov al, 0ffh ; todos 1 para configurar como entrada las llaves
out CA, al
mov al, 0 ; inicio las luces en 0 para mandarle datos de salida
out CB, al
ret

org 3020h
turnLight: mov al, 0ffh
out PB, al
ret

org 3030h
turnOff: mov al, 0
out PB, al
ret

org 3040h
readKey: in al, PA
ret

org 3050h
printLights: out PB, al
ret

org 3060h
solve: mov ah, quantity
cont: call turnLight
call readKey
call printLights
dec ah
jnz cont
call turnOff
ret

org 2000h
push ax
call initPio
call solve
pop ax
int 0
end