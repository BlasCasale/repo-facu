; Escribir un programa que convierta todos los carácteres de un string
; MENSAJE a minúscula. Por ejemplo, si MENSAJE contiene “Hola, Buenas Tardes”, 
; luego de ejecutar el programa debe contener “hola, buenas tardes”.

; Recibe la dirección de comienzo de un string en BX, su longitud en
; AL. Recorre el string, cambiando a minúscula las letras que sean mayúsculas. 
; No retorna nada, sino que modifica el string directamente en la memoria

org 1000h
  message db "Hola, Buenas Tardes"
  stop db ?

org 3000h
rutine: mov ah, [bx]
  cmp ah, 32
  jz anotherChar
  cmp ah, 44
  jz anotherChar
  cmp ah, 91
  jns anotherChar
  add ah, 32
  mov [bx], ah
anotherChar: inc bx
  dec al
  jnz rutine
  ret

org 2000h
  mov bx, offset message
  mov al, offset stop - offset message
  call rutine
  int 0
  end