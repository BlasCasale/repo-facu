; El pasaje de parámetros más usual suele ser por valor y por registro. No obstante, en algunas ocasiones
; también se utilizan pasajes de parámetros más avanzados que permiten más flexibilidad o eficiencia.
; Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
; multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯B.
; Para hacerlo, implementar una subrutina MUL

; Pasando los parámetros por referencia desde el programa principal a través de la pila, y
; devolviendo el resultado a través de un registro por valor.

org 1000h
  a dw 5h
  b dw 3h
  res dw ?

org 3000h
rutine: pop ax ; guardo la direccion de retorno momentaneamente aca en ax
  pop bx ; guardo la direccion de b en bx para dir ind
  mov dx, [bx]
  pop bx
  push ax ; guardo la direccion de retorno al pp
  mov ax, [bx]
  mov cx, dx
  mov dx, ax ; copio el contenido para multiplicar
  dec cx ; contador y decremento uno por si la multiplicacion es por uno
  jz finish
loop: add ax, dx
  dec cx
  jnz loop
finish: ret

org 2000h
  mov bx, offset a
  push bx
  mov bx, offset b
  push bx
  call rutine
  mov res, ax
  int 0
  end
  