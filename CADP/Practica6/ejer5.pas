program ejer5;
const
  quantityMultiple = 3;
  cut = -1;
type
  productObj = record
    id: integer;
    desc: string[50];
    actualStock: integer;
    minStock: integer;
    price: real;
  end;

  list = ^node;

  node = record
    element: productObj;
    next: list;
  end;

  listDesc = ^descProdNode;

  descProdNode = record
    desc: string[50];
    next: listDesc;
  end;

  cheapProdObj = record
    id: integer;
    price: real;
  end;

{lectura del prod}
procedure chargeProd (var prod: productObj);
begin
  write('Ingrese el codigo del producto: ');
  readln(prod.id);
  if (prod.id <> cut) then
    begin
      writeln('Ingrese la descripcion del producto: ');
      readln(prod.desc);
      writeln('Ingrese el stock actual del producto: ');
      readln(prod.actualStock);
      writeln('Ingrese el stock minimo del producto: ');
      readln(prod.minStock);
      writeln('Ingrese el precio del producto: ');
      readln(prod.price);
    end;
end;

{agregar un nodo teniendo como referencia al primero y ultimo}
procedure addNode (var l, last: list; prod: productObj);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= prod;
  newNode^.next:= nil;
  if (l = nil) then
    begin
      l:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;

{agregar nodo a la lista de prod con desc}
procedure addNodeDesc (var l, last: listDesc; descProd: string[50]);
var
  newNode: listDesc;
begin
  new(newNode);
  newNode^.desc:= descProd;
  newNode^.next:= nil;
  if (l = nil) then
    begin
      l:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;

{descompocision de numero para llevar el contador}
function decomposeNumber (id: integer): boolean;
var
  counter, aux: integer;
begin
  counter:= 0;
  while (id > 0) then
    begin
      aux:= id mod 10;
      if ((aux mod 2) = 0) then
        counter:= counter + 1;
      id:= id div 10;
    end;
  decomposeNumber:= counter >= quantityMultiple;
end;
{porcentaje por stock}
function getAverageStock (l: list): real;
var
  underMin, counter: integer;
begin
  underMin:= 0;
  counter:= 0;
  while (l <> nil) do
    begin
      if (l^.element.actualStock < l^.element.minStock) then
        underMin:= underMin + 1;
      counter:= counter + 1;
      l:= l.^.next;
    end;
  getAverageStock:= (underMin * 100) / counter;
end;
{buscando minimos}
procedure getMinId (var minOne, minTwo: cheapProdObj; prod: productObj);
begin
  if (prod.price <= minOne.price) then
    begin
      minTwo.price:= minOne.price;
      minTwo.id:= minOne.id;
      minOne.price:= prod.price;
      minOne.id:= prod.id;
    end
  else if (prod.price <= minTwo.price) then
    begin
      minTwo.price:= prod.price;
      minOne.id:= prod.id;
    end
end;
procedure printList (l: listDesc);
begin
  while (l <> nil) do
    begin
      writeln(l^.desc);
      l:= l^.next;
    end;
end;
var
  {
    productos de supermercado
    prod: id, desc, actualStock, minStock, price
    corta con id -1 {while}
    informar:
    a) porcentaje de productos con stock actual por debajo de su stock minimo
    b) descripcion de productos con codigo con al menos 3 digitos pares
    c) codigo de los prod mas baratos
  }
  firstNodeProd, lastNodeProd: list;
  firstNodeDesc, lastNodeDesc: listDesc;
  minOne, minTwo: cheapProdObj;
  average: real;
  prod: productObj;
begin
  firstNodeProd:= nil;
  lastNodeProd:= nil;
  firstNodeDesc:= nil;
  lastNodeDesc:= nil;
  minOne.price:= 99999;
  minTwo.price:= 99999;
  chargeProd(prod);
  while (prod.id <> cut) do
    begin
      addNode(firstNodeProd, lastNodeProd, prod);
      if (decomposeNumber(prod.id)) then
        addNodeDesc(firstNodeDesc, lastNodeDesc, prod.desc);
      getMinId(minOne, minTwo, prod);
      chargeProd(prod);
    end;
  printList(firstNodeDesc);
  average:= getAverageStock(firstNodeProd);
  writeln('Prod mas barato ', minOne.id, ' y segundo prod ', minTwo.id);
  writeln('Porcentaje de prod con menos stock %', average:0:2);
end.
