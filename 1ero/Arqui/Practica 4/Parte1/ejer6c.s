; Dado un vector definido como: V .word 5, 2, 6, escribir programas para:
; a) Calcular la suma de los 3 valores sin utilizar un loop o lazo
; Pista: Usar tres instrucciones ld $t1, V($t2), donde $t2 va aumentando de a 8 bytes el desplazamiento.
; b) Calcular la suma de los 3 valores utilizando un lazo con la dirección base y un registro como desplazamiento. Pista:
; Idem anterior, pero ahora con una única instrucciones de lectura y $t2 se incrementa dentro de un loop
; c) Calcular la suma de los 3 valores utilizando un lazo, con una dirección base de 0 y un registro como puntero.
; Pista: Cargar la dirección en un registro con daddi $t2, $zero, V y luego cargar los valores con ld $t1,
; 0($t2)
; d) ¿Qué cambios se deberían realizar al programa del inciso b) si los elementos fueran de 32 bits: V .word32 5,
; 2, 6?

.data
v: .word 5, 2, 6
c: .word 0

.code
daddi $t2, $0, v
dadd $t0, $0, $0
daddi $t3, $0, 3
loop: ld $t1, 0($t2)
dadd $t0, $t1, $t0
daddi $t2, $t2, 8
daddi $t3, $t3, -1
bnez $t3, loop
sd  $t0, c($0)
halt