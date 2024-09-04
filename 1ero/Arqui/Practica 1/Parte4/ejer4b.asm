; El pasaje de parámetros más usual suele ser por valor y por registro. No obstante, en algunas ocasiones
; también se utilizan pasajes de parámetros más avanzados que permiten más flexibilidad o eficiencia.
; Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
; multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯B.
; Para hacerlo, implementar una subrutina MUL

; Pasando los parámetros por referencia desde el programa principal a través de registros, y
; devolviendo el resultado a través de un registro por valor

org 1000h
  a db 05h
  b db 03h
  res dw ?

org 3000h
mul: mov dl, [bx] ; seteo valores en registros
  mov bx, ax
  mov dh, [bx] ; idem
  mov ax, 0
  mov al, dl ; con esto seteo la etiqueta a en dl para la ulti
  mov cl, dh ; con esto voy a llevar el contador de la multiplicacion
  mov dx, ax ; con esto duplico el valor para multiplicar despues
  dec cl ; con esto tengo en cuenta la primer multiplicacion
loop: add ax, dx
  dec cl
  jnz loop
  ret

org 2000h
  mov bx, offset a
  mov ax, offset b
  call mul
  mov res, ax
  int 0
  end