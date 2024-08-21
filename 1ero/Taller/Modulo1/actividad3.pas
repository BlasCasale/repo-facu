program actividad3;
const
  cut = 120;
type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

procedure addNode (var first, last: list; value: integer);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= value;
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

procedure chargeList (var first, last: list);
var
  value: integer;
begin
  value:= random(51) + 100;
  while (value <> cut) do
    begin
        addNode(first, last, value);
        value:= random(51) + 100;
    end;
end;
procedure printList (l: list);
begin
  while (l <> nil) do
    begin
      writeln('N: ', l^.element);
      l:= l^.next;
    end;
end;
function findValue (l: list; value: integer): boolean;
begin
  while ((l <> nil) and (l^.element <> value)) do
    l:= l^.next;
  findValue:= (l <> nil) and (l^.element = value);
end;
var
  first, last: list;
  value: integer;
begin
  randomize;
  first:= nil;
  last:= nil;

  chargeList(first, last);
  printList(first);

  writeln('Ingrese un valor a buscar: ');
  readln(value);

  writeln(findValue(first, value));
end.
