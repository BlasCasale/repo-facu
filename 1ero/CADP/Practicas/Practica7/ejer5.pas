program ejer5;

const
  cut = -1;
type

  trucksId = 1..100;

  truckObj = record
    patent: string;
    year: integer;
    capacity: real;
  end;

  travelObj = record
    id: integer;
    idTruck: trucksId;
    km: real;
    destiny: string;
    year: integer;
    dni: integer;
  end;

  vecCounter = array [trucksId] of truckObj;

  list = ^node;

  node = record
    element: travelObj;
    next: list;
  end;

  listD = ^nodeD;

  nodeD = record
    element: integer;
    next: listD;
  end;

  {
    Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones.
    De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en toneladas que puede
    transportar).
    Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De cada
    viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros recorrida,
    ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando se lee el código
    de viaje -1.
    Una vez leída y almacenada la información, se pide:
    1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
    menos kilómetros recorridos posee.
    2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas
    y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el
    viaje).
    3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
    Nota: Los códigos de viaje no se repiten
  }
var

begin
  
end.
