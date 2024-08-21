; Escribir un programa que convierta todos los carácteres de un string
; MENSAJE a minúscula. Por ejemplo, si MENSAJE contiene “Hola, Buenas Tardes”, luego de ejecutar el
; programa debe contener “hola, buenas tardes”.

org 1000h
  message db "SoY bLAs CASaLE"
  rubish db ?

  org 2000h
  mov ax, offset rubish
  dec ax
  mov bx, offset message
while: mov cl, [bx]
  cmp cl, 32
  jz false
  cmp cl, 90
  js true ; si esto da true quiere decir que es una mayus por que la Z = 90
  jz true
  jnz false
true: add cl, 32
  mov [bx], cl
false: inc bx
  cmp ax, bx
  jnz while
  hlt
  end
  