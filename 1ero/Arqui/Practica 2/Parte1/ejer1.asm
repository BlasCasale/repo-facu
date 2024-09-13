PB EQU 31h ; con PB lo que se hace es el envio de informacion
CB EQU 33h ; con CB lo que se hace es setear si los bits son de entrada o salida

; para CB salida es 0 y entrada es 1

ORG 2000H

mov al, 00h ; poniendo en 00 al lo que hago es configurar el PIO para que sea de salida
out CB, al
mov al, 0f0h
out PB, al
int 0
end

PA EQU 30h
CA EQU 32h

ORG 1000h
msj db "Apagadas"
ORG 2000H
mov al, 0FFh ; con esto voy a setear en CA que sea de salida, quiere decir que va a entrar informacion al CPU
out CA, al ; con esto hago el movimiento de lo seteado a CA
in al, PA ; con esto leere la info que tenga PA en ese momento
cmp al, 0
jnz fn
mov al, 8
mov bx , offset msj
int 7
fn: int 0
end