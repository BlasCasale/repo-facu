; Escribir un programa que, dado un número X, 
; genere un arreglo con todos los resultados que se obtienen hasta llegar
; a 0, aplicando la siguiente fórmula: si X es par, se le resta 7,
; si es impar, se le suma 5, y al resultado se le aplica
; nuevamente la misma fórmula.
; Ej: si X = 3 entonces el arreglo tendrá: 8, 1, 6, -1, 4, -3, 2, -5, 0

org 1000h
  num db 8
  even db 7 ; para restar a los pares
  odd db 5 ; para sumar a los impares
  array db ?

org 2000h
  mov bx, offset array
  mov cl, num
  mov [bx], cl ; se hace la primera carga del array
  mov al, even
  mov ah, odd
  mov ch, cl ; esta segunda carga en registro se hace para usar en un and
while: and cl, 01h ; con este and se prende el flag de z para determinar si es par o no
  jz subEven
  jnz addOdd
subEven: sub ch, al
  jmp next
addOdd: add ch, ah
next: inc bx
  mov [bx], ch
  cmp ch, 0
  jz finish ;si la resta anterior prende el flag de z, se termino el ejer
  mov cl, ch ; se hace esto para usar el and arriba con el valor actual
  jnz while
finish: hlt
  end