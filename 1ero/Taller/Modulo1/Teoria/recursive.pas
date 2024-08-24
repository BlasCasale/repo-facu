program recursive;

type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

procedure printList (l: list);
begin
  // while (l <> nil) do
  //   begin
  //     writeln(l^.element);
  //     l:= l^.next;
  //   end;

  while (l <> nil) do
    begin
      writeln(l^.element);
      l:= l^.next;
      printList(l);
    end;
end;

function pow (x, n: integer): integer;
begin
  if (n = 0) then
    pow:= 1
  else if (n = 1) then
    pow:= x
  else
    pow:= x * pow(x, n-1);
end;

// esta mal y no puedo solucionarlo
procedure factorial (n, fac: integer);
begin
  if (n > 1) then
    begin
      fac:= n * (n - 1);
      factorial(n - 1, fac);
    end;
  writeln(fac);
end;
var
  n, fac: integer;
begin
  n:= 5;
  fac:= 0;
  factorial(n, fac);
  writeln(pow(3,3));
end.
