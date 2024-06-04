program ejer14;
const
  busL = 35;
  busS = 20;
  trainU = 15;
  trainR = 30;
  bicicle = 0;
  cut = -1;
type

  counterVec = array [0..4] of integer;

  moreUsedObj = record
    id: integer;
    counter: integer;
  end;

  travelObj = record
    id: integer;
    day: integer;
    university: string[40];
    transport: integer;
  end;

  list = ^node;

  node = record
    element: travelObj;
    next: list;
  end;

procedure addNode (var l: list; travel: travelObj);
var
  newNode, current, prev: list;
begin
  new(newNode);
  newNode^.element:= travel;
  current:= l;
  while ((current <> nil) and (travel.id > current^.element.id)) do
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
procedure takeInfo (var travel: travelObj);
begin
  write('Ingrese el codigo del alumno: ');
  readln(travel.id);
  if (travel.id <> cut) then
    begin
      writeln('Ingrese el dia del viaje: ');
      readln(travel.day);
      writeln('Ingrese la universidad del estudiante: ');
      readln(travel.university);
      writeln('Ingrese el metodo de transporte del estudiante (1: bus interubano, 2: bus interurbano, 3: tren universitario, 4: tren Roca, 5: bicicleta):');
      readln(travel.transport);
    end;
end;
procedure initializeVec (var v: counterVec);
var
  i: integer;
begin
  for i:= 0 to 4 do
    v[i]:= 0;
end;
procedure countTravels (var v: counterVec; travel: travelObj);
begin
  if (travel.transport = 1) then
    v[0]:= v[0] + 1
  else if (travel.transport = 2) then
    v[1]:= v[1] + 1
  else if (travel.transport = 3) then
    v[2]:= v[2] + 1
  else if (travel.transport = 4) then
    v[3]:= v[3] + 1
  else
    v[4]:= v[4] + 1;
end;
procedure getMoreUsedTravelMethod (var oneUsed, twoUsed: moreUsedObj; v: counterVec);
var
  i: integer;
begin
  for i:= 0 to 4 do
    begin
      if (v[i] >= oneUsed.counter) then
        begin
          twoUsed.id:= oneUsed.id;
          twoUsed.counter:= oneUsed.counter;
          oneUsed.id:= i + 1;
          oneUsed.counter:= v[i];
        end
      else if (v[i] >= twoUsed.counter) then
        begin
          twoUsed.id:= i + 1;
          twoUsed.counter:= v[i];
        end;
    end;
end;
function addSpents (acc: integer; travel: travelObj): integer;
var
  total: integer;
begin
  if (travel.transport = 1) then
    total:= acc + busL
  else if (travel.transport = 2) then
    total:= acc + busS
  else if (travel.transport = 3) then
    total:= acc + trainU
  else if (travel.transport = 4) then
    total:= acc + trainR
  else
    total:= acc + bicicle;

  addSpents:= total;
end;
procedure roamList (l: list; var counterMoreTravels, counterSpent, counterBike: integer);
var
  id, counterTravels, acc: integer;
  bike, another: boolean;
begin
  while (l <> nil) do
    begin
      id:= l^.element.id;
      counterTravels:= 0;
      acc:= 0;
      bike:= false;
      another:= false;
      while ((l <> nil) and (l^.element.id = id)) do
        begin
          acc:= addSpents(acc, l^.element);
          counterTravels:= counterTravels + 1;

          if ((not(bike)) and (l^.element.transport = 5)) then
            bike:= true;
          if ((not(another)) and (l^.element.transport <> 5)) then
            another:= true;
          if ((bike) and (another)) then
            counterBike:= counterBike + 1;
          
          l:= l^.next;
        end;
      if (counterTravels >= 6) then
        counterMoreTravels:= counterMoreTravels + 1;
      if (acc >= 80) then
        counterSpent:= counterSpent + 1;
    end;
end;

var
  {
    corte id -1 (while)
    viaje: id (alum), dia, facultad y transporte
    informar:
    a) cantidad de alumnos que realizan mas de 6 viajes
    b) la cantidad de alumnos que gastan mas de $80 por dia
    c) los dos medios de transporte mas utilizados 
    d) la cantidad de alumnos que usan bici y algo mas
  }
  counter: counterVec;
  l: list;
  travel: travelObj;
  counterMoreTravels, counterBike, counterSpent: integer;
  oneUsed, twoUsed: moreUsedObj;

begin
  l:= nil;
  counterMoreTravels:= 0;
  counterBike:= 0;
  counterSpent:= 0;
  takeInfo(travel);
  initializeVec(counter);
  while (travel.id <> cut) do
    begin
      addNode(l, travel);
      countTravels(counter, travel);
    end;
  oneUsed.counter:= -1;
  twoUsed.counter:= -1;
  getMoreUsedTravelMethod(oneUsed, twoUsed, counter);
  roamList(l, counterMoreTravels, counterSpent, counterBike);
  writeln(counterMoreTravels, ' estudiantes hicieron mas de 6 viajes.');
  writeln(counterSpent, ' estudiantes gastaron mas de $80.');
  writeln(counterBike, ' estudiantes utilizaron bicicleta y otro medio de transporte.');
end.
