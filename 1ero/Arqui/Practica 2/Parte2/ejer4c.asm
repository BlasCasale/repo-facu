; Ejecutar los programas configurando el simulador VonSim con los dispositivos 
; “Impresora (PIO)”. En esta configuración, el puerto de datos de la impresora se 
; conecta al puerto PB del PIO, y los bits de busy y strobe
; de la misma se conectan a los bits 0 y 1 respectivamente del puerto PA

; a) Imprimir letra fija Escribir un programa para imprimir la letra “A” utilizando la 
; impresora a través de la PIO. Recordar que el programa deberá esperar hasta que el 
; bit de busy esté apagado, luego enviar el carácter, y luego enviar el flanco ascendente 
; a través de la señal de strobe. Modularizar el programa en 4 subrutinas:

; 📄ini_pio: Inicializa el PIO configurando los registros CA y CB según corresponde 
; a strobe, busy y puerto de datos

; 📄poll: Consulta el bit busy de la impresora, e itera hasta esté en 0. Cuando está 
; en 0 la subrutina retorna sin devolver ninǵun valor

; 📄flanco_ascendente: Igual que la subrutina implementada en el ejercicio anterior

; 📄imprimir_caracter: Recibe un carácter a imprimir en AL, y utilizando poll y 
; flanco_ascendente, realiza todos los pasos necesarios para enviar a la 
; impresora el carácter.

; b) Imprimir mensaje fijo Escribir un programa para imprimir el mensaje “ORGANIZACION Y
; ARQUITECTURA DE COMPUTADORAS” utilizando la impresora a través de la PIO. Utilizar la
; subrutina imprimir_caracter del inciso anterior.

; c) Imprimir mensaje leído Escribir un programa que solicita el ingreso de cinco 
; caracteres por teclado y los envía de a uno por vez a la impresora a través de la 
; PIO a medida que se van ingresando. No es necesario mostrar los caracteres en la 
; pantalla. Utilizar la subrutina imprimir_caracter del inciso anterior.

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h
char db ?

org 3000h
initPio: mov al, 1
out CA, al
mov al, 0
out CB, al
ret

org 3020h
poll: in al, PA
and al, 1
jnz poll
ret

org 3030h
risingEdge: in al, PA
and al, 0fbh
out PA, al
in al, PA
or al, 02h
out PA, al
ret

org 3045h
printChar: push ax ; guardo el contenido de ax para no alterarlo cuando haga el poll
call poll
pop ax
out PB, al
call risingEdge
ret

org 3060h
readChar: mov bx, offset char
mov ah, 5 ; cantidad de char a leer e imprimir
cont: int 6
mov al, [bx]
call printChar
dec ah
jnz cont
ret

org 2000h
push ax
push bx
call initPio
call readChar
pop bx
pop ax
int 0
end