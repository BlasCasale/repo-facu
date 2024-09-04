; El pasaje de parámetros más usual suele ser por valor y por registro. No obstante, en algunas ocasiones
; también se utilizan pasajes de parámetros más avanzados que permiten más flexibilidad o eficiencia.
; Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
; multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯B.
; Para hacerlo, implementar una subrutina MUL

; Pasando los parámetros por valor desde el programa principal a través de los registros AL y
; AH, y devolviendo el resultado a través del registro AX por valor

org 1000h
  a db 05h
  b db 03h
  res dw ?

org 3000h
mul: mov cl, ah ; con esto voy a llevar un conteo para la multiplicacion
  mov ah, 0
  mov dl, al
  mov dh, 0
  dec cl ; con esto se haria la primer multiplicacion
loop: add ax, dx
  dec cl
  jnz loop
  ret

org 2000h
  mov al, a
  mov ah, b
  call mul
  mov res, ax
  int 0
  end