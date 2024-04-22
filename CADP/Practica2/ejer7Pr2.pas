program ejer7Pr2;
const
  cut = 10;
procedure getDigits (number: integer; var sum: integer; var total: integer);
var
  aux: integer;
begin
  total:= 0;
  while (number <> 0) do
    begin
      aux:= number mod 10;
      sum:= sum + aux;
      number:= number div 10;
      total:= total + 1;
    end;
end;
function cutControl (sum: integer) : boolean;
begin
  cutControl:= sum = cut;
end;
var
  num, total, sum: integer;
begin
  sum:= 0;
  repeat
    writeln('Ingrese un numero');
    read(num);
    getDigits(num, sum, total);
    write('Se ingresaron ', total, ' digitos');
  until cutControl(sum);
end.
