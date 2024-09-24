; El siguiente programa cuenta el número de veces que se presiona la tecla F10 y
; acumula este valor en el registro DX. El programa nunca termina, ya que 
; ejecuta un loop infinito. Completar las instrucciones faltantes para que el programa
; funcione correctamente.

EOI EQU 20H
IMR EQU 21H
INT0 equ 24h
N_F10 EQU 15

org 60
IP_F10 DW RUT_F10

ORG 2000H
CLI
MOV AL, 0FEH
out IMR, al
mov al, N_F10
OUT INT0, AL
MOV DX, 0
STI
LAZO: JMP LAZO

ORG 3000H
RUT_F10: PUSH AX
inc dx
MOV AL, EOI
out EOI, al
POP AX
IRET

end