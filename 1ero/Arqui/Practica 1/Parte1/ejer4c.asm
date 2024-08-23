; ¿Qué deberías modificar en a) para mostrar los dígitos (“0” al “9”)? 
; ¿Y para mostrar todos los
; carácteres disponibles en el código ASCII? Probar en el simulador.

; Modificar el ejercicio b) que muestra los dígitos, para que cada dígito 
; se muestre en una línea separada.
; Pista: El código ASCII del carácter de nueva línea es el 10, comúnmente 
; llamado “\n” o LF (“line feed” por sus siglas en inglés y porque se 
; usaba en impresoras donde había que “alimentar” una nueva línea).

org 1000h
  letter db ?

org 2000h
  mov letter, 48
  mov ah, 58 - 48 ; resta de la tabla ascii para saber las iteraciones
jump:  mov bx, offset letter
  mov cl, [bx] ; seteo letter aca para guardarlo para despues
  inc cl ; incremento el num en cl
  mov al, 1
  int 7 
  mov byte ptr [bx], 10 ; seteo el salto de linea en 1000h
  mov al, 1
  int 7 ; imprimo el salto
  mov byte ptr [bx], cl
  dec ah
  jnz jump
  int 0
  end