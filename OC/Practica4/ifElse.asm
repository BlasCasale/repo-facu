org 1000h
  a db 1
  b db 1
  c db 0
  result db  ?

org 2000h
  mov al, a
  mov bl, b
  mov cl, c
  cmp al, bl
  jz equal
  cmp al, bl
  js notEqual
equal: mov cl, al
  jmp fin
notEqual: mov cl, bl
fin: mov result, cl
  hlt
  end
