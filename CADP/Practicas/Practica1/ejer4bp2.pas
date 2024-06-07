program cap1ejer4bp2;
const
  cut = 0;
  maxValue = 1000;
var
  num, numOne, numTwo: integer;
begin
  numOne:= maxValue;
  numTwo:= maxValue;
  write('Ingrese un numero: ');
  read(num);
  while(num <> cut) do
    begin
      if (numOne = numTwo) then
        numOne:= num;
      else
        begin
          if (numOne > numTwo) then
            numOne:= num;
          else
            numTwo:= num;
        end;
    write('Ingrese otro numero: ');
    read(num);
    end;
  write('El primer numero menor es ', numOne , ' el segundo numero menor es ', numTwo);
end.
