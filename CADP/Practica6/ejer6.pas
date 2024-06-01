program ejer6;
const
  cut = 'GAIA';
type
  list = ^node;

  studyField = 1..7;

  sateliteObj = record
    name: string[30];
    months: integer;
    constructionCost: real;
    maintanceCost: real;
    study: studyField;
  end;

  node = record
    element: sateliteObj;
    next: list;  
  end;

  listNames = ^nodeName;

  nodeName = record
    element: string[30];
    next: listNames;
  end;

  vec = array [0..6] of integer;

procedure addNode (var l, last: list; satelite: sateliteObj);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= satelite;
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
procedure addNodeName (var l, last: listNames; satelite: sateliteObj);
var
  newNode: listNames;
begin
  new(newNode);
  newNode^.element:= satelite.name;
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
procedure chargeSatelite (var satelite: sateliteObj);
begin
  write('Ingrese le nombre del satelite: ');
  readln(satelite.name);
  writeln('Ingrese la duracion de la mision (en meses): ');
  readln(satelite.months);
  writeln('Ingrese el coste de construccion del satelite: ');
  readln(satelite.constructionCost);
  writeln('Ingrese el coste de mantenimiento del satelite: ');
  readln(satelite.maintanceCost);
  writeln('Ingrese el tipo de estudio que realiza: ');
  readln(satelite.study);
end;
procedure getExpensiveSat (satelite: sateliteObj; var nameSat: string; var max: real);
var
  acc: real;
begin
  acc:= satelite.constructionCost + satelite.maintanceCost;
  if (acc >= max) then
    begin
      nameSat:= satelite.name;
      max:= acc;
    end;
end;
function getAccMonths (s: sateliteObj; acc: integer): integer;
begin
  getAccMonths:= acc + s.months;
end;
function getAccCost (s: sateliteObj; acc: real): real;
begin
  getAccCost:= acc + s.constructionCost;
end;
procedure getSatType (satelite: sateliteObj; var counter: vec);
begin
  if (satelite.study = 1) then
    counter[0]:= counter[0] + 1
  else if (satelite.study = 2) then
    counter[1]:= counter[1] + 1
  else if (satelite.study = 3) then
    counter[2]:= counter[2] + 1
  else if (satelite.study = 4) then
    counter[3]:= counter[3] + 1
  else if (satelite.study = 5) then
    counter[4]:= counter[4] + 1
  else if (satelite.study = 6) then
    counter[5]:= counter[5] + 1
  else
    counter[6]:= counter[6] + 1;
end;
procedure initializeVec (var v: vec);
var
  i: integer;
begin
  for i:= 0 to 6 do
    v[i]:= 0;
end;
function countSatDuration (satelite: sateliteObj; value, quantity: integer): integer;
begin
  if (satelite.months >= value) then
    quantity:= quantity + 1;
  countSatDuration:= quantity;
end;
  {modulos del ejer 7}
  {
    solo financian los que la construccion > mantenimiento
    no se financian proyectos tipo 1
  }
function validateSat (satelite: sateliteObj): boolean;
var
  ok: boolean;
begin
  ok:= true;
  if ((satelite.study = 1) or (satelite.constructionCost < satelite.maintanceCost)) then
    ok:= false;
  validateSat:= ok;
end;
procedure countSatAndCost (satelite: sateliteObj; var counter: integer; var totalCost: real);
begin
  counter:= counter + 1;
  totalCost:= totalCost + satelite.constructionCost + satelite.maintanceCost;
end;
procedure createLists (l: list; var archieve, notArchieve: list);
var
  newNode, auxYes, auxNo: list;
  counter: integer;
  totalCost: real;
begin
  counter:= 0;
  totalCost:= 0;
  while (l <> nil) do
    begin
      new(newNode);
      newNode^.element:= l^.element;
      newNode^.next:= nil;
      if (validateSat(newNode^.element)) then
        begin
          if (archieve = nil) then
            begin
              archieve:= newNode;
              auxYes:= archieve;
            end
          else
            auxYes^.next:= newNode;
        end
      else
        begin
          if (notArchieve = nil) then
            begin
              notArchieve:= newNode;
              auxNo:= notArchieve;
            end
          else
            auxNo^.next:= newNode;
          countSatAndCost(l^.element, counter, totalCost);
        end;
      l:= l^.next;
    end;
  writeln(counter, ' no cumplen con las condiciones y cuestan ', totalCost:0:2);
end;
  {
    sondas espaciales
    nombre, meses, costo de construccion, costo de manutencion, rango de espectros (1 radio, 2 microondas, 3 infrarrojo, 4 luz visible, 5 ultravioleta, 6 rayos x, 7 rayos gamma)
    corta con GAIA (nombre) {repeat until}
    informar
    el nombre de la mas costosa (const y mant) x
    cantidad de sondas que estudian cada tipo de espectros x
    cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas x
    el nombre de las sondas cuyo costo de construccion supera el costo promedio entre todas las sondas x
  }
var
  counter: vec; {contador}
  satelite: sateliteObj; {objeto}
  archieveList, notArchieveList: list; {lista de los que cumplen}
  firstSat, lastSat, aux: list; {primero y ultimo de la lista de sat}
  firstName, lastName, auxN: listNames; {primero y ultimo de la lista de nombres}
  averageMonths, quantitySat, counterSatDuration, i: integer; {contador de meses que despues divido por cantidad de sat}
  nameExpensiveSat: string[30]; {nombre del sat}
  accCost, maxCost: real; {acumulador del costo y costo maximo}
begin
  initializeVec(counter);
  averageMonths:= 0;
  quantitySat:= 0;
  accCost:= 0;
  maxCost:= -1;
  counterSatDuration:= 0;
  repeat
    chargeSatelite(satelite);
    addNode(firstSat, lastSat, satelite);
    getExpensiveSat(satelite, nameExpensiveSat, maxCost);
    getSatType(satelite, counter);
    averageMonths:= getAccMonths(satelite, averageMonths);
    accCost:= getAccCost(satelite, accCost);
    quantitySat:= quantitySat + 1;
  until satelite.name = cut;


  accCost:= accCost / quantitySat;
  averageMonths:= averageMonths div quantitySat;
  aux:= firstSat;
  firstName:= nil;
  lastName:= nil;
  while (aux <> nil) do
    begin
      if (aux^.element.months >= averageMonths) then
        counterSatDuration:= counterSatDuration + 1;
      if (aux^.element.constructionCost >= accCost) then
        addNodeName(firstName, lastName, aux^.element);
      aux:= aux^.next;
    end;

  writeln('El nombre del satelite mas caro es ', nameExpensiveSat);
  writeln('La cantidad de satelites que superan el promedio de meses en viaje ', counterSatDuration);
  
  for i:= 0 to 6 do
    writeln('La sonda tipo ', i + 1, 'tiene ', counter[i], ' satelites en orbita');

  auxN:= firstName;
  while (aux <> nil) do
    begin
      writeln(auxN^.element);
      aux:= aux^.next;
    end;

  archieveList:= nil;
  notArchieveList:= nil;
end.
