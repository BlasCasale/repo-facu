program ejer3cap1;
var
  num1, num2, num3, i: integer;
begin
  for i:= 1 to 3 do
  begin
    case i of
      1: 
        begin
          writeln('Ingrese un numero');
          read(num1)
        end;
      2:
        begin
          writeln('Ingrese otro numero');
          read(num2)
        end;
      3:
        begin
          writeln('Ingrese otro numero');
          read(num3)
        end
  end;
  if ((num1 > num2) and (num1 > num3)) then
    begin
      if (num2 > num3) then
        write(num1, num2, num3)
      else
        write(num1, num3, num2);
    end;
  if ((num2 > num1) and (num2 > num3)) then
    begin
      if (num1 > num3) then
        write(num2, num1, num3)
      else
        write(num2, num3, num1);
    end
  else if (num1 > num2) then
    write(num3, num1, num2)
  else
    write(num3, num2, num1);
end.