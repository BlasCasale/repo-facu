program ejerPr2p1;
procedure leerNumeros;
var
  num, maxPar:integer;
begin
  write('Ingrese un numero (ingrese un negativo para cortar el programa): ');
  readln(num);
  maxPar:= 0;
  while (num > 0) do
    begin
      if (num mod 2 = 0) then
        maxPar:= num;
      writeln('Ingrese un numero (ingrese un negativo para cortar el programa): ');
      readln(num);
    end;
  if (maxPar <> 0) then
    writeln('El maximo par es ', maxPar);
end;
begin
  leerNumeros
end.
