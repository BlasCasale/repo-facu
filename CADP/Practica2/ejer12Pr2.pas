program ejer12Pr2;
function getCurrency (ha: integer; zone: integer; price: real): real;
begin
  if (zone = 1) then
    getCurrency:= (ha * 6) * price
  else if (zone = 2) then
    getCurrency:= (ha * 2.6) * price
  else if (zone = 3) then
    getCurrency:= (ha * 1.4) * price;
end;
var
  ha, zone: integer;
  price, total: real;
begin
  readln(ha);
  readln(zone);
  readln(price);
  total:= getCurrency(ha, zone, price);
  write(total:0:2);
end.
