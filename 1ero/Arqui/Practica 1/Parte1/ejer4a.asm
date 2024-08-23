; Escribir un programa que muestre en pantalla las letras mayúsculas (“A” a la “Z”).
; Pista: Podés buscar los códigos de la “A” y la “Z” en una tabla de códigos ascii. 
; No utilizar un vector.
; Usar una sola variable de tipo db, e incrementar el valor de esa 
; variable antes de imprimir.

org 1000h
  letter db ?

org 2000h
  mov letter, 65
  mov ah, 91 - 65 ; resta de la tabla ascii para saber las iteraciones, hay que sumarle otro mas de la posi que esta para que itere sobre ese tambien
jump:  mov bx, offset letter
  mov al, 1
  int 7
  inc letter
  dec ah
  jnz jump
  int 0
  end