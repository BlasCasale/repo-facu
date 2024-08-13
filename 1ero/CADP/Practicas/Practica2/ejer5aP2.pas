program ejer5aP2;
  {
    realizar un programa que lea pares de numeros hasta que lea el par de numeros 0,0
    informar la cantidad de numeros leidos
    informar la cantidad de veces en que b es el doble que a
  }
function double (a: integer; b: integer): boolean;
  begin
    double:= (b = (a * 2));
  end;
function cut (a:integer; b:integer): boolean;
  begin
    cut:= ((a = 0) and (b = 0));
  end;
var
  a, b, counterTotal, counterDouble: integer;
begin
  write('Ingrese un numero: ');
  readln(a);
  write('Ingrese otro numero: ');
  readln(b);
  counterTotal:= 0;
  counterDouble:= 0;
  while(not(cut(a,b))) do
    begin
      counterTotal:= counterTotal + 1;
      if (double(a,b)) then
        counterDouble:= counterDouble +1;
      write('Ingrese un numero: ');
      readln(a);
      write('Ingrese otro numero: ');
      readln(b);
    end;
  writeln('La cantidad de veces que el segundo numero es el doble del primero son ', counterDouble);
  writeln('La cantidad de pares de numeros leidos son ', counterTotal);
  write(cut(a,b));
end.
