; Escribir un programa que, dado un número X, 
; genere un arreglo con todos los resultados que se obtienen hasta llegar
; a 0, aplicando la siguiente fórmula: si X es par, se le resta 7
; si es impar, se le suma 5, y al resultado se le aplica
; nuevamente la misma fórmula. 
; Ej: si X = 3 entonces el arreglo tendrá: 8, 1, 6, -1, 4, -3, 2, -5, 0.

org 1000h
  initial db 9
  even db 7
  odd db 5
  array db ?

org 2000h
       mov dl, even
       mov dh, odd
       mov al, initial
       mov bx, offset array
       mov [bx], al
       inc bx
       mov ch, 2 ;aca pongo un 2 para restar y saber si es par o no
       mov cl, al
loop:  sub cl, ch
       cmp cl, 0
       jz loop
  hlt
  end