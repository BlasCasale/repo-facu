; a <= b
; c = a
; else
; c = b

; al = a
; bl = b
; cl = c

org 1000h
  a db 3
  b db 1
  c db ?

org 2000h
  mov al, a
  mov bl, b
  mov cl, c
  cmp al, bl
  js true
  jz true
  jnc false
true: mov cl, al
      jmp fin
false: mov cl, bl
fin:   mov c, cl
      hlt
  end