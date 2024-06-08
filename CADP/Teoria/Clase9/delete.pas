program delete;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

procedure deleteNode (var l: list; value: integer);
var
  prev, current: list;
begin
  current:= l;
  while ((current <> nil) and (current^.element <> value)) do
    begin
      prev:= current;
      current:= current^.next;
    end;

  if (current <> nil) then
    begin
      if (current = l) then
        l:= l^.next;
      else
        prev^.next:= current^.next;
      dispose(current);
    end;
end;
procedure deleteVariousNodes (var l: list; value: integer);
var
  prev, current: list;
begin
  current:= l;
  while (current <> nil) do
    begin
      if (current^.element <> value) then
        begin
          prev:= current;
          current:= current^.next;
        end
      else
        begin
          if (current = l) then
            l:= l^.next
          else
            prev^.next:= current^.next;
          dispose(current);
          current:= current^.next;
        end;
    end;
end;
begin
  {Programa principal}
end.
