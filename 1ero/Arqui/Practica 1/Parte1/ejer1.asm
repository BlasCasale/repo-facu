; Escribir un programa que dado un string llamado MENSAJE, almacenado en la
; memoria de datos, cuente la cantidad de veces que la letra ‘a’ (minúscula) 
; aparece en MENSAJE y lo almacene en la variable CANT. Por ejemplo,
; si MENSAJE contiene “Hola, Buenas Tardes”, entonces
; CANT debe valer 3.

org 1000h 
  message db "Hola, Buenas Tardes"
  quantity dw ?
  letter db "a"
  
  org 2000h
  ; me traigo la direccion de mensaje a bx para dir inde por reg y ax para saber
  ; el tope
  mov ax, offset quantity
  mov bx, offset message
  dec ax
  ; voy a usar dh para almacenar la "a" y dl para almacenar la letra de la palabra
  mov dh, letter
  mov cx, 0
while: mov dl, [bx]
  cmp dh, dl
  jz incCounter
jump: inc bx
  cmp ax, bx
  jnz while
  mov quantity, cx
  jmp finish
incCounter: inc cx
  jmp jump
finish: hlt
  end