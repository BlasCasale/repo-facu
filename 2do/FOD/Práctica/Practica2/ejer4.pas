program ejer4;
const
  highestValue = 9999;
type

  product = record
    id: integer;
    name: string[20];
    desc: string[30];
    stock: integer;
    minStock: integer;
    price: real;
  end;

  sell = record
    id: integer;
    quantity: integer;
  end;

  master = file of product;

  detail = file of sell;

procedure readMaster (var a: master; var p: product);
begin
  if (not eof(a)) then
    read(a, p)
  else
    p.id:= highestValue;
end;

procedure readDetail (var a: detail; var s: sell);
begin
  if (not eof(a)) then
    read(a, s)
  else
    s.id:= highestValue;
end;

procedure getMin (var d1, d2, d3: detail; var s1, s2, s3: sell; var min: sell);
begin
  if (s1.id <= s2.id) and (s1.id <= s3.id) then
    begin
      min:= s1;
      readDetail(d1, s1);
    end
  else
    begin
      if (s2.id <= s3.id) then
        begin
          min:= s2;
          readDetail(d2, s2);
        end
      else
        begin
          min:= s3;
          readDetail(d3, s3);
        end;
    end;
end;

{
  Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados. 
  De cada producto se almacena: código del producto, nombre, descripción, stock disponible, 
  stock mínimo y precio del producto. 
  Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se 
  debe  realizar  el  procedimiento  que  recibe  los  30  detalles y actualiza el stock del archivo 
  maestro.  La  información  que  se  recibe  en los detalles es: código de producto y cantidad 
  vendida.  Además,  se  deberá  informar  en  un  archivo  de  texto:  nombre  de  producto, 
  descripción, stock disponible y precio de aquellos productos que tengan stock disponible por 
  debajo  del  stock  mínimo.  Pensar  alternativas  sobre  realizar  el  informe  en  el  mismo 
  procedimiento  de  actualización,  o  realizarlo  en  un  procedimiento  separado  (analizar 
  ventajas/desventajas en cada caso). 
  
  Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle 
  puede venir 0 o N registros de un determinado producto.
}

procedure actMasterAndCreateResume (var m: master; var d1, d2, d3: detail);
var
  t: text;
  s1, s2, s3, min: sell;
  p: product;
  count: integer;
begin
  reset(m);
  reset(d1);
  reset(d2);
  reset(d3);

  assign(t, 'menosStock.txt');
  rewrite(t);

  readDetail(d1, s1);
  readDetail(d2, s2);
  readDetail(d3, s3);

  getMin(d1, d2, d3, s1, s2, s3, min);

  while (min.id <> highestValue) do
    begin
      count:= 0;
      readMaster(m, p);
      while (p.id <> min.id) do
        readMaster(m, p);
      while (min.id = p.id) do
        begin
          count:= min.quantity + count;
          getMin(d1, d2, d3, s1, s2, s3, min);
        end;

      p.stock:= p.stock - count;

      if (p.stock < p.minStock) then
        begin
          writeln(t, p.id, p.price, p.desc);
          writeln(t, p.name);
        end;

      seek(m, filepos(m) - 1);
      write(m, p);
    end;

  close(m);
  close(d1);
  close(d2);
  close(d3);
  close(t);
end;

var
  m: master;
  d1, d2, d3: detail;
begin
  assign(m, 'maestroCongelados.txt');
  assign(d1, 'd1Congelados.txt');
  assign(d2, 'd2Congelados.txt');
  assign(d3, 'd3Congelados.txt');

  actMasterAndCreateResume(m, d1, d2, d3);
end.
