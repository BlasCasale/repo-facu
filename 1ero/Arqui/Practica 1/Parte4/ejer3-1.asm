; Escribir un programa que dado un string llamado MENSAJE, almacenado en la
; memoria de datos, cuente la cantidad de veces que la letra ‘a’ (minúscula) 
; aparece en MENSAJE y lo almacene en la variable CANT. Por ejemplo,
; si MENSAJE contiene “Hola, Buenas Tardes”, entonces
; CANT debe valer 3.

; Recibe la dirección de comienzo de un string en BX, su longitud en AL, y el
; carácter a contar en AH. Retorna en CL la cantidad de 
; veces que aparece el carácter.

org 1000h
  letter db 'a'
  message db "Hola, buenas tardes"
  quantity db ?

org 3000h
rutine: mov ch, [bx]
  cmp ch, ah
  jz true
  jnz false
true: inc cl
false: inc bx
  dec al
  jnz rutine
  ret
  
org 2000h
  mov al, offset quantity - offset message
  mov bx, offset message
  mov ah, letter
  mov cl, 0
  call rutine
  mov quantity, cl
  int 0
  end