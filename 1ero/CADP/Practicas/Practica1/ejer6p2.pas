program cap1ejer6p2;
const
  prods= 200;
  min= 1;
  max= 200;
  condPrice= 16;
var
  i, price, minOne, minTwo, infoOne, infoTwo, quan: integer;
begin
  quan:= 0;
  minOne:= 1000;
  minTwo:= 1000;
  for i := 1 to prods do
    begin
      write('Ingrese el precio del producto con codigo ', i ':');
      read(price);
      if (minOne = minTwo) then
        begin
          minOne:= price;
          infoOne:= i;
        end;
      else if (minOne < minTwo) then
        begin
          minOne:= price;
          infoOne:= i;
        end;
      else
        begin
          minTwo:= price;
          infoTwo:= i;
        end;
      if ((price < condPrice) and ((i mod 2) = 0)) then
        quan:= quan + 1;
    end;
  write('Los productos mas baratos son ', infoOne , ' y el segundo mas barato es ', infoTwo);
end.
