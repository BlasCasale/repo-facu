program ejer3;

type
  list= ^node;
  node = record
    element: integer;
    next: list;
  end;
procedure addNode (var l: list; value: integer);
var
  newNode, aux: list;
begin
  new(newNode);
  newNode^.element:= value;
  newNode^.next:= nil;
  if (l = nil) then
    l:= newNode
  else
    begin
      aux:= l;
      while (aux <> nil) do
        aux:= aux^.next;
      aux^.next:= newNode;
    end;
end;
procedure addNodeWithReference (var l, last: list; value: integer);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= value;
  newNode^.next:= nil;
  if (l = nil) then
    begin
      l:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;
var
  {Variables}

begin
  {Programa principal}
end.
