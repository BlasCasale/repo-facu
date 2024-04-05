program nombrePrograma;
const
  cut= 32767;
var
  id: integer;
  price, newPrice, perc, condPer: real;
begin
  condPer:= 10;
  repeat
    writeln('Ingrese el codigo del producto: ');
    read(id);
    writeln('Ingrese el viejo precio: ');
    read(price);
    writeln('Ingrese el nuevo precio: ');
    read(newPrice);
    perc:= 100 - ((price / newPrice) * 100);
    if (perc > condPer) then
      writeln('El nuevo precio supera el 10%')
    else
      writeln('El nuevo precio no supera el 10%')
  until id = cut
end.
