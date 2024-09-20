; El HANDSHAKE es un dispositivo diseñado específicamente para interactuar con la impresora 
; mediante el protocolo centronics. Por este motivo, no requiere enviar la señal de flanco 
; ascendente manualmente, en lugar de eso, al escribir un valor en su registro DATA, el 
; mismo HANDSHAKE manda el flanco ascendente. Ejecutar los programas configurando el simulador 
; VonSim con los dispositivos “Impresora (Handshake)”

; a) Escribir un programa que imprime “INGENIERIA E INFORMATICA” en la impresora a través del
; HAND-SHAKE. La comunicación se establece por consulta de estado (polling). Para ello, 
; implementar a subrutina imprimir_caracter_hand que funcione de forma análoga a 
; imprimir_caracter pero con el handshake en lugar del PIO.

data equ 40h
state equ 41h

org 1000h
str db "INGENIERIA E INFORMATICA"
finish db ?

org 3000h
poll: in al, state
and al, 1
jnz poll
ret

org 3010h
sendChar: mov al, [bx]
out data, al
ret

org 3020h
roamString: mov bx, offset str
mov ah, offset finish - offset str
cont: call poll
call sendChar
inc bx
dec ah
jnz cont
ret

org 2000h
push ax
push bx
call roamString
pop bx
pop ax
int 0
end