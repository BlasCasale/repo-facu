program ejer8Pr2;
const
  cut = 123456;
function getOdd (number: integer): integer;
var
  odd, aux: integer;
begin
  odd:= 0;
  while (number > 0) do
    begin
      aux:= number mod 10;
      if (aux mod 2 <> 0) then
        odd:= odd + 1;
      number:= number div 10;
    end;
  getOdd:= odd;
end;
function getSumEven (number: integer): integer;
var
  sum, aux: integer;
begin
  sum:= 0;
  while (number <> 0) do
    begin
      aux:= number mod 10;
      if (aux mod 2 = 0) then
        sum:= sum + aux;
      number:= number div 10;
    end;
  getSumEven:= sum;
end;
var
  num, sum, odd: integer;
begin
  write('Ingrese el numero (para cortar el programa ingrese 123456)');
  readln(num);
  while (num <> cut) do
    begin
      odd:= getOdd(num);
      sum:= getSumEven(num);
      write('La suma de los digitos pares es ', sum);
      writeln('La cantidad de digitos impares es ', odd);
      write('Ingrese un numero');
      readln(num);
    end;
end.
