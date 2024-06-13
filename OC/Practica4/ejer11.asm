; Escribir un programa que, utilizando las mismas variables y datos que el programa del punto anterior (TABLA, FIN,
; TOTAL, MAX), determine cuántos de los elementos de TABLA son menores o iguales que MAX. Dicha cantidad
; debe almacenarse en la celda TOTAL.

org 1000h
  initial db 0
  multiple db 5
  max db 40
  dir db ?

org 2000h
  mov al, initial
  mov cl, multiple
  mov dl, max
  mov bx, offset dir
  mov [bx], al
while:  add al, cl
    inc bx
    mov [bx], al
    cmp al, dl
    jnz while
  mov [bx], al
  hlt
  end