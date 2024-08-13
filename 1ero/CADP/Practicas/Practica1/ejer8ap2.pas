program cap1ejer8ap2;
const
  days = 2;
  min = 0;
  cut = 0;
var
  i, sells, maxSells: integer;
  price, totalAmount: real;
begin
  maxSells:= 0;
  sells:= 0;
  totalAmount:= 0;
  for i:= 1 to days do
    begin
      write('Ingrese el monto de la venta (0 para terminar de ingresar este dia): ');
      readln(price);
      while (price <> cut) do
        begin
          while (price < min) do
            begin
              write('Ingrese un precio valido: ');
              readln(price);
            end;
          totalAmount:= totalAmount + price;
          sells:= sells + 1;
          write('Ingrese otra venta: ');
          readln(price);
        end;
      if (sells > maxSells) then
        maxSells:= i;
      writeln('El total de ventas en el dia ', i, ' fueron ', sells, ' ventas');
      sells:= 0;
    end;
  writeln('El total en ventas es ', totalAmount:0:2);
  writeln('El dia que mas se vendio fue el dia ', maxSells);
end.
