; a) Strings en memoria: En WinMIPS los strings se almacenan como vectores de caracteres. Observar cómo se
; almacenan en memoria los códigos ASCII de los caracteres (código de la letra “a” es 61H). Además, los strings se
; suelen terminar con un carácter de fin con código 0, es decir el valor 0. Para definir un string en una variable y no
; tener que agregar a mano el valor 0, se puede utilizar el tipo de datos asciiz. Si en lugar de eso se utiliza el tipo ascii
; (sin la z) no se agrega el 0 de forma automática. Probar estas definiciones en el simulador y observar cómo se
; organizan en la memoria las variables.

.data
cadena1: .asciiz "ABCdef1"
cadena2: .ascii "ABCdef11"
cadena3: .asciiz "ABCdef1111111"
num: .word 5
