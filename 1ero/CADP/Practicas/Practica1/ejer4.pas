program ejer4cap1;
var
  x,y: real;
begin
  writeln('Ingrese un numero: ');
  read(x);
  writeln('Ingresaste: ', x);
  writeln('Ingrese otro numero.');
  read(y);
  while (y <> x*2) do
    begin
      writeln('Ingresa otro numero');
      read(y);
    end;
end.
