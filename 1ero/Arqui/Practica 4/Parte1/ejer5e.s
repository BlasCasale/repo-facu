; Escribir un programa en WinMIPS64 que:
; a) Lee 2 números A y B de la memoria de datos, y calcula S, P y D, que luego se guardan en la memoria de datos.
; b) Dadas dos variables A y B de la memoria, calcula y almacena C
; c) Calcula el factorial de N, y lo guarda en F
; d) Calcula el logaritmo (entero) en base 2 de N (N positivo) mediante divisiones sucesivas y lo guarda en L
; e) Guarda en B el valor 1 si A es impar y 0 de lo contrario
; Los nombres de variables como A, B, C, etc, deben implementarse usando variables de tipo word a las cuales se lee y
; escribe de memoria con ld y sd.

; e)
; if impar(A)
; B = 1
; else:
; B = 0

.data
a: .word 31
b: .word 0

.code
ld $t0, a($0)
daddi $t1, $0, 2
daddi $t2, $0, 1
ddiv $t0, $t0, $t1
bnez $t0, toIf
sd $0, b($0)
j toEnd
toIf: sd $t2, b($0)
toEnd: halt
