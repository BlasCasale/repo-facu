program search;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;
  
function search (l:list; value: integer): boolean;
var
  aux: list;
  find: boolean;
begin
  find:= false;
  aux:= l;
  while ((aux <> nil) and (not find)) do
    begin
      if (aux^.element = value) then
        find:= true
      else
        aux:= aux^.next;
    end;
  search:= find;
end;
function inprovedSearch (l: list; value:integer): boolean;
var
  find: boolean;
begin
  find:= false;
  
  while ((l <> nil) and (l^.element < value)) do
    l:= l^.next;

  if ((l <> nil) and (l^.element = value)) then
    find:= true
  
  inprovedSearch:= find;
end;
begin
  {Programa principal}
end.
