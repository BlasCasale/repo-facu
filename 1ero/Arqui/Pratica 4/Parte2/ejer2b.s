; a) Comprobación simple: Escriba un programa que solicite el ingreso por teclado de una clave, representada por un
; string de 4 carácteres. Para indicar al usuario que debe ingresar un valor, imprimir en pantalla “Ingrese una clave de
; 4 carácteres”. Luego, debe comparar la secuencia ingresada con una cadena almacenada en la variable clave. Si las
; dos cadenas son iguales entre sí, mostrar el texto “Clave correcta: acceso permitido” en la salida estándar del
; simulador (ventana Terminal). En cambio, si las cadenas no son iguales, mostrar “Clave incorrecta.”

.data
password: .ascii "1234"
response: .ascii " "
message: .asciiz "Ingrese una clave de 4 caracteres"
rigth: .asciiz "Clave correcta: acceso permitido"
failure: .asciiz "Clave incorrecta"
control: .word 0x10000
data: .word 0x10008

.code
; t0 para control y t1 para data, $t2 para el control y sus valores
daddi $t9, $0, failure ; cargo la dir del fallo para despues
ld $t0, control($0)
ld $t1, data($0)
daddi $t3, $0, message ; cargo dir
sb $t3, 0($t1)
daddi $t2, $0, 4
sb $t2, 0($t0)
ld $s1, password($0) ; cargo en s1 la contra
sd $t3, 0($t1) ; envio dir
daddi $t2, $0, 4 ; cargo codigo para imprimir str
sd $t0, 0($t2) ; envio el cod de op
daddi $t7, $0, 4 ; cant de char a pedir
dadd $s0, $0, $0 ; lo seteo en 0 para guardar el str
start: daddi $v0, $0, response ; cargo la dir para guardar el byte
dadd $t8, $0, $0 ; 0 para las iteraciones
request: daddi $t2, $0, 9 ; leo el char
sd $t2, 0($t0) ; envio la orden
lbu $s0, 0($t1) ; cargue el char en $s0
sb $s0, 0($v0) ; cargue 1 byte
daddi $v0, $v0, 1 ; sumo uno para el otro byte
daddi $t8, $t8, 1 ; sumo una iteracion
bne $t8, $t7, request ; ya pedi la clave si salgo de aca
ld $s0, response($0) ; cargo la resp para comparar
bne $s0, $s1, badResponse ; si no coinciden, respondo mal
daddi $v1, $0, rigth ; cargo la respuesta correcta
sd $v1, 0($t1) ; envio a data el str
daddi $t2, $0, 4
sd $t2, 0($t0) 
j toEnd
badResponse: sd $t9, 0($t1) ; envio la data
daddi $t2, $0, 4 ; cargo el reg para enviar el str y que imprima
sd $t2, 0($t0)
j start
toEnd: halt