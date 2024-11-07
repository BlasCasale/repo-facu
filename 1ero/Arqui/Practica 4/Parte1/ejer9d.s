; d) Generar string Escribir un programa que genere un string de la siguiente forma: “abbcccddddeeeee....”, así hasta la
; letra “h”. Para ello debe utilizar un loop e ir guardando los códigos ascii en la memoria. El string debe finalizar con el
; valor ascii 0 para que esté bien formado (debe agregar un elemento más, que valga 0, al final del string).

.data
str: .word 0

.code
daddi $s7, $0, str ; cargo la dir
daddi $s6, $0, 8 ; cant de ite a dar por reg
dadd $s0, $0, $0 ; registro donde voy a guardar el str
daddi $t0, $0, 0 ; cantidad de iteraciones que llevo (7 max para cargar todo el reg)
daddi $t1, $0, 97 ; cargo la "a"
dadd $t6, $0, $0 ; 0 para llegar a tope de letras
daddi $t7, $0, 1 ; tope de las letras a meter
daddi $t8, $0, 105 ; cargo la h para cortar para comparar con slt
daddi $t9, $0, 8 ; para sumarle a la dir base del reg y multipliciar los corrimientos de $t0 dependiendo de las vueltas
while: dmul $t2, $t0, $t9 ; la mult para saber los despla
dsllv $t3, $t1, $t2 ; corro los bits N veces
or $s0, $s0, $t3 ; hago el or para dejar lo mismo y sumarle lo que tenia antes
daddi $t6, $t6, 1 ; sumo uno para saber cuantas letras tengo que meter
daddi $t0, $t0, 1 ; sumo una ite
beq $t0, $s6, saveData
bne $t6, $t7, while
dadd $t6, $0, $0 ; seteo en 0 para arrancar de nuevo
daddi $t7, $t7, 1 ; sumo uno para incrementar la cant de letras
daddi $t1, $t1, 1 ; sumo uno a la letra
bne $t1, $t8, while
saveData: sd $s0, 0($s7)
dadd $s0, $0, $0
dadd $s7, $s7, $t9
dadd $t0, $0, $0 ; reinicio el contador
bne $t1, $t8, while
halt