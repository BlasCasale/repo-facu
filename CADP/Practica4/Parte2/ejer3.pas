program ejer3;
  {
    empresa de caudales
    de cada viaje se cuenta con el dia
    almacenar a lo sumo 200 viajes, corta cuando se ingresa un viaje con 0km {while}
    modulo que reciba el vector e informe,monto promedio de los viajes realizados, la distancia y el dia que se realizo el viaje que transporto menos dinero
    la cantidad de viajes realizados cada dia del mes
    modulo que reciba el vector y elimine todos los viajes de 100km
  }
const 
  long = 199;
type
  dayInfo = record
    km: real;
    money: integer;
    day: integer;
  end;

  vec = array [0..long] of dayInfo;

  counterDays =  array [0..30] of integer;

procedure addTravel (var v: vec; day: dayInfo; var dimL: integer);
begin
  if ((dimL + 1) <= (long +1)) then
    begin
      v[dimL]:= day;
      dimL:= dimL + 1;
    end;
end;
var
  {Variables}

begin
  {Programa principal}
end.
