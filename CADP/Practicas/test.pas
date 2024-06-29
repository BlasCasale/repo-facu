program delete;

type
  
procedure deleteNode (var l: list; x: integer);
var
  prev, current: list;
begin
  current:= l;
  while ((current <> nil) and (current^.element <> x)) do
    begin
      prev:= current;
      current:= current^.next;
    end;
  if (current^.element = x) then
    begin
      prev^.next:= current^.next;
      dispose(current);
    end;
end;

var
  {Variables}

begin
  {Programa principal}
end.
