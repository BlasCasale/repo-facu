program cap1ejer8p2;
const
  days = 1;
  cut= 0;
var
  i, sells: integer;
  price, total: real;
begin
  total:= 0;
  for i:= 1 to days do
    begin
      sells:= 0;
      write('Ingrese el precio de la venta: ');
      readln(price);
      while (price <> cut) do
        begin
          while (price < 0) do
            begin
              write('Ingrese un precio valido: ');
              readln(price);
            end;
          total:= total + price;
          sells:= sells + 1;
          write('Ingrese otro precio de una venta: ');
          read(price);
        end;
      writeln('La cantidad de ventas en el dia fueron ', sells);
    end;
  write('El monto total acumulado en ventas es de $', total:0:2);
end.
