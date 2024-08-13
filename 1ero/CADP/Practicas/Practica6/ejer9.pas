program ejer9;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

function itsOrdered (l: list): boolean;
var
  ok: boolean;
  prev, current: list;
begin
  ok:= true;
  current:= list;
  while ((current <> nil) and (ok)) do
    begin
      prev:= current;
      current:= current^.next;
      if (current <> nil) then
        begin
          if (prev^.element > current^.element) then
            ok:= false;
        end;
    end;
  itsOrdered:= ok;
end;
procedure deleteNode (var l: list; value: integer);
var
  prev, current: list;
  ok: boolean;
begin
  current:= l;
  ok:= true;
  while ((current <> nil) and (current^.element <> value)) do
    begin
      prev:= current;
      current:= current^.next;
    end;

  if (current <> nil) then
    begin
      if (current = l) then
        l:= current^.next
      else
        begin
          prev^.next:= current^.next;
          dispose(current);
        end;
    end;
end;
procedure createNewList (l: list; var newL: list; a, b: integer);
var
  newNode, aux: list;
begin
  while (l <> nil) do
    begin
      if ((l^.element > a) and (l^.element < b)) then
        begin
          new(newNode);
          newNode^.element:= l^.element;
          newNode^.next:= nil;
          if (newL = nil) then
            begin
              l:= newL;
              aux:= newL;
            end
          else
            begin
              aux^.next:= newL;
              aux:= newL;
            end;
        end;
      l:= l^.next;
    end;
end;
procedure createNewListTwo (l: list; var newL: list; a, b: integer);
var
  newNode, aux: list;
begin
  while ((l <> nil) and (l^.element < b)) do
    begin
      if ((l^.element > a)) then
        begin
          new(newNode);
          newNode^.element:= l^.element;
          newNode^.next:= nil;
          if (newL = nil) then
            begin
              l:= newL;
              aux:= newL;
            end
          else
            begin
              aux^.next:= newL;
              aux:= newL;
            end;
        end;
      l:= l^.next;
    end;
end;
procedure createNewListThree (l: list; var newL: list; a, b: integer);
var
  newNode, aux: list;
begin
  while ((l <> nil) and (l^.element < a)) do
    begin
      if ((l^.element < b)) then
        begin
          new(newNode);
          newNode^.element:= l^.element;
          newNode^.next:= nil;
          if (newL = nil) then
            begin
              l:= newL;
              aux:= newL;
            end
          else
            begin
              aux^.next:= newL;
              aux:= newL;
            end;
        end;
      l:= l^.next;
    end;
end;
var
  {Variables}

begin
  {Programa principal}
end.
