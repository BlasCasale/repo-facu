; Escriba un programa de VonSim que permita jugar al CriptoLlaves. El usuario debe adivinar 
; un patrón secreto de 8 bits que está almacenado en la memoria del programa. Para ello, 
; debe manipular las llaves hasta que el patrón de bits de las llaves sea exactamente igual 
; al del patrón secreto. Como ayuda para el usuario, si el estado de una llave acierta al 
; bit correspondiente, el programa debe prender el led correspondiente. Por ejemplo, si el
; patrón es 0100 0101 y las llaves están en el estado 1110 0100, deben prenderse las luces 
; de los bits 1, 2, 3, 4 y 6. Como no acertó a todos los bits, el usuario no ha adivinado
; el patrón y debe continuar jugando.
; El programa termina cuando el usuario acierta todos los bits del patrón, mostrando en 
; pantalla el mensaje "GANASTE".

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h
win db "Ganaste"
data db 0ffh

org 3000h
configPIO: mov al, 0ffh ; configuracion para las llaves (entrada)
out CA, al
mov al, 0 ; configuracion para las luces (salida)
out CB, al
ret

org 3010h
validate: xor al, ah
; primero hago xor para ver cuales son iguales
not al ; despues hago not para prender las luces
ret

org 3020h
request: mov ah, data
cont: in al, PA
call validate
call turnLight
cmp al, 255
jnz cont
ret

org 3035h
turnLight: out PB, al
ret

org 3040h
print: mov bx, offset win
mov al, offset data - offset win
int 7
ret

org 2000h
push ax
push bx
call configPIO
call request
call print
pop bx
pop ax
int 0
end