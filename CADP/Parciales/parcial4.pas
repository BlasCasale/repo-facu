program parcial4;
const
  start = 1;
  finish = 12;
type
  years = 2014..2024;

  months = start..finish;

  buyObj = record
    id: integer;
    month: months;
    year: years;
    amount: real;
    dni: integer;
  end;

  list = ^node;

  node = record
    element: buyObj;
    next: list;
  end;

  minObj = record
    month: integer;
    amount: real;
  end;

  vecMonths = array [months] of real;

procedure chargeList (var l: list); // se dispone

procedure initializeVec (var v: vecMonths);
var
  i: integer;
begin
  for i:= start to finish do
    v[i]:= 0;
end;

procedure actVecMonths (var v: vecMonths; buy: buyObj);
begin
  v[buy.month]:= v[buy.month] + buy.amount;
end;

procedure getMin (v: vecMonths; var minOne, minTwo: minObj);
var
  i: integer;
begin
  for i:= start to finish do
    begin
      if (minOne.amount < v[i]) then
        begin
          minTwo.amount:= minOne.amount;
          minTwo.month:= minOne.month;
          minOne.amount:= v[i];
          minOne.month:= i;
        end
      else if (minTwo.amount < v[i]) then
        begin
          minTwo.amount:= v[i];
          minTwo.month:= i;
        end;
    end;
end;
function getMultiple (id: integer): boolean;
begin
  getMultiple:= (id mod 10) = 0;
end;

procedure insertNode (var l: list; buy: buyObj);
var
  newNode, prev, current: list;
begin
  new(newNode);
  newNode^.element:= buy;
  newNode^.next:= nil;
  current:= l;

  if (l = nil) then
    l:= newNode
  else
    begin
      while ((current <> nil) and (current^.element.dni < newNode^.element.dni)) do
        begin
          prev:= current;
          current:= current^.next;
        end;

        if (current = l) then
          begin
            newNode^.next:= current;
            l:= newNode;
          end
        else
          begin
            prev^.next:= newNode;
            newNode^.next:= current;
          end;
    end;
end;

procedure roamList (l: list; var lo: list);
var
  year: integer;
begin
  readln(year);

  while (l <> nil) do
    begin
      if (l^.element.year = year) then
        insertNode(lo, l^.element);
      l:= l^.next;
    end;
end;

procedure solve (l: list; var v: vecMonths; var counter: integer);
var
  dni: integer;
  acc: real;
begin
  while (l <> nil) do
    begin
      dni:= l^.element.dni;
      acc:= 0;

      while ((l <> nil) and (l^.element.dni = dni)) do
        begin
          acc:= acc + l^.element.amount;
          actVecMonths(v, l^.element);
          if (getMultiple(l^.element.id)) then
            counter:= counter + 1;
        end;

      writeln('dni ', dni, ' compro ', acc);
    end;
end;
  {
    dispone de lista de las compras
    compra: id, month, year (2014-2024), amount, dni
    realizar un programa que lea de teclado un año y luego
    a) almacene en otra ed las compras realizadas el año leido, ordenada por dni
    b) despues de almacenar, procesar lo del inciso A
      1) para cada cliente, el monto total entre todas sus compras
      2) los 2 meses con menor facturacion
      3) cantidad de compras con id multiplo de 10
  }
var
  l, lo: list;
  months: vecMonths;
  minOne, minTwo: minObj;
  counter: integer;
begin
  l:= nil;
  lo:= nil;
  counter:= 0;

  chargeList(l); // se dispone

  initializeVec(months);

  roamList(l, lo);

  solve(lo, months, counter);

  getMin(months, minOne, minTwo);

  writeln('Id1: ', minOne.month, ' id2: ', minTwo.month);

  writeln('Cantidad de id multiplo de 10 ', counter);
end.
