program ejer2;
const
  highValue = 9999;
type

  product = record
    id: integer;
    name: string[20];
    price: real;
    stock: integer;
    minStock: integer;
  end;

  sell = record
    id: integer;
    quantity: integer;
  end;
{
  El encargado de ventas de un negocio de productos de limpieza desea administrar el stock 
  de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los 
  productos que comercializa. De cada producto se maneja la siguiente información: código de 
  producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se 
  genera un archivo detalle donde se registran todas las ventas de productos realizadas. De 
  cada  venta  se  registran:  código  de  producto  y  cantidad  de  unidades  vendidas.  Se  pide 
  realizar un programa con opciones para: 
  a.  Actualizar el archivo maestro con el archivo detalle, sabiendo que: 
  ●  Ambos archivos están ordenados por código de producto. 
  ●  Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del 
  archivo detalle. 
  ●  El archivo detalle sólo contiene registros que están en el archivo maestro. 
  b.  Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo 
  stock actual esté por debajo del stock mínimo permitido.
}
  master = file of product;

  detail = file of sell;

procedure setProd (var p: product);
begin
  with p do
    begin
      writeln('ID: ');
      readln(id);
      if (id <> highValue) then
        begin
          writeln('Nombre: ');
          readln(name);
          writeln('Precio: ');
          readln(price);
          writeln('Stock: ');
          readln(stock);
          writeln('Stock minimo: ');
          readln(minStock);
        end;
    end;
end;

procedure setSell (var s: sell);
begin
  writeln('ID: ');
  readln(s.id);
  if (s.id <> highValue) then
    begin
      writeln('Cantidad: ');
      readln(s.quantity);
    end;
end;

procedure readDetail (var det: detail; var s: sell);
begin
  if (not eof(det)) then
    read(det, s)
  else
    s.id:= highValue;
end;

procedure readMaster (var m: master; var p: product);
begin
  if (not eof(m)) then
    read(m, p)
  else
    p.id:= highValue;
end;

procedure addProduct (var a: master);
var
  p: product;
begin
  reset(a);
  seek(a, filesize(a));
  setProd(p);
  while (p.id <> highValue) do
    begin
      write(a, p);
      setProd(p);
    end;
  close(a);
end;

procedure addSell (var d: detail);
var
  s: sell;
begin
  reset(d);
  seek(d, filesize(d));
  setSell(s);
  while (s.id <> highValue) do
    begin
      write(d, s);
      setSell(s);
    end;

  close(d);
end;

procedure actMaster (var m: master; var det: detail);
var
  p: product;
  s: sell;
  aux, count: integer;
begin
  reset(m);
  reset(det);

  readDetail(det, s);

  while (s.id <> highValue) do
    begin
      aux:= s.id;
      count:= 0;
      readMaster(m, p);

      while (s.id <> p.id) do
        readMaster(m, p);

      while (s.id = aux) do
        begin
          count:= count + s.quantity;
          readDetail(det, s);
        end;

      seek(m, filepos(m) - 1);
      p.stock:= p.stock - count;
      write(m, p);

      if (not eof(m)) then
        read(m, p);
    end;

  close(m);
  close(det);
end;

procedure createMinStock (var a, ws: master);
var
  p: product;
begin
  reset(a);
  rewrite(ws);
  readMaster(a, p);
  while (p.id <> highValue) do
    begin
      if (p.stock < p.minStock) then
        write(ws, p);
      readMaster(a, p);
    end;
  close(ws);
  close(a);
end;

procedure printMaster (var a: master);
var
  p: product;
begin
  reset(a);
  readMaster(a, p);
  while (p.id <> highValue) then
    begin
      writeln('ID ', p.id, ' precio ', p.price:0:2, ' nombre ', p.name, ' stock ', p.stock, ' minStock ', p.minStock);
      readMaster(a, p);
    end;
end;

procedure printSells (var a: detail);
var
  s: sell;
begin
  reset(a);
  readDetail(a, s);
  while (s.id <> highValue) do
    begin
      writeln('ID ', s.id, ' cantidad ', s.quantity);
      readDetail(a, s);
    end;
end;

var
  m, ws: master;
  d: detail;
  i: integer;
begin
  assign(m, 'productos.txt');
  assign(ws, 'sinStock');
  assign(d, 'ventas.txt');

  writeln('1) Agregar ventas.');
  writeln('2) Actualizar stock del maestro.');
  writeln('3) Crear archivo de menores al stock.');
  writeln('4) Imprimir el maestro.');
  writeln('5) Imprimir el menor a stock.');
  writeln('6) Imprimir ventas.');

  readln(i);

  case i of
    1: addSell(d);
    2: actMaster(m, d);
    3: createMinStock(m, ws);,
    4: printMaster(m);
    5: printMaster(ws);
    6: printSells(d);
  end;
end.
