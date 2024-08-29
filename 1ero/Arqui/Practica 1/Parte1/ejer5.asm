; Escribir un programa que solicite el ingreso de una contraseña de 4
; caracteres por teclado, sin visualizarla en pantalla. En caso de coincidir 
; con una clave predefinida (y
; guardada en memoria) que muestre el mensaje "Acceso permitido"; 
; caso contrario mostrar el mensaje
; "Acceso denegado", y volver a pedir que se ingrese una contraseña. 
; Al 5to intento fallido, debe mostrarse el
; mensaje “Acceso BLOQUEADO” y terminar el programa.

org 1000h
  password db "1a3t"
  response db "Acceso permitido"
  catch db "Acceso denegado"
  blocked db "Acceso bloqueado"
  request db "Ingrese una contraseña"
  entry db ?,?,?,?
  lastM db ?

  ; CX se usara para la comparacion
  ; DX se usara para llevar a cabo el conteo, dl para recorrer y dh para los intentos
  ; AX se usara para conservar momentaneamente las direcciones para guardarlas en la pila
  
org 3000h
read:  mov bx, offset entry
  mov al, offset lastM - offset entry
continue: int 6
  inc bx
  dec al
  jnz continue
  ret

  ; la parte baja de CX se usa para la entrada y la alta para lo guardado
org 3100h
compare: mov ax, offset password
  mov bx, offset entry
  mov dl, offset lastM - offset entry
cont:  mov cl, [bx] ; muevo a cl el contenido de entry
  push bx ; guardo la direccion de entry en la pila
  mov bx, ax ; muevo a bx la direccion de password
  mov ch, [bx] ; muevo a ch el contenido de password
  pop ax ; saco la direccion de entry de la pila
  push bx ; guardo la direccion de password en la pila
  mov bx, ax ; muevo a bx la direccion de entry
  pop ax ; saco la direccion de password de la pila
  inc bx ; incremento las direcciones
  inc ax ; idem
  cmp cl, ch
  jnz bad ; aca hago un salto por si sale mal y le seteo el value para hacer el and y bajar el counter
  dec dl
  jnz cont
  jz endSub
bad:  mov dx, 0001h ; seteo esto para hacer un AND despues y saber si es correcto
  jmp endComp
endSub: mov dx, 0000h ; seteo esto para hacer el AND despues
endComp: ret

org 3200h
accessDenied: mov bx, offset catch
  mov al, offset request - offset blocked
  int 7
  ret

org 3250h
accessBlocked: mov bx, offset blocked
  mov al, offset request - offset blocked
  int 7
  ret

org 3300h
printMessage: mov bx, offset request
  mov al, offset entry - offset request
  int 7
  ret
  
org 2000h
  ; DX va a servir como contador y tambien para hacer el AND despues del ret de compare
  mov dx, 5
return: push dx
  call printMessage
  call read
  call compare
  and dx, 0001h
  jz true
  call accessDenied
  pop dx
  dec dx
  jnz return
  jz accessBlocked
  jmp finish
true: mov bx, offset response
  mov al, offset catch - offset response
  int 7
finish: int 0
  end