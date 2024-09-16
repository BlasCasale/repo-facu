PB equ 31h
CB equ 33h

; configuro cb
mov al, 00h
out CB, al

; muevo los datos
mov al, 21h
out PB, al

; apago todas las luces
mov al, 00h
out PB, al

; prendo todas las luces
not al
out PB, al