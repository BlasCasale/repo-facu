PA equ 30h
PB equ 31h
CA equ 32h
CB equ 33h

; 1 entrada
; 0 salida

; configuracion de CA
mov al, 0ffh ; 11111111
out CA, al

; configuracion de CB
mov al, 0f0h ; 11110000
out CB, al

; configuro todos los bits de PA como entrada
; configuro los 4 bits mas sig de PB como entrada y el resto salida

; configurar todos los bits de PA como salida
; mandar el valor 50 a traves de PA hacia un dispositivo externo

; configuramos CA para que sea todo de salida 
mov al, 00h
out CA, al 

; enviar dato por PA
mov al, 50
out PA, al