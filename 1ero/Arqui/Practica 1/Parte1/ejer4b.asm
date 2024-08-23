; ¿Qué deberías modificar en a) para mostrar los dígitos (“0” al “9”)? 
; ¿Y para mostrar todos los
; carácteres disponibles en el código ASCII? Probar en el simulador.

org 1000h
  letter db ?

org 2000h
  mov letter, 48
  mov ah, 58 - 48 ; resta de la tabla ascii para saber las iteraciones
jump:  mov bx, offset letter
  mov al, 1
  int 7
  inc letter
  dec ah
  jnz jump
  int 0
  end