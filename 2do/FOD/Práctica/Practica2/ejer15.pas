program ejer15;
const
  highValue = 9999;
type

  locality = record
    idProv: integer;
    idLoc: integer;
    withoutLight: integer;
    withoutGas: integer;
    withoutWater: integer;
    withoutBath: integer;
    sheetMetal: integer;
    nameProv: string[20];
    nameLoc: string[20];
  end;

  report = record
    idProv: integer;
    idLoc: integer;
    withLight: integer;
    withGas: integer;
    withWater: integer;
    withBath: integer;
    builded: integer;
  end;

  archive = file of locality;

procedure readText (var a: text; var r: report);
begin
  if (not eof(a)) then
    readln(a, r.idProv, r.idLoc, r.withLight, r.withGas, r.withWater, r.withBath, r.builded)
  else
    r.idProv:= highValue;
end;

procedure getMin (var d1, d2, d3, d4, d5: text; var r1, r2, r3, r4, r5, min: report);
begin
  if (((r1.idProv <= r2.idProv) and (r1.idLoc <= r2.idLoc)) and ((r1.idProv <= r3.idProv) and (r1.idLoc <= r3.idLoc)) and ((r1.idLoc <= r4.idProv) and (r1.idLoc <= r4.idLoc)) and ((r1.idProv <= r5.idProv) and (r1.idLoc <= r5.idLoc))) then
    begin
      min:= r1;
      readText(d1, r1);
    end
  else if (((r2.idProv <= r3.idProv) and (r2.idLoc <= r3.idLoc)) and ((r2.idProv <= r4.idProv) and (r2.idLoc <= r4.idLoc)) and ((r2.idProv <= r5.idProv) and (r2.idLoc <= r5.idLoc))) then
    begin
      min:= r2;
      readText(d2, r2);
    end
  else if (((r3.idProv <= r4.idProv) and (r3.idLoc <= r4.idLoc)) and ((r3.idProv <= r5.idProv) and (r3.idLoc <= r5.idLoc))) then
    begin
      min:= r3;
      readText(d3, r3);
    end
  else if ((r4.idProv <= r5.idProv) and (r4.idLoc <= r5.idLoc)) then
    begin
      min:= r4;
      readText(d4, r4);
    end
  else
    begin
      min:= r5;
      readText(d5, r5);
    end;
end;

procedure readMaster (var a: archive; var l: locality);
begin
  if (not eof(a)) then
    read(a, l)
  else
    l.idProv:= highValue;
end;
  
{
  Se  desea  modelar  la información de una ONG dedicada a la asistencia de personas con 
  carencias habitacionales. La ONG cuenta con un archivo maestro conteniendo información 
  como se indica a continuación: Código pcia, nombre provincia, código de localidad, nombre 
  de  localidad,  #viviendas  sin  luz,  #viviendas  sin  gas,  #viviendas  de chapa, #viviendas sin 
  agua, # viviendas sin sanitarios.  
  Mensualmente reciben detalles de las diferentes provincias indicando avances en las obras 
  de ayuda en la edificación y equipamientos de viviendas en cada provincia. La información 
  de los detalles es la siguiente: Código pcia, código localidad, #viviendas con luz, #viviendas 
  construidas, #viviendas con agua, #viviendas con gas, #entrega sanitarios. 
  Se  debe  realizar  el  procedimiento  que  permita  actualizar  el  maestro  con  los  detalles 
  recibidos,  se  reciben  10  detalles. Todos los archivos están ordenados por código de 
  provincia y código de localidad.  
  Para la actualización del archivo maestro, se debe proceder de la siguiente manera:  
  ●  Al valor de viviendas sin luz se le resta el valor recibido en el detalle. 
  ●  Idem para viviendas sin agua, sin gas y sin sanitarios. 
  ●  A las viviendas de chapa se le resta el valor recibido de viviendas construidas 
  La misma combinación de  provincia y localidad aparecen a lo sumo una única vez. 
  Realice  las  declaraciones  necesarias,  el  programa  principal  y  los  procedimientos  que 
  requiera para la actualización solicitada e informe cantidad de localidades sin viviendas de 
  chapa (las localidades pueden o no haber sido actualizadas)
}

var
  d1, d2, d3, d4, d5: text;
  r1, r2, r3, r4, r5, min: report;
  a: archive;
  l: locality;
begin
  assign(a, 'localidadesONG.txt');
  assign(d1, 'local1.txt');
  assign(d2, 'local2.txt');
  assign(d3, 'local3.txt');
  assign(d4, 'local4.txt');
  assign(d5, 'local5.txt');
  reset(a);
  reset(d1);
  reset(d2);
  reset(d3);
  reset(d4);
  reset(d5);

  readText(d1, r1);
  readText(d2, r2);
  readText(d3, r3);
  readText(d4, r4);
  readText(d5, r5);
  if (not eof(a)) then
  read(a, l);

  getMin(d1, d2, d3, d4, d5, r1, r2, r3, r4, r5, min);

  while (min.idProv <> highValue) do
    begin
      while ((not eof(a)) and (min.idProv <> l.idProv)) do
        read(a, l);

      while ((not eof(a)) and (l.idLoc <> min.idLoc)) do
        read(a, l);
      
      l.withoutBath:= l.withoutBath - min.withBath;
      l.withoutGas:= l.withoutGas - min.withGas;
      l.withoutLight:= l.withoutLight - min.withLight;
      l.withoutWater:= l.withoutWater - min.withWater;
      l.sheetMetal:= l.sheetMetal - min.builded;

      seek(a, filepos(a) - 1);

      write(a, l);

      if (not eof(a)) then
        read(a, l);
      getMin(d1, d2, d3, d4, d5, r1, r2, r3, r4, r5, min);
    end;

  seek(a, 0);

  readMaster(a, l);

  while (l.idProv <> highValue) do
    begin
      writeln(l.idProv, ' ', l.idLoc, ' ', l.withoutBath, ' ', l.withoutGas, ' ', l.withoutLight, ' ', l.withoutWater);
      readMaster(a, l);
    end;

  close(a);
  close(d1);
  close(d2);
  close(d3);
  close(d4);
  close(d5);
end.
