; Escribir un programa en WinMIPS64 que:
; a) Lee 2 números A y B de la memoria de datos, y calcula S, P y D, que luego se guardan en la memoria de datos.
; b) Dadas dos variables A y B de la memoria, calcula y almacena C
; c) Calcula el factorial de N, y lo guarda en F
; d) Calcula el logaritmo (entero) en base 2 de N (N positivo) mediante divisiones sucesivas y lo guarda en L
; e) Guarda en B el valor 1 si A es impar y 0 de lo contrario
; Los nombres de variables como A, B, C, etc, deben implementarse usando variables de tipo word a las cuales se lee y
; escribe de memoria con ld y sd.

; c)
; F = 1
; for i=1...N
; F = F * i

.data
f: .word 1
n: .word 6
result: .word 0

.code
ld $t0, f($0)
ld $t2, n($0)
daddi $t1, $0, 1 ; seteo en 0 para futura comprobacion del for
loop: dmul $t0, $t0, $t1
daddi $t1, $t1, 1
dsub $t3, $t1, $t2
bnez $t3, loop
sd $t0, result($0)
halt