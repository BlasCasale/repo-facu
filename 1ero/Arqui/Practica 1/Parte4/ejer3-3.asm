; Escribir un programa que convierta un carácter de mayúsculas a
; minúsculas. El carácter está almacenado en la variable C. 
; Asumir que el carácter es una mayúscula.
; Pista: Las mayúsculas y las minúsculas están en el mismo 
; orden en el ASCII, y por ende la distancia
; entre, por ejemplo, la “A” y la “a” es la misma que la distancia 
; entre la “Z” y la “z”

; Recibe un carácter mayúscula en AL y lo devuelve como minúscula.

org 1000h
  c db 'J'

org 3000h
rutine: add al, 32
  ret

org 2000h
  mov al, c
  call rutine
  int 0
  end