; Escribir un programa que determine si un carácter (un string de longitud 1)
; es una letra mayúscula. El carácter está almacenado en la variable C,
; y el resultado se guarda en la variable RES de 8 bits. Si C es mayúscula, 
; debe almacenarse el valor 0FFh en RES, de lo contrario, debe
; almacenarse 0. Pista: Los códigos de las mayúsculas son todos consecutivos.
; Buscar en la tabla ASCII los caracteres mayúscula, y observar qué 
; valores ASCII tienen la ‘A’ y la ‘Z’.

org 1000h
  c db "a"
  res dw ?
org 2000h
  ; cx para cuando no es mayusucla y dx para mayuscula (la res)
  mov al, c
  mov cx, 0
  mov dx, 0FFh
  cmp al, 90
  jz true
  js true
  jns false
true:  mov res, dx
  jmp finish
false: mov res, cx
finish: hlt
  end