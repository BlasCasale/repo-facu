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

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

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
risingEdge: mov al, 0
out PA, al
mov al, 2
out PA, al
ret

org 3045h
printChar: push ax
call poll
pop ax
out PB, al
call risingEdge
ret

org 2000h
push ax
call initPio
mov al,'x'
call printChar
int 0
end