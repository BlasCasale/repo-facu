; Escribir un programa en WinMIPS64 que:
; a) Lee 2 números A y B de la memoria de datos, y calcula S, P y D, que luego se guardan en la memoria de datos.
; b) Dadas dos variables A y B de la memoria, calcula y almacena C
; c) Calcula el factorial de N, y lo guarda en F
; d) Calcula el logaritmo (entero) en base 2 de N (N positivo) mediante divisiones sucesivas y lo guarda en L
; e) Guarda en B el valor 1 si A es impar y 0 de lo contrario
; Los nombres de variables como A, B, C, etc, deben implementarse usando variables de tipo word a las cuales se lee y
; escribe de memoria con ld y sd.

; b)
; if A  0
;   C = 0
; else:
;   if A > B
;     C = A * 2
;   else:
;     C = B

.data
a: .word 1
b: .word 15
c: .word 6

.code
ld $t0, a($0)
ld $t1, b($0)
bnez $t0, else
sd $0, c($0)
j toEnd
else: slt $t2, $t1, $t0 ; si B < A
  beqz $t2, secondElse
  dadd $t3, $t0, $t0
  sd $t3, c($0)
  j toEnd
secondElse: sd $t1, c($0)
toEnd: halt