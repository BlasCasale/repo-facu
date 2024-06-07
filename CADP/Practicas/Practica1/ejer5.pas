program ejer5cap1;
var
  x,y: real;
  i: integer;
begin
  writeln('Ingrese un numero: ');
  read(x);
  writeln('Ingresaste: ', x);
  writeln('Ingrese otro numero.');
  read(y);
  while ((y <> x*2) and (i < 11)) do
    begin
      writeln('Ingresa otro numero');
      read(y);
      i:= i + 1
    end;
end.
