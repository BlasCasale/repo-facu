; Escribir un programa que sume dos números representados en Ca2 de 32 bits 
; almacenados en memoria de datos y
; etiquetados NUM1 y NUM2 y guarde el resultado en RESUL 
; (en este caso cada dato y el resultado ocuparán 4 celdas
; consecutivas de memoria). Verifique el resultado final y 
; almacene 0FFH en la celda BIEN en caso de ser correcto o
; en otra MAL en caso de no serlo. Recordar que el MSX88 trabaja con 
; números en Ca2 pero tener en cuenta que las
; operaciones con los 16 bits menos significativos de cada número deben 
; realizarse en BSS.

; necesito usar la pila y usar dos registros completos para la suma
; evaluando el carry para hacer un inc al registro donde tenga la info
; necesito calcular la direccion siguiente a la inicial para traer la parte baja
; guardar el resultado de la suma de los 16 bits - sig para conservar el result
; si tengo carry en esa suma tendria que guardala en un registro para sumarlo =>
; a los 16 mas significativos

org 1000h
  num1 dw 8000h, 0020h
  num2 dw 8000h, 0041h
  result dw 0, 0
  good db 0
  bad db 0
  response db 0FFh

org 2000h
  mov bx,offset num1
  add bx, 2 ; aumento dos direcciones para apuntar a la parte baja
  mov cx, [bx]
  mov bx, offset num2
  add bx, 2 ; vuelvo a aumentar dos para apuntar de nuevo a la parte baja
  mov dx, [bx]
  mov al, 0 ; seteo un 0 en ax para poder almacenar un posible carry
  add cx, dx
  mov bx, offset result
  add bx, 2
  mov [bx], cx
  mov ah, response ; seteo lo que guardar despues
  jc incrementAx
continue: mov bx, offset num1
  mov cx, [bx]
  mov bx, offset num2
  mov dx, [bx]
  add cl, al ; aca sumo el carry
  add cx, dx
  mov result, cx
  jno true ; si la cuenta no tiene overflow es que el resultado esta bien
  jo false ; si tiene overflow, dio mal
incrementAx: inc ax ; aumento el carry para despues
  jmp continue
true: mov good, ah
  jmp finish
false: mov bad, ah  
finish:  hlt
  end