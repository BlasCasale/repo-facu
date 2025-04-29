program ejer1;
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

  master = file of product;

  sells = file of sell;

  list = ^node;

  node = record
    data: sell;
    next: list;
  end;

procedure readSell (var a: sells; var s: sell);
begin
  if (not eof (a)) then
    read(a, s)
  else
    s.id:= highValue;
end;

procedure chargeNode (var l: list; s: sell);
var
  newNode, prev, act: list;
begin

  if (l = nil) then
    begin
      new(newNode);
      newNode^.data:= s;
      newNode^.next:= nil;
      l:= newNode;
    end
  else
    begin
      act:= l;
      while ((act <> nil) and (act^.data.id < s.id)) do
        begin
          prev:= act;
          act:= act^.next;
        end;

      if (act^.data.id = s.id) then
        act^.data.quantity:= act^.data.quantity + s.quantity
      else
        begin
          new(newNode);
          newNode^.data:= s;
          if (act = l) then
            l:= newNode
          else
            prev^.next:= newNode;
          newNode^.next:= act;
        end;
    end;
end;

procedure makeListWithSells (var s: sells; var l: list);
var
  aux: sell;
begin
  reset(s);

  readSell(s, aux);
  while (aux.id <> highValue) do
    begin
      chargeNode(l, aux);
      readSell(s, aux);
    end;

  close(s);
end;

procedure actualizeMaster (var a: master; l: list);
var
  s: sell;
begin
  reset(a);

  while (l <> nil) do
    begin
      read(a, s);
      while (l^.data.id <> s.id) do
        read(a, s);
      s.quantity:= s.quantity - l^.data.quantity;
      seek(a, filepos(a) - 1);
      write(a, s);
      seek(a, 0);
    end;
    
  close(a);
end;
{
  El encargado de ventas de un negocio de productos de limpieza desea administrar el 
  stock de los productos que vende. Para ello, genera un archivo maestro donde figuran 
  todos  los  productos  que  comercializa.  De  cada  producto  se  maneja  la  siguiente 
  información: código de producto, nombre comercial, precio de venta, stock actual y 
  stock mínimo. Diariamente se genera un archivo detalle donde se registran todas las 
  ventas de productos realizadas. De cada venta se registran: código de producto y 
  cantidad de unidades vendidas. Resuelve los siguientes puntos:  
  a.  Se  pide  realizar  un  procedimiento  que  actualice  el  archivo  maestro  con el 
  archivo detalle, teniendo en cuenta que: 
  i.  Los archivos no están ordenados por ningún criterio. 
  ii.  Cada registro del maestro puede ser actualizado por 0, 1 ó más registros 
  del archivo detalle. 
  b.  ¿Qué cambios realizaría en el procedimiento del punto anterior si se sabe que 
  cada registro del archivo maestro puede ser actualizado por 0 o 1 registro del 
  archivo detalle?
}
var

begin

end.
