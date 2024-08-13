program ejer1cap1;
var
  num1, num2: integer;
begin
  write('Ingrese el numero a ');
  read(num1);
  write('Ingrese el numero b ');
  read(num2);
  if (num1 = num2) then
    write('Ambos numeros son iguales')
  else
    if (num1 > num2) then
      write('El primer numero es mayor: ', num1)
    else
      write('El segundo numero es mayor: ', num2)
end.