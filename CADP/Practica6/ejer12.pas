program ejer12;
const
  specificRam = 3;
  lessThanInch = 5;
  iterations = 9;
type

  mobileObj = record
    version: integer;
    ram: real;
    inch: real;
  end;

  list = ^node;

  node = record
    element: mobileObj;
    next: list;
  end;

  listQuantity = ^nodeQuantity;

  quantityObj = record
    version: integer;
    counter: integer;
  end;

  nodeQuantity = record
    element: quantityObj;
    next: listQuantity;
  end;
procedure addNode (var l: list; mobile: mobileObj);
var
  newNode, current, prev: list;
begin
  new(newNode);
  newNode^.element:= mobile;
  newNode^.next:= nil;
  if (l = nil) then
    l:= newNode
  else
    begin
      current:= l;
      while ((current <> nil) and (current^.element.version < newNode^.element.version)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
    end;

  if (current = l) then
    begin
      newNode^.next:= l;
      l:= newNode;
    end
  else
    begin
      prev^.next:= newNode;
      newNode^.next:= current;
    end;
end;
procedure addNodeQuantity (var l: listQuantity; mobile: mobileObj);
var
  newNode, prev, current: listQuantity;
begin
  new(newNode);
  newNode^.element.version:= mobile.version;
  newNode^.element.counter:= 1;
  newNode^.next:= nil;
  if (l = nil) then
    l:= newNode
  else
    begin
      current:= l;
      prev:= current;
      while ((current <> nil) and (current^.element.version < mobile.version)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
    end;

  if (current = l) then
    begin
      newNode^.next:= l;
      l:= newNode;
    end
  else if (current^.element.version = mobile.version) then
    current^.element.counter:= current^.element.counter + 1
  else
    begin
      prev^.next:= newNode;
      newNode^.next:= current;
    end;
end;
procedure takeInfo (var mobile: mobileObj);
begin
  writeln('Ingrese la version de Android: ');
  readln(mobile.version);
  writeln('Ingrese la RAM del dispositivo: ');
  readln(mobile.ram);
  writeln('Ingrese las pulgadas del dispositivo: ');
  readln(mobile.inch);
end;
function countSpecifications (counter: integer; mobile: mobileObj): integer;
begin
  if ((mobile.ram >= specificRam) and (mobile.inch <= lessThanInch)) then
    counter:= counter + 1;
  countSpecifications:= counter;
end;
  {
    dispositivos: version, inch y ram
    ordenado por version de android
    informar:
    a) cantidad de dispositivos por cada version
    b) dispositivos con mas de 3 gb de ram y a lo sumo 5 inch
    c) promedio de las pantallas
  }
var
  mobile: mobileObj;
  l: list;
  q, aux: listQuantity;
  counter, totalCounter, i: integer;
  average: real;
begin
  counter:= 0;
  totalCounter:= 0;
  average:= 0;
  l:= nil;
  q:= nil;
  for i:= 0 to iterations do
    begin
      takeInfo(mobile);
      addNode(l, mobile);
      addNodeQuantity(q, mobile);
      counter:= countSpecifications(counter, mobile);
      totalCounter:= totalCounter + 1;
      average:= average + mobile.inch;
    end;

  average:= average / totalCounter;

  writeln(average:0:2);
  writeln(counter);
  aux:= q;
  while (aux <> nil) do
    begin
      writeln(aux^.element.version, ' -v tiene ', aux^.element.counter, ' dispositivos');
      aux:= aux^.next;
    end;
end.
