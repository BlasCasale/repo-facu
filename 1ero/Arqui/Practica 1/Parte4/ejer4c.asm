; El pasaje de parámetros más usual suele ser por valor y por registro. No obstante, en algunas ocasiones
; también se utilizan pasajes de parámetros más avanzados que permiten más flexibilidad o eficiencia.
; Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
; multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯B.
; Para hacerlo, implementar una subrutina MUL

; Pasando los parámetros por valor desde el programa principal a través de registros, y
; devolviendo el resultado a través de un registro por referencia

org 1000h
  a db 05h
  b db 03h
  res dw ?

org 3000h
mul: mov ax, 0
  mov dx, 0
  mov dl, ch
  mov al, ch
  dec cl ; con esto tengo en cuenta la primer multiplicacion
  mov bx, offset res
loop: add ax, dx
  dec cl
  jnz loop
  mov [bx], ax
  ret

org 2000h
  mov cl, b ; contador
  mov ch, a ; numero a multiplicar
  call mul
  int 0
  end
  