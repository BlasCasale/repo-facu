program nombrePrograma;
const
  cut = 'ZZZ';
  min = 0;
type
  names = string[30];
var
  name: names;
  maxOne, maxTwo, price: real;
begin
  maxOne:= min;
  maxTwo:= min;
  write('Ingrese el nombre del producto: ');
  readln(name);
  while (name <> cut) do
    begin
      write('Ingrese el precio del producto: ');
      readln(price);
      while (price < min) do
        begin
          write('Ingrese un precio valido: ');
          readln(price);
        end;
      if (price > maxTwo) then
        begin
          if (price > maxOne) then
            begin
              maxTwo:= maxOne;
              maxOne:= price;
            end
          else
            maxTwo:= price;
        end;
      write('Ingrese el nombre del producto: ');
      readln(name);
    end;
  write('El precio maximo es ', maxOne:0:2, ' el segundo maximo es ', maxTwo:0:2);
end.
