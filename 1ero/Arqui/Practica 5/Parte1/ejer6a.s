; Factorial: Implemente la subrutina factorial, que dado un número N devuelve factorial(N) = N! = N * (N-1) *
; (N-2) * ...* 2 * 1. Por ejemplo, el factorial de 4 es 4! = 4*3*2*1. Recordá también que el factorial de 0 también
; existe, y es factorial(0) =0! = 1

.data
num: .word 4
result: .word 0

.code
daddi $sp, $0, 0x400
ld $a0, num($0)
daddi $a1, $a0, -1
jal factorial
sd $v0, result($0)
halt

; en a0 se pasa el numero a almacenar en la llamada recursiva y en a1 el mismo pero para restarle 1 y hacerlo
factorial: beqz $a0, itsZero
while: beqz $a1, toFinish
dmul $a0, $a0, $a1
daddi $a1, $a1, -1
j while
itsZero: daddi $v0, $0, 1
j toEnd
toFinish: dadd $v0, $a0, $0
toEnd: jr $ra