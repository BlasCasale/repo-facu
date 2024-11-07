.data
str: .asciiz "Hola"
long: .word 0

.code
daddi $sp, $0, 0x400
daddi $a0, $0, str
jal calcLong
sd $v0, long($0)
halt

calcLong: daddi $sp, $sp, -16 ; $sp= 0x3F0
sd $t0, 8($sp) ; guardo t0 para usarlo 0x3F8 => el 8 es el desplazamiento
sd $t1, 0($sp) ; guardo t1 para usarlo 0x3F0
dadd $t0, $0, $0
while: lbu $t1, 0($a0) ; traigo un char del str
beqz $t1, end
daddi $t0, $t0, 1 ; sumo uno a la long
daddi $a0, $a0, 1 ; avanzo 1 byte
j while
end: ld $t1, 0($sp) ; 0x3F0
ld $t0, 8($sp) ; 0x3F8
daddi $sp, $sp, 16 ; $sp = 0x400
dadd $v0, $0, $t0
jr $ra