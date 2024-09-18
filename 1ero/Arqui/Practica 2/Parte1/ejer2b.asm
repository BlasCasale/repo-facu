; Verificar Llave: Escribir un programa que verifique si la llave de 
; más a la izquierda está prendida. Si es
; así, mostrar en pantalla el mensaje “Llave prendida”, y de lo contrario
; mostrar “Llave apagada”. Solo importa el valor de la llave de más a
; la izquierda (bit más significativo). Recordar que las llaves se
; manejan con las teclas 0-7

PA equ 30h
CA equ 32h

org 1000h
  value db 80h
  correct db "Llave prendida"
  wrong db "Llave apagada"
  finishM db ?

org 3000h
configureCA: mov al,0ffh
  out CA, al
  ret

org 3010h
readKeys: in al, PA
  ret

org 3020h
printCorrect: mov bx, offset correct
  mov al, offset wrong - offset correct
  int 7
  ret

org 3030h
printWrong: mov bx, offset wrong
  mov al, offset finishM - offset wrong
  int 7
  ret

org 3040h
compareValue: mov ah, value
  and ah, al
  jnz printC
  call printWrong
  jmp toRet
printC: call printCorrect
toRet: ret

org 2000h
  push ax
  push bx
  call configureCA
  call readKeys
  call compareValue
  pop bx
  pop ax
  int 0
end