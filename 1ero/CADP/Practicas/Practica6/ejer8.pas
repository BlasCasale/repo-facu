program ejer8;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;
procedure addNode (var l: list; value: integer);
var
  newNode, current, prev: list;
begin
  new(newNode);
  newNode^.element:= value;
  newNode^.next:= nil;
  if (l = nil) then
    l:= newNode
  else
    begin
      prev:= l;
      current:= l;
      while ((current <> nil) and (current^.element < newNode^.element)) do
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
var
  {Variables}

begin
  {Programa principal}
end.
