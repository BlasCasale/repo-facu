program delete;

  {
    dispongo de de ed (lista)
    reserva: id, dni, day, begin, end, category
    dispongo de tabla de precios (vector)
  }
const
  dimF = 4;
type

  rangeDays = 1..31;

  codeCategory = 1..dimF;

  vecPrices = array [codeCategory] of real;

  vecDays = array [rangeDays] of integer;

  infoP = record
    id: integer;
    price: real;
  end;

  listP = ^nodeP;

  nodeP = record
    element: infoP;
    next: listP;
  end;

  party = record
    id: integer;
    dni: integer;
    day: rangeDays;
    begin: integer;
    finish: integer;
    category: codeCategory;
  end;
  
  list = ^node;

  node = record
    element: party;
    next: list;
  end;

procedure initializeTable (var table: vecPrices); // se dispone
procedure chargeList (var l:list); // se dispone
procedure deleteNode (var l: list; x: integer);
var
  prev, current: list;
begin
  current:= l;
  while ((current <> nil) and (current^.element <> x)) do
    begin
      prev:= current;
      current:= current^.next;
    end;
  if (current^.element = x) then
    begin
      prev^.next:= current^.next;
      dispose(current);
    end;
end;

var
  prices: vecPrices;
  l: list;
begin
  initializeTable(prices); // se dispone
  chargeList(l); // se dispone
end.
