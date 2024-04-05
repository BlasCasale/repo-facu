program cap1ejer2a;
const
  nums = 10;
var
  i, j, num, max: integer;
begin
  max:= -1000;
  for i:= 1 to nums do
    begin
      write('Ingrese un numero: ');
      read(num);
      if (num > max) then
        begin
          max:= num;
          j:= i;
    end;
  write('El numero maximo es: ', max);
  write('El indice del numero maximos es: ', j);
end.
