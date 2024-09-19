; El envío de la señal de strobe se puede modularizar en una subrutina para ser reutilizado
; en distintas ocasiones. Implementar una subrutina 📄flanco_ascendente que envía el flanco 
; ascendente (un 0 y luego un 1) a través del strobe. Asumir que el PIO ya está configurado
; correctamente para comunicarse con la impresora.

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 1000h

org 3000h 
configurePIO: mov al, 1 ; configurando el pio
out PA, al
mov al, 0
out PB, al
ret

org 3020h
poll: in al, PA ; loop para busy
and al, 1
jnz poll
ret

org 3030h
risingEdge: mov al, 0 ; seteo strobe en 0 y despues 1
out PA, al
mov al, 2
out PA, al
ret

org 2000h

int 0
end