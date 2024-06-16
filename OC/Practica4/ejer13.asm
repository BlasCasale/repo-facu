; Dada la frase "Organización y la Computación", almacenada en la memoria,
; escriba un programa que determine
; cuantas letras ‘a’ seguidas de ‘c’ hay en ella

org 1000h
  phrase db "Organización y la Computación"
  counter db 0
  charA db "a"
  charC db "c"

org 2000h
  mov bx, offset phrase
  mov al, charA ; movimiento para comparar despues
  mov ah, charC ; movimiento para comparar despues
  mov cl, counter ; seteo contador
  mov ch, offset counter - offset phrase ; se cuantos elementos tengo en el string
while: mov dl, [bx] ; seteo de a un char en el registro
  cmp dl, al
  jz itsA
continue: inc bx
  dec ch
  jnz while ; mientras siga teniendo elementos en el string por recorrer, salto
  jmp finish
itsA: inc bx ; incremento para apuntar al proximo char
  dec ch
  mov dl, [bx]
  cmp dl, ah
  jnz continue ; si no es la letra, continuo, sino incremento el contador y sigo
  inc cl
  jmp continue
finish: mov counter, cl
hlt
end