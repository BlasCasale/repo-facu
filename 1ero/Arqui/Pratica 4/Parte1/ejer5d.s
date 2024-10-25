; Escribir un programa en WinMIPS64 que:
; a) Lee 2 números A y B de la memoria de datos, y calcula S, P y D, que luego se guardan en la memoria de datos.
; b) Dadas dos variables A y B de la memoria, calcula y almacena C
; c) Calcula el factorial de N, y lo guarda en F
; d) Calcula el logaritmo (entero) en base 2 de N (N positivo) mediante divisiones sucesivas y lo guarda en L
; e) Guarda en B el valor 1 si A es impar y 0 de lo contrario
; Los nombres de variables como A, B, C, etc, deben implementarse usando variables de tipo word a las cuales se lee y
; escribe de memoria con ld y sd.

; d)
; L = 0
; while N > 0
; N = N / 2
; L = L + 1

.data
l: .word 0
n: .word 32

.code
ld $t0, l($0)
ld $t1, n($0)
daddi $t2, $0, 2
loop: ddiv $t1, $t1, $t2
daddi $t0, $t0, 1
slt $t3, $0, $t1
bnez $t3, loop
sd $t0, l($0)
halt