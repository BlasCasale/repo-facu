program ejer2;
const
  min = 100;
type
  
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

  max = 200;
  {
    Escribir un programa que:
    a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
    “random” en el rango 100-200. Finalizar con el número 100.
    b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
    mismo orden que están almacenados.
    c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
    la lista en orden inverso al que están almacenados.
    d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
    valor de la lista.
    e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
    verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
  }

procedure addNode (var first, last: list; num: integer);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= num;
  newNode^.next:= nil;

  if (first = nil) then
    begin
      first:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;

procedure createList (var first, last: list);
var
  num: integer;
begin
  num:= min + random((max + 1) - min);
  if (num <> 100) then
    begin
      addNode(first, last, num);
      createList(first, last);
    end;
end;

var
  first, last: list;
begin
  first:= nil;
  last:= nil;
  randomize;
end.
