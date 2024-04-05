program cap1ejer2p;
const
  nums = 10;
var
  i, max, num: integer;
begin
  max: -1000;
  for i:= 1 to nums do
    begin
      write('Ingrese un numero: ');
      read(num);
      if (num > max) then
        max:= num;
    end;
  write('El numero maximo es: ', max);
end.
