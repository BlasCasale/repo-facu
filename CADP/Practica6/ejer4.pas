program ejer4;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;
function getMaxValue (l: list): integer;
var
  max: integer;
begin
  max:= -1;
  while (l <> nil) do
    begin
      if (l^.element >= max) then
        max:= l^.element;
      l:= l^.next;
    end;
  getMaxValue:= max;
end;
function getMinValue (l: list): integer;
var
  min: integer;
begin
  min:= 99999;
  while (l <> nil) then
    begin
      if (l^.element <= min) then
        min:= l^.element;
      l:= l^.next;
    end;
  getMinValue:= min;
end;
function findMultiple (l: list; value: integer): integer;
var
  counter: integer;
begin
  counter:= 0;
  while (l <> nil) do
    begin
      if ((l^.element mod value) = 0) then
        counter:= counter + 1;
      l:= l^.next;
    end;
  function:= counter;
end;
begin
  {Programa principal}
end.
