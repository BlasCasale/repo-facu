; Escribir un programa que permita a una persona desafiar a otra jugando 
; al ahorcado secuencial. En el ahorcado secuencial, a diferencia del 
; tradicional, hay que adivinar las letras en orden. Por ejemplo, si la
; palabra a adivinar es “alma”, la persona que adivina debe ingresar primero 
; la “a”, luego la “l”, luego la “m” y finalmente debe ingresar nuevamente la “a”.
; El programa tiene dos fases: primero, una persona carga la palabra a adivinar, y
; luego la otra persona adivina la palabra.
; ● Fase 1: Se debe mostrar el mensaje “Ingresá la palabra a adivinar: ”. 
; Luego, se debe leer un string hasta que llegue el carácter “.”, y al terminar 
; de leer, se debe mostrar el mensaje “Comenzá a adivinar!”.
; ● Fase 2: se deben leer carácteres hasta que la persona termine de adivinar
; todo el string, o se le acaben los intentos.
; Si la persona ingresa un carácter que coincide con el que tenía que adivinar, 
; se muestra ese carácter en pantalla, y se avanza al carácter siguiente del 
; string a adivinar. De lo contrario, no se muestra nada, y la persona debe 
; seguir intentando. Sí adivinó todo el string, debe mostrarse el mensaje “Ganaste!”.
; La persona tiene 50 intentos de letras para adivinar el string. Si se acaba la 
; cantidad de intentos y no adivinó todo el string, debe mostrarse el 
; mensaje “Perdiste, el string era S”, donde S es el string a adivinar completo.

org 1000h
  message db "Ingresa la palabra a adivinar:"
  cut db "."
  jump db 10 ; salto de linea
  start db "Comenza a adivinar"
  win db "Ganaste"
  lost db "Perdiste, el string era "
  tries db 50
  quantity db 0 ; aca guardo la longitud del string para poder iterarlo despues
  read db ?
  string db ?
  
org 3000h
print: mov bx, offset message
  mov al, offset cut - offset message
  int 7
  call printJump
  ret

org 3020h
printJump: mov bx, offset jump
  mov al, 1
  int 7
  ret

org 3030h
getString: mov ch, cut ; guardo el corte para comparar en cada ingreso del string
  mov bx, offset string
  mov cl, 0 ; contador para guardar la long
loop: int 6 ; se lee y compara con el '.'
  cmp [bx], ch
  jz finish ; si es 0 o sea el corte, hago un ret
  inc bx
  inc cl
  jmp loop ; sino sigo saltando hasta que se termine y 
           ; siempre voy guardando en la sig posi de memoria
  mov quantity, cl ; con esto guardo la long del string leido antes
finish: ret

org 3070h
printStart: mov bx, offset start
  mov al, offset win - offset start
  int 7
  call printJump
  ret

org 3090h 
startGame: mov cl, tries ; me traigo los intentos a cl
  mov ah, quantity ; con esto seteo la cantidad de avances en ah y lo resto con dl
  mov dx, 0 ; con esto voy a llevar la cuenta de cuantas veces avance en el string
while: mov bx, offset string
  add bx, dx
  mov ch, [bx] ; en ch pongo el char del string a comparar despues
  mov bx, offset read
  int 6
  mov al, [bx] ; con esto seteo el char leido en al para comparar con ch
  cmp al, ch
  jz advance
  dec cl ; bajo los intentos
  jz callRutine
  jmp finishGame
advance: inc dx
  cmp ah, dl
  js jumpToWin
  jmp while
jumpToWin: call printWin
  jmp finishGame
callRutine: call youLost
finishGame: ret

org 3200h
youLost: mov bx, offset lost
  mov al, offset tries - offset lost
  int 7
  call printJump
  ret

org 3220h
printWin: mov bx, offset win
  mov al, offset lost - offset win
  int 7
  call printJump
  ret
  
org 2000h
  call print
  call getString
  call printStart
  call startGame
  int 0
  end
  