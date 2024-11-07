; no existe ni push ni pop, hay que crear la pila
; se hace con daddi, ld y sd

; se usa el $sp para eso

; iniciamos el $sp con
daddi $sp, $0, 0x400 ; valor en hexa por la direccion mas grande
; push a la pila
daddi $sp, $sp, -8
sd $t0, 0($sp)
; pop de la pila
ld $t0, 0($sp)
daddi $sp, $sp, 8