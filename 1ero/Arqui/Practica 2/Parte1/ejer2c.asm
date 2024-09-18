; Control de luces mediante llaves: Escribir un programa que permite encender y 
; apagar las luces mediante las llaves. El programa no deberá terminar nunca, 
; y continuamente revisar el estado de las llaves, y actualizar de forma consecuente 
; el estado de las luces. La actualización se realiza simplemente prendiendo la luz
; i, si la llave i correspondiente está encendida (valor 1), y apagándola en caso
; contrario. Por ejemplo, si solo la primera llave está encendida, entonces solo 
; la primera luz se debe quedar encendida.

PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

org 3000h
configureCA: mov al, 0ffh
  out CA, al
  ret

org 3010h
configureCB: mov al, 00h
  out CB, al
  ret

org 3020h
readKey: in al, PA
  ret

org 3030h
turnOn: out PB, al
  ret

org 3040h
loop: call readKey
  call turnOn
  jmp loop
  ret

org 2000h
  push ax
  call configureCA
  call configureCB
  call loop
  pop ax
int 0
end