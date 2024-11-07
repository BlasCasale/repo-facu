.data
result: .word 0

.code
daddi $a0, $0, 10
daddi $a1, $0, 15
jal add
sd $v0, result($0)
halt

; sub
; recibe en $a0 y $a1 valores a sumar
; retorna la suma en $v0
add: dadd $v0, $a0, $a1
jr $ra