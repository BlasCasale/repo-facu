program cap1ejer9;
const
  cut = 0;
var
  op: char;
  i, sum, num: integer;
begin
  write('Ingrese la operación que desea (solo permitido + o -)');
  read(op);
  if((op = '+') or (op = '-')) then
    begin
      write('Ingrese un numero: ');
      read(num);
      sum:=num;
      if (op = '+') then
        begin
          while (num <> cut) do
            begin
            write('Ingrese un numero ');
            read(num);
            sum:= sum + num;
            end;
        end
      else
        begin
          while (num <> cut) do
            begin
            write('Ingrese un numero ');
            read(num);
            sum:= sum - num;
            end;
        end;
      write('El resultado es: ', sum);
    end;
end.
