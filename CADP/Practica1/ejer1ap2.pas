program cap1ejer1ap2;
const 
  nums = 10;
  ans = 5;
var
  i, num, sum, total: integer;
begin
  sum:= 0;
  total:= 0;
  for i:= 1 to nums do
    begin
      write('Ingrese un numero: ');
      read(num);
      if (num > ans) then
        total:= total + 1;
    end;
  writeln('La suma total es: ', sum);
  writeln('La cantidad de numeros mayores a 5 es: ', total);
end.