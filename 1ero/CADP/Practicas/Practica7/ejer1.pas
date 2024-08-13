program ejer1;
const
  cut = 335;
type

  str50 = string[50];

  actorCode = 1..5;

  codeMax = record
    code: integer;
    counter: integer;
  end;

  peopleObj = record
    dni: integer;
    fullName: str50;
    age: integer;
    code: actorCode;
  end;

  list = ^node;

  node = record
    element: peopleObj;
    next: list;
  end;

  vecCounter = array [actorCode] of integer;

// lista ordenada ascendente
procedure addNode (var l: list; people: peopleObj);
var
  newNode, prev, current: list;
begin
  new(newNode);
  newNode^.element:= people;
  newNode^.next:= nil;
  current:= l;

  if (l =  nil) then
    l:= newNode
  else
    begin
      while ((current <> nil) and (current^.element.dni < newNode^.element.dni)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
        if (current = l) then
          begin
            newNode^.next:= current;
            l:= newNode;
          end
        else
          begin
            prev^.next:= newNode;
            newNode^.next:= current;
          end;
    end;
end;
function decomposeDni (dni: integer): boolean;
var
  aux, even, odd: integer;
begin
  even:= 0;
  odd:= 0;

  while (dni <> 0) do
    begin
      aux:= dni mod 10;
      if (aux mod 2 = 0) then
        even:= even + 1
      else
        odd:= odd + 1;
      dni:= dni div 10;
    end;

  decomposeDni:= even > odd;
end;
procedure initializeVec (var v: vecCounter);
var
  i: integer;
begin
  for i:= 1 to 5 do
    v[i]:= 0;
end;
procedure actualizeVec (var v: vecCounter; code: integer);
begin
  v[code]:= v[code] + 1;
end;
procedure takeInfo (var people: peopleObj);
begin
  write('Ingrese el dni del actor: ');
  readln(people.dni);
  write('Ingrese el nombre y apellido del actor: ');
  readln(people.fullName);
  write('Ingrese la edad del actor: ');
  readln(people.age);
  write('Ingrese el codigo del actor: ');
  readln(people.code);
end;
procedure deleteNode (var l: list; dni: integer; var ok: boolean);
var
  prev, current: list;
begin
  ok:= false;
  current:= l;

  while ((current <> nil) and (current^.element.dni <> dni) and (current^.element.dni < dni)) do
    begin
      prev:= current;
      current:= current^.next;
    end;

  if (current <> nil) then
    begin
      // aca ya se que existe
      if (current = l) then
        l:= l^.next
      else
        prev^.next:= current^.next;
      ok:= true;
      dispose(current);
    end;
end;
  {
    persona: dni, fullName, age, code (1: drama, 2: romantico, 3: accion, 4: suspenso, 5: terror)
    corte dni= 33555444 (repeat until)
    informar:
    1) informar cant de dni con mas pares que impares
    2) informar los dos codigos de generos mas elegidos
    3) realizar un modulo que reciba un dni, lo busque y elimine (puede no existir), invocar en pp
  }
var
  people: peopleObj;
  counterCode: vecCounter;
  counterDni, i: integer;
  l, aux: list;
  maxOne, maxTwo: codeMax;
  ok: boolean;
begin
  l:= nil;

  initializeVec(counterCode);
  counterDni:= 0;

  repeat
    takeInfo(people);
    if (decomposeDni(people.dni)) then
      counterDni:= counterDni + 1;
    actualizeVec(counterCode, people.code);
    addNode(l, people);
  until people.dni = cut;

  maxOne.counter:= -1;
  maxTwo.counter:= -1;

  for i:= 1 to 5 do
    begin
      if (counterCode[i] >= maxOne.counter) then
        begin
          maxTwo.counter:= maxOne.counter;
          maxTwo.code:= maxOne.code;
          maxOne.counter:= counterCode[i];
          maxOne.code:= i;
        end
      else if (counterCode[i] >= maxTwo.counter) then
        begin
          maxTwo.counter:= counterCode[i];
          maxTwo.code:= i;
        end;
    end;

  writeln('Max 1: ', maxOne.code);
  writeln('Max 2: ', maxTwo.code);

  aux:= l;

  while (aux <> nil) do
    begin
      writeln('Dni: ', aux^.element.dni);
      aux:= aux^.next;
    end;

  deleteNode(l, 211, ok);

  if (ok) then
    write('Se borro')
  else
    write('No se borro');
end.
