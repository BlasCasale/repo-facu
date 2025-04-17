program ejer14;
const
  highValue = 'ZZZZ';
type

  travel = record
    departureTime: integer;
    seatings: integer;
    date: string[11];
    destiny: string[20];
  end;

  detail = record
    departureTime: integer;
    purchasedSeats: integer;
    date: string[11];
    destiny: string[20];
  end;

  infoList = record
    departureTime: integer;
    date: string[11];
    destiny: string[20];
  end;

  list = ^node;

  node = record
    data: infoList;
    next: list;
  end;

procedure readMaster (var a: text; var t: travel);
begin
  if (not eof(a)) then
    readln(a, t.departureTime, t.seatings, t.date, t.destiny)
  else
    t.destiny:= highValue;
end;

procedure readDetail (var a: text; var d: detail);
begin
  if (not eof(a)) then
    readln(a, d.departureTime, d.purchasedSeats, d.date, d.destiny)
  else
    d.destiny:= highValue;
end;

procedure actMaster (var mas, det: text);
var
  t: travel;
  d: detail;
begin
  reset(mas);
  reset(det);

  readMaster(mas, t);
  readDetail(det, d);

  while (d.destiny <> highValue) do
    begin
      while (t.destiny <> d.destiny) do
        readMaster(mas, t);

      while ((d.destiny = t.destiny)) do
        begin
          while ((d.destiny = t.destiny) and (d.date <> t.date)) do
            readMaster(mas, t);
          
          while ((d.destiny = t.destiny) and (d.date = t.date) and (d.departureTime <> t.departureTime)) do
            readMaster(mas, t);
          
          if ((d.destiny = t.destiny) and (d.date = t.date) and (d.departureTime = t.departureTime)) then
            t.seatings:= t.seatings - d.purchasedSeats;

          seek(mas, filepos(mas) - 1);

          writeln(mas, t.departureTime, ' ' t.purchasedSeats, ' ', t.date, t.destiny);

          readDetail(det, d);
        end;
    end;

  close(mas);
  close(det);
end;

procedure insertFirst (var l: list; i: infoList);
var
  newNode: list;
begin
  new(newNode);
  newNode^.data:= i;
  newNode^.next:= l;
  l:= newNode;
end;

procedure createList (var a: text; var l: list; value: integer);
var
  t: travel;
  i: infoList;
begin
  reset(a);
  l:= nil;

  readMaster(a, t);

  while (t.destiny <> highValue) do
    begin
      if (t.seatings <= value) then
        begin
          i.departureTime:= t.departureTime;
          i.date:= t.date;
          i.destiny:= t.destiny;
          insertFirst(l, i);
        end;
      readMaster(a, t);
    end;

  close(a);
end;
{
  Una compañía aérea dispone de un archivo maestro donde guarda información sobre sus 
  próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida y la 
  cantidad  de  asientos  disponibles. La empresa recibe todos los días dos archivos detalles 
  para actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida 
  y cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino 
  más fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada 
  uno del maestro. Se pide realizar los módulos necesarios para: 
  a.  Actualizar el archivo maestro sabiendo que no se registró ninguna venta de pasaje 
  sin asiento disponible. 
  b.  Generar  una  lista  con  aquellos  vuelos  (destino  y  fecha  y  hora  de  salida)  que 
  tengan menos de una cantidad específica de asientos disponibles. La misma debe 
  ser ingresada por teclado. 
  NOTA: El archivo maestro y los archivos detalles sólo pueden recorrerse una vez.
}
var
  mas, det: text;
  c: char;
  l: list;
  i: integer;
begin
  assign(mas, 'maestroVuelos.txt');
  assign(det, 'ventaVuelos.txt');

  writeln('A) Actualizar el maestro con las ventas de pasajes.');
  writeln('B) Generar una lista con los vuelos con menor capacidad de asientos que la cantidad ingresada.');

  readln(c);

  if (c = 'A') then
    actMaster(mas, det)
  else
    begin
      writeln('Ingrese el valor para crear la lista.');
      readln(i);
      createList(mas, l, i);
    end;
end.
