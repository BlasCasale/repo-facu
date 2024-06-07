program cap1ejer5p2;
const
  cut = 100;
var
  num, sum, min, max: integer;
begin
  min:= 1000;
  max:= 0;
  sum:= 0;
  write('Ingrese un numero: ');
  read(num);
  while (num <> cut) do
    begin
    sum:= sum + num;
      if(num < min) then
        min:= num;
      if(num > max) then
        max:= num;
      write('Ingrese otro numero: ');
      read(num);
    end;
  write('El numero maximo es ', max, ' el numero minimo es ', min , ' y la suma total es ', sum);
end.
