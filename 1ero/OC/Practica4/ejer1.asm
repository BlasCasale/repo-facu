; F = [(A+B)/C]-D

org 1000h
a db 6
b db 4
c db 2
d db 1
f db ?
i db 0

org 2000h
mov al, a
add al, b
div: inc i
     sub al, c
     jnz div
     mov al, i
     sub al, d
     mov f, al
     hlt
     end