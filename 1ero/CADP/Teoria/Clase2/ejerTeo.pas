program nombrePrograma;
const
cut = 'ZZZ';
min = 0;
type
  names = string[30];
var
  name, prod: names;
  price, max: real;
begin
  write('Ingrese el nombre de un prod (para terminar ingresar "ZZZ"): ');
  readln(name);
  max:= min;
  while (name <> cut) do
    begin
      write('Ingrese el precio del producto');
      readln(price);
      while (price <= min) do
        begin
          write('Ingrese un precio valido: ');
          readln(price);
        end;
      if (price > max) then
        begin
          max:= price;
          prod:= name;
        end;
      write('Ingrese el nombre de otro producto: ');
      readln(name);
    end;
  write(prod)
end.
