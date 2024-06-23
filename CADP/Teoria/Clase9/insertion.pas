program insertion;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

  {
    cuando se inserta, se va a insertar dentro de una lista que este ordenada pero quiero que persista ese orden
  }
procedure insertNode (var l: list; value: integer);
var
  prev, current, newNode: list;
begin
  new(newNode);
  newNode^.element:= value;
  current:= l;

  if (l = nil) then
    l:= newNode
  else
    begin
      prev:= current;
      while ((current <> nil) and (current^.element < newNode^.element)) do
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
  // if (current = l) then {otra version}
  //   begin
  //     newNode^.next:= l;
  //     l:= newNode;
  //   end
  // else if (current <> nil) then
  //   begin
  //     prev^.next:= newNode;
  //     newNode^.next:= current;
  //   end
  // else
  //   prev^.next:= newNode;
  
end;
begin
  {Programa principal}
end.
