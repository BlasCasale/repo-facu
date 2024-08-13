program ejer2cap1;
var
  num:real;
begin
  writeln('Ingrese un número ');
  read(num);
  if (num >= 0) then
    write('El valor absoluto es: ', num)
  else 
    begin
    num:= num*-1;
    write('El valor absoluto es: ', num)
    end
end.