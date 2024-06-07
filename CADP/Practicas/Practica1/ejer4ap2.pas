program cap1ejer4ap2;
const
  cut = 0;
var
  num, numOne, numTwo: integer;
begin
  numOne:= 1000;
  numTwo:= 1000;
  write('Ingrese un numero: ');
  read(num);
  repeat
  write('Ingrese otro numero: ');
  read(num);
    if(numOne = numTwo) then
      numOne:= num
    else 
      begin
        if (numOne > numTwo) then
          numOne:= num
        else
          numTwo:= num
      end;
  until num = cut;
  write('El primer numero minimo es ', numOne, ' y el segundo numero minimo es ', numTwo);
end.
