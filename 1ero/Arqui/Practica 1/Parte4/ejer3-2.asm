; Escribir un programa que determine si un carácter (un string de longitud 1)
; es una letra mayúscula. El carácter está almacenado en la variable C,
; y el resultado se guarda en la variable RES de 8 bits. Si C es mayúscula, 
; debe almacenarse el valor 0FFh en RES, de lo contrario, debe
; almacenarse 0. Pista: Los códigos de las mayúsculas son todos consecutivos.
; Buscar en la tabla ASCII los caracteres mayúscula, y observar qué 
; valores ASCII tienen la ‘A’ y la ‘Z’.

; Recibe un carácter en el registro AL y retorna en AH el valor 0FFh si es
; mayúscula y 0 de lo contrario.

org 1000h
  c db 'A'
  res db ?

org 3000h
rutine: cmp al, 90
  js mayus
  mov ah, 0
  jmp finish
mayus: mov ah, 0FFh
finish: ret

org 2000h
  mov al, c
  call rutine
  mov res, ah
  int 0
  end