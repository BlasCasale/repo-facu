program cap1ejer1p2;
const
  nums = 10;
var
  i, num, sum: integer;
begin
  sum:= 0;
  for i := 1 to nums do
    begin
      read(num);
      sum:= sum + num;
    end;
  write('La suma total es: ', sum);
end.
