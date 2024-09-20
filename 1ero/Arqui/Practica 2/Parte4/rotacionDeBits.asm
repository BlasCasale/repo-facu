; Escribir un programa que encienda una luz a la vez, de las ocho conectadas al 
; puerto paralelo del microprocesador a través de la PIO, en el siguiente orden de bits:
; 0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-..., es decir, 00000001, 00000010,
; 00000100, etc. El programa nunca termina. Para ello, deberá utilizar las subrutinas 
; ROTAR_IZQ y ROTAR_DER_N, que le permitirán rotar el bit de estado de las luces y generar 
; el juego correspondiente.
; Las rotaciones son operaciones que, aunque no parezca, tienen muchas utilidades, como 
; dividir o multiplicar por dos de forma rápida, o manipular los bits de un byte, pero no 
; hay una instrucción que las implemente directamente.
; 📄ROTARIZQ: Escribir una subrutina ROTARIZQ que aplique una rotación hacia la izquierda 
; a los bits de un byte almacenado en la memoria. Dicho byte debe pasarse por valor desde 
; el programa principal a la subrutina a través de registros y por referencia. No hay valor 
; de retorno, se modifica directamente la celda de memoria referenciada.


; 📄ROTARIZQ_N: Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una subrutina
; ROTARIZQ_N que realice N rotaciones a la izquierda de un byte. La forma de pasaje de
; parámetros es la misma, pero se agrega el parámetro N que se recibe por valor y registro.
; Por ejemplo, al rotar a la izquierda 2 veces el byte 10010100, se obtiene el byte 01010010.
; 📄ROTARDER_N: * Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba una subrutina
; ROTARDER_N que sea similar pero que realice N rotaciones hacia la derecha.

PB equ 31h
CB equ 33h

org 1000h
output db 2

org 3000h
initPio: mov al, 0h
out CB, al
ret

org 3010h
turnLight: out PB, al
ret

org 3020h
rotateLeft: add al, al
jnc toMov
inc al
toMov: mov [bx], al
ret

org 3040h
rotateRight: mov cl, 7
cont: add al, al
jc carry
decrementor: dec cl
jnz cont
jmp toRet
carry: inc al
jmp decrementor
toRet: ret

org 3070h
solve: mov bx, offset output
mov al, [bx]
contL: call rotateLeft
call turnLight
cmp al, 0
jns contL
contR: call rotateRight
call turnLight
cmp al, 1
jnz contR
jmp contL
ret

org 2000h
push ax
push bx
call initPio
call solve
pop bx
pop ax
int 0
end