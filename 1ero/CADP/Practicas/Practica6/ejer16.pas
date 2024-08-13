program ejer16;


type

  str30 = string[30];

  runnerObj = record
    fullname: string[50];
    distance: real;
    time: integer;
    country: str30;
    start: str30;
    finish: str30;
  end;

  list = ^node;

  node = record
    element: runnerObj;
    next: list;
  end;

  counterObj = record
    totalRunners: integer;
    totalKm: real;
    totalTime: integer;
  end;

  cityObj = record
    name: str30;
    counter: integer;
    km: real;
  end;

  cityList = ^nodeC;

  nodeC = record
    element: cityObj;
    next: cityList;
  end;

  counterBrasilObj = record
    counter: integer;
    km: real;
  end;

  counterBostonObj = record
    time: integer;
    km: real;
  end;

procedure addNode (var first, last: list; runner: runnerObj);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= runner;
  newNode^.next:= nil;

  if (first = nil) then
    begin
      first:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;
  {
    corredores: nombre y apellido, distancia recorrida (real), tiempo corriendo, pais, ciudad donde empezo y donde termino
    corta con la distancia -1 (while)
    informar:
    a) cantidad total de corredores, distancia total recorrida y el tiempo total
    b) el nombre de la ciudad que convoco mas corredores y la cantidad de km totales por los corredores de esa ciudad
    c) distancia promedio de los corredores de brasil
    d) la cantidad de corredores que empezaron en una y terminaron en otra
    e) el paso (cantidad de min * km) promedio de los corredores de la ciudad de Boston
  }
var
  {Variables}

begin
  {Programa principal}
end.
