program nombrePrograma;

var
a,b:^real;

begin
  new(a);
  b:= a;
  // dispose(a);
  read(b^);
  writeln(b^);
end.
