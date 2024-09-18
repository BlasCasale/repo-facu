; Patrón de Luces Fijo: Escribir un programa que encienda las luces con el patrón 11000011,
;  o sea, solo las primeras y las últimas dos luces deben prenderse, y el resto deben apagarse.

PB EQU 31h
CB EQU 33h

org 3000h
configureCB: mov al, 00h
  out CB, al
ret

org 3010h
turnLights: mov al, 0C3h
  out PB, al
  ret

ORG 2000h
  call configureCB
  call turnLights
int 0
end