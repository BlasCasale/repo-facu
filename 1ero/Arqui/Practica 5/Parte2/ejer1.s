; Implementar una subrutina INGRESAR_NUMERO. La misma deberá solicitar el ingreso por teclado de un
; número entero del 1 al 9. Si el número ingresado es un número válido entre 1 y 9 la subrutina deberá
; imprimir por pantalla el número ingresado y retornar dicho valor. En caso contrario, la subrutina deberá
; imprimir por pantalla “Debe ingresar un número” y devolver el valor 0. Para ello, implementar y usar una
; subrutina ENTRE que reciba un número N y otros dos números B y A, y devuelva 1 si B<N<A o 0 de lo
; contrario.
; Usando la subrutina INGRESAR_NUMERO implementar un programa que invoque a dicha subrutina y
; genere una tabla llamada NUMEROS con los valores ingresados. La generación de la tabla finaliza cuando la
; suma de los resultados obtenidos sea mayor o igual a el valor almacenado en la dirección MAX.
; Al finalizar la generación de la tabla, deberá invocar a la subrutina PROCESAR_NUMEROS, que debe recibir
; como parámetro la dirección de la tabla NUMEROS y la cantidad de elementos y contar la cantidad de
; números impares ingresados. Se debe mostrar por pantalla el valor calculado, con el texto "Cantidad de
; Valores Impares: “ y el valor. Para ello, utilizar la subrutina ES_IMPAR codificada anteriormente

.data
control: .word 0x10000
data: .word 0x10008
enterNum: .asciiz "Debe ingresar un numero"
cantOfOdss: .asciiz "Cantidad de impares: "
max: .word 45
v: .word 0

.code
daddi $sp, $0, 0x400
ld $t0, control($0)
ld $t1, data($0)
dadd $t5, $0, $0 ; el contador para comparar con max
dadd $t4, $t4, $0 ; contador para la cant de elementos
daddi $t8, $0, v ; se carga la dir del vec
ld $t7, max($0) ; cargo el valor max para comparar
while: jal enterNumber
slt $t3, $a0, $t7
beqz $t3, while
dadd $t5, $a0, $t5 ; sumo lo que vino de la sub
nop
slt $t6, $t5, $t7 ; si el contador es menor a max, sigo  
beqz $t6, toEnd
sd $a0, 0($t8) ; guardo el elem
daddi $t8, $t8, 8 ; sumo 8 para las dir
daddi $t4, $t4, 1 ; sumo 1 a la cant de elementos
j while
toEnd: daddi $a3, $0, v ; vuevlo a cargar la dir como parametro
dadd $a2, $0, $t4 ; cargo la cant de elementos
jal processNumbers
daddi $t2, $0, cantOfOdss ; cargo la dir del str
daddi $t3, $0, 4 ; cargo el cod de imprimir str
sd $t2, 0($t1) ; mando a data
sd $t3, 0($t0) ; mando la orden
dadd $t2, $0, $v0 ; cargo el numero de impares
daddi $t3, $0, 1 ; imprimo el num de impares
sd $t2, 0($t1) ; cargo el num
sd $t3, 0($t0) ; imprimo el num
halt

enterNumber: daddi $t9, $0, enterNum ; cargo la dir por las dudas
daddi $sp, $sp, -8
sd $ra, 0($sp) ; guardo el ra en el sp para el llamado de la otra sub
daddi $t2, $0, 8
sd $t2, 0($t0) ; envio la orden de leer un int
ld $a0, 0($t1) ; leo el num y lo dejo en el regi para comparar
jal between
bnez $v0, continue
daddi $t2, $0, enterNum
sd $t2, 0($t1) ; envie la dir del str
daddi $t2, $0, 4 ; envio para imprimir el str
sd $t2, 0($t0)
j toEnd
continue: daddi $t2, $0, 1 ; imprimo el num
sd $a0, 0($t1) ;escribo el num que se paso por param
sd $t2, 0($t0) ; envio la orden
toEnd: ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

between: slti $v0, $a0, 10 ; si es menor deja 1
dadd $t2, $0, $0 ; con esto comparo para ver si es 1 o mas
beqz $v0, cutBetween ; si aca queda 0 quiere decir que es mas que 9 
slt $v0, $t2, $a0 ; ahora si ya dejo aca dos veces 1 quiere decir que esta entre ambos valores
cutBetween: jr $ra

itsPair: andi $v0, $a0, 1
jr $ra

processNumbers: daddi $sp, $sp, -8
sd $ra, 0($sp) ; guardo el ra para despues
dadd $t9, $0, $0 ; contador de impares
for: ld $a0, 0($a3) ; cargo el elemento para pasarlo a itsPair
jal itsPair
daddi $a2, $a2, -1 ; resto uno a la cant de elementos
beqz $v0, pair ; es par
daddi $t9, $t9, 1
pair: daddi $a3, $a3, 8
bnez $a2, for
ld $ra, 0($sp) ; cargo el return adress
dadd $v0, $0, $t9 ; cargo en v0 la cant de impares
daddi $sp, $sp, 8
jr $ra