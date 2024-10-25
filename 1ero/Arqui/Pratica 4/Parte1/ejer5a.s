; Escribir un programa en WinMIPS64 que:
; a) Lee 2 números A y B de la memoria de datos, y calcula S, P y D, que luego se guardan en la memoria de datos.
; b) Dadas dos variables A y B de la memoria, calcula y almacena C
; c) Calcula el factorial de N, y lo guarda en F
; d) Calcula el logaritmo (entero) en base 2 de N (N positivo) mediante divisiones sucesivas y lo guarda en L
; e) Guarda en B el valor 1 si A es impar y 0 de lo contrario
; Los nombres de variables como A, B, C, etc, deben implementarse usando variables de tipo word a las cuales se lee y
; escribe de memoria con ld y sd.

; a)
; S = A + B
; P = 2 + (A*B)
; D = A^2 / B
.data
a: .word 32
b: .word 15
s: .word 0
p: .word 0
d: .word 0

.code
ld $t0, a($0)
ld $t1, b($0)

dadd $t2, $t0, $t1
dmul $t3, $t0, $t1
daddi $t3, $t3, 2
dmul $t4, $t0, $t0
ddiv $t4, $t4, $t1
sd $t2, s($0)
sd $t3, p($0)
sd $t4, d($0)
halt