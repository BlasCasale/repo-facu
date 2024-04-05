program cap1ejer9;
const
  nums = 5;
var
  op: char;
  i, sum, num: integer;
begin
  write('Ingrese la operación que desea (solo permitido + o -)');
  read(op);
  if((op = '+') or (op = '-')) then
    begin
      sum:=0;
      for i:= 1 to nums do
        begin
          writeln('Ingrese un numero');
          read(num);
          if (op = '+') then
            sum:= sum + num
          else
            sum:= sum - num
        end;
      write('El resultado es: ', sum);
end.
