
program ejer3;

type
  
  str50 = string[50];

  travelObj = record;
    id: integer;
    idCar: integer;
    adrresOrigin: str50;
    adressDestiny: str50;
    km: real;
  end;

  list = ^node;

  node = record
    element: travelObj;
    next: list;
  end;

  carMostTravel = record
    id: integer;
    km: real;
  end;

  listT = ^nodeT;

  nodeT = record
    element: integer;
    next: listT;
  end;

procedure chargeList (var l: list); // se dispone

procedure addNode (var l: listT; id: integer);
var
  newNode, prev, current: listT;
begin
  new(newNode);
  newNode^.element:= id;
  newNode^.next:= nil;
  current:= l;

  if (l = nil) then
    l:= newNode
  else
    begin
      while ((current <> nil) and (current^.element < id)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
      if (current = l) then
        begin
          newNode^.next:= l;
          l:= newNode;
        end
      else
        begin
          prev^.next:= newNode;
          newNode^.next:= current;
        end;
    end;
end;
procedure actualizeMostTravel (var maxOne, maxTwo: carMostTravel; counter: real; idCar: integer);
begin
  if (counter >= maxOne.km) then
    begin
      maxTwo.km:= maxOne.km;
      maxTwo.id:= maxOne.id;
      maxOne.km:= counter;
      maxOne.id:= idCar
    end
  else if (counter >= maxTwo.km) then
    begin
      maxTwo.km:= counter;
      maxTwo.id:= idCar;
    end;
end;
procedure roamList (l: list; var maxOne, maxTwo: carMostTravel; var lt: listT);
var
  idCar: integer;
  counter: real;
begin
  while (l <> nil) do
    begin
      counter:= 0;
      idCar:= l^.element.idCar;
      while ((l <> nil) and (idCar = l^.element.idCar)) do
        begin
          if (l^.element.km > 5) then
            addNode(lt, l^.element.id);
          counter:= counter + l^.element.km;    
          l:= l^.next;
        end;
      actualizeMostTravel(maxOne, maxTwo, counter, l^.element.id);
    end;
end;
// Una remisería dispone de información acerca de los viajes 
// realizados durante el mes de mayo de 2020. De
// cada viaje se conoce: número de viaje, código de auto, 
// dirección de origen, dirección de destino y
// kilómetros recorridos durante el viaje. Esta información 
// se encuentra ordenada por código de auto y para
// un mismo código de auto pueden existir 1 o más viajes. 
// Se pide:
// a. Informar los dos códigos de auto que más kilómetros 
// recorrieron.
// b. Generar una lista nueva con los viajes de más de 
// 5 kilómetros recorridos, ordenada por número de
// viaje.
var
  l: list;
  lt: listT;
  maxOne, maxTwo: carMostTravel;
begin
  l:= nil;
  chargeList(l);
  roamList(l, maxOne, maxTwo, lt);
end.