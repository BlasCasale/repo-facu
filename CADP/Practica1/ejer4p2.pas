program cap1ejer4p2;
const
  iterations = 1000;
  maxValue = 1000;
var
  i, numOne, numTwo, num: integer;
begin
  numOne:= maxValue;
  numTwo:= maxValue;
  for i:= 1 to iterations do
    begin
      write('Ingrese un numero: ');
      read(num);
      if (numOne = numTwo) then
        numOne:= num;
      else if (numOne > numTwo) then
        numOne:= num;
      else
        numTwo:= num;
    end;
  write('El primer numero mas chico es ', numOne , 'el segundo numero mas chico es ', numTwo);
end.
