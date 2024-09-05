; El pasaje de parámetros más usual suele ser por valor y por registro. No obstante, en algunas ocasiones
; también se utilizan pasajes de parámetros más avanzados que permiten más flexibilidad o eficiencia.
; Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
; multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯B.
; Para hacerlo, implementar una subrutina MUL

; Pasando los parámetros por valor desde el programa principal a través de la pila, y
; devolviendo el resultado a través de un registro por valor.

org 1000h
  a dw 5
  b dw 3
  res dw ?

org 3000h
rutine: pop bx ; en bx almaceno momentaneamente la direccion de retorno
  pop ax ; seteo valores en registros
  pop dx
  push bx ; la devuelvo a la pila
  mov cx, ax
  dec dx ; asumo que se multiplico por 1, contador en dx
  jz finish
loop: add ax, cx
  dec dx
  jnz loop
finish: ret

org 2000h
  mov ax, a
  push ax
  mov ax, b
  push ax
  call rutine
  mov res, ax
  int 0
  end