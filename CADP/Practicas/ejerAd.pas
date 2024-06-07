program nombrePrograma;
  {
    realizar un orograma que lea 10 numeros enteros e informe la cantidad de digitos que contiene cada numero y la cantidad total de digitos multiplos de 3 entre todos los numeros

  }
function cumple(x,y: integer): boolean;
begin
  cumple:= ((x mod 10) mod y) = 0;
end;
procedure descomponer (num, m: integer; var total, mul: integer);
begin
  total:= 0;
  while (num <> 0) do
    begin
      total:= total +1;
      if(cumple(num,m)) then
        mul:= mul + 1;
      num:= num div 10;
    end;
end;
var
  i, total, partial, divisor, num, totalMul: integer;
begin
  divisor:= 3;
  totalMul:= 0;
  for i := 1 to 10 do
    begin
      write('Ingrese un numero');
      readln(num);
      descomponer(num, divisor, total, totalMul);
      write('La cantidad de digitos en este numero son ', total);
    end;
  writeln('La cantidad de digitos multiplos de 3 son ', totalMul);
end.
