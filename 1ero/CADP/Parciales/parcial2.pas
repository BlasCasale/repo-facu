program parcial2;
type
  
  categoryRange = 1..4;
  
  daysRange = 1..31;

  minDayObj = record
    day: daysRange;
    counter: integer;
  end;

  eventObj = record
    id: integer;
    day: daysRange;
    dni: integer;
    start: integer;
    finish: integer;
    category: categoryRange;
  end;

  eventSpentObj = record
    id: integer;
    total: real;
  end;

  listT = ^nodeT;

  nodeT =  record
    element: eventSpentObj;
    next: listT;
  end;

  list = ^node;

  node = record
    element: eventObj;
    next: list;
  end;

  vecBills = array [categoryRange] of real;

  vecDays = array [daysRange] of integer;

procedure chargeList(var l: list); // se dispone

function getEven (dni: integer): boolean;
begin
  getEven:= (dni mod 2) <> 0;
end;
function getReserve (event: eventObj): boolean;
begin
  getReserve:= (event.start >= 12) and (event.day >= 15);
end;
procedure chargeVecBills (var v: vecBills);
begin
  v[1]:= 30.5;
  v[2]:= 25.7;
  v[3]:= 28.9;
  v[4]:= 42.9;
end;
procedure initializeVecDays (var v: vecDays);
var
  i: integer;
begin
  for i:= 1 to 31 do
    v[i]:= 0;
end;
procedure insertNode (var l: listT; eventSpent: eventSpentObj);
var
  prev, current, newNode: listT;
begin
  new(newNode);
  newNode^.element:= eventSpent;
  current:= l;

  if (l = nil) then
    l:= newNode
  else
    begin
      while ((current <> nil) and (current^.element.total < newNode^.element.total)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
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
procedure roamList (l: list);
begin
  while (l <> nil) do
    begin
      writeln('ID: ', l^.element.id);
      writeln('Total: $', l^.element.total);
      l:= l^.next;
    end;
end;
  {
    salon de eventos tiene una lista de reservas
    reserva: id, dni, dia, start, end y category
    dispone de una tabla con el precio por hora de acuerdo a la category
    informar:
    a) lista con id y total de reserva (ordenada ascendentemente)
    b) los dos dias del mes con menor cantidad de reservas con dni impar
    c) porcentaje de reservas que inicien despues de las 12hs y se hagan despues de la segunda quincena
  }
var
  l, aux: list;
  listTotal: listT;
  event: eventObj;
  eventSpent: eventSpentObj;
  billsTable: vecBills;
  days: vecDays;
  totalCounter, counterTrue, actualDay: integer;
  minOne, minTwo: minDayObj;
  averageReserve: real;
begin
  chargeList(l); // se dispone
  initializeVecDays(days);
  chargeVecBills(billsTable);

  aux:= l;

  totalCounter:= 0;
  counterTrue:= 0;

  while (aux <> nil) do
    begin
      totalCounter:= totalCounter + 1;
      event:= aux^.element;
      
      if (getReserve(event)) then
        counterTrue:= counterTrue + 1;
      
      if (getEven(event.dni)) then
        begin
          actualDay:= event.day;
          days[actualDay]:= days[actualDay] + 1;
        end;

      eventSpent.id:= event.id;
      eventSpent.total:= billsTable[event.category] * (event.finish - event.start);

      insertNode(listTotal, eventSpent);

      aux:= aux^.next;
    end;

  minOne.counter:= -1;
  minTwo.counter:= -1;

  for i:= 1 to 31 do
    begin
      if (days[i] <= minOne.counter) then
        begin
          minTwo.counter:= minOne.counter;
          minTwo.day:= minOne.id;
          minOne.counter:= days[i];
          minOne.day:= i;
        end
      else if (days[i] <= minTwo.counter) then
        begin
          minTwo.counter:= days[i];
          minTwo.day:= i;
        end;
    end;

  writeln('Dia menor 1: ', minOne.day, ' y dia menor 2: ', minTwo.day);

  roamList(listTotal);

  averageReserve:= (counterTrue * 100) / totalCounter;
end.
