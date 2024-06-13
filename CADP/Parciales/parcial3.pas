program parcial3;
type

  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

procedure addAtBeginning (var ll: list; num: integer);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= num;
  newNode^.next:= ll;
  ll:= newNode;
end;
var
  l: list;
  num, i: integer;
begin
  l:= nil;

  for i:= 0 to 5 do
    begin
      read(num);
      addAtBeginning(l, num);
    end;
  
  while (l <> nil) do
    begin
      write(l^.element);
      l:= l^.next;
    end;
end.
