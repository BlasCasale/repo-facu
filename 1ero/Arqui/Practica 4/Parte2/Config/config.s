.data
dirControl: .word 0x10000
dirData: .word 0x10008
num: .word 5

.code
ld $t2, dirControl($0) ; se carga el contenido en ambos registros para usarlo como punteros
ld $t3, dirData($0)

ld $t1, num($0)
sd $t1, 0($t3) ; guardo en data
daddi $t1, $0, 1 ; cod para imprimir
sd $t1, 0($t2) ; imprimo