program ejer6;
const
  highValue = 9999;
type

  // registro para el detalle

  municipality = record
    id: integer;
    idStrain: integer;
    activeCases: integer;
    newCases: integer;
    recovered: integer;
    deceased: integer;
  end;

  // registro para el maestro

  municipalityMaster = record
    id: integer;
    name: string[30];
    idStrain: integer;
    nameStrain: string[30];
    activeCases: integer;
    newCases: integer;
    recovered: integer;
    deceased: integer;
  end;

  archive = file of municipalityMaster;

procedure setInfo (var m: municipalityMaster);
begin
  writeln('ID');
  readln(m.id);
  if (m.id <> highValue) then
    begin
      writeln('Localidad');
      readln(m.name);
      writeln('Codigo de cepa');
      readln(m.idStrain);
      writeln('Nombre de cepa');
      readln(m.nameStrain);
      writeln('Casos activos');
      readln(m.activeCases);
      writeln('Nuevos casos');
      readln(m.newCases);
      writeln('Recuperados');
      readln(m.recovered);
      writeln('Fallecidos');
      readln(m.deceased);
    end;
end;

procedure chargeArchive (var a: archive);
var
  m: municipalityMaster;
begin
  reset(a);
  setInfo(m);
  seek(a, filesize(a));
  while (m.id <> highValue) do
    begin
      write(a, m);
      setInfo(m);
    end;
  close(a);
end;

procedure readText (var a: text; var m: municipality);
begin
  if (not eof(a)) then
    readln(a, m.id, m.idStrain, m.activeCases, m.newCases, m.recovered, m.deceased)
  else
    m.id:= highValue;
end;

procedure getMin (var d1, d2, d3, d4, d5: text; var m1, m2, m3, m4, m5: municipality; var min: municipality);
begin
  if (((m1.id <= m2.id) and (m1.idStrain <= m2.idStrain)) and ((m1.id <= m3.id) and (m1.idStrain <= m3.idStrain)) and ((m1.id <= m4.id) and (m1.idStrain <= m4.idStrain)) and ((m1.id <= m5.id) and (m1.idStrain <= m5.idStrain))) then
    begin
      min:= m1;
      readText(d1, m1);
    end
  else
    begin
      if (((m2.id <= m3.id) and (m2.idStrain <= m3.idStrain)) and ((m2.id <= m4.id) and (m2.id <= m4.idStrain)) and ((m2.id <= m5.id) and (m2.idStrain <= m5.idStrain))) then
        begin
          min:= m2;
          readText(d2, m2);
        end
      else
        begin
          if (((m3.id <= m4.id) and (m3.idStrain <= m4.idStrain)) and ((m3.id <= m5.id) and (m3.idStrain <= m5.idStrain))) then
            begin
              min:= m3;
              readText(d3, m3);
            end
          else
            begin
              if ((m4.id <= m5.id) and (m4.idStrain <= m5.idStrain)) then
                begin
                  min:= m4;
                  readText(d4, m4);
                end
              else
                begin
                  min:= m5;
                  readText(d5, m5);
                end;
            end;
        end;
    end;
end;

procedure readArchive (var a: archive; var m: municipalityMaster);
begin
  if (not eof(a)) then
    read(a, m)
  else
    m.id:= highValue;
end;

procedure printMaster (var a: archive);
var
  m: municipalityMaster;
begin
  reset(a);
  readArchive(a, m);
  while (m.id <> highValue) do
    begin
      writeln(m.id,' ', m.idStrain, ' ', m.name, ' ', m.nameStrain, ' ', m.activeCases, ' ', m.newCases, ' ', m.recovered, ' ', m.deceased);
      readArchive(a, m);
    end;
  close(a);
end;

{
  Se desea modelar la información necesaria para un sistema de recuentos de casos de covid 
  para el ministerio de salud de la provincia de buenos aires. 
  Diariamente  se  reciben  archivos  provenientes  de  los  distintos  municipios,  la  información 
  contenida  en  los  mismos  es  la  siguiente:  código  de  localidad,  código  cepa,  cantidad  de 
  casos activos, cantidad de casos nuevos, cantidad de casos recuperados, cantidad de casos 
  fallecidos. 
  El ministerio cuenta con un archivo maestro con la siguiente información: código localidad, 
  nombre localidad, código cepa, nombre cepa, cantidad de casos activos, cantidad de casos 
  nuevos, cantidad de recuperados y cantidad de fallecidos. 
  Se  debe  realizar  el  procedimiento  que  permita  actualizar  el  maestro  con  los  detalles 
  recibidos,  se  reciben  10  detalles. Todos los archivos están ordenados por código de 
  localidad y código de cepa.  
  Para la actualización se debe proceder de la siguiente manera:  
  1.  Al número de fallecidos se le suman el valor de fallecidos recibido del detalle. 
  2.  Idem anterior para los recuperados. 
  3.  Los casos activos se actualizan con el valor recibido en el detalle. 
  4.  Idem anterior para los casos nuevos hallados. 
  Realice  las  declaraciones  necesarias,  el  programa  principal  y  los  procedimientos  que 
  requiera para la actualización solicitada e informe cantidad de localidades con más de 50 
  casos activos (las localidades pueden o no haber sido actualizadas).
}

var
  a: archive;
  d1, d2, d3, d4, d5: text;
  m1, m2, m3, m4, m5, min: municipality;
  mm: municipalityMaster;
  deceased, recovered, active, newCases: integer;
begin
  assign(a, 'municipiosBA.txt');
  printMaster(a);
  assign(d1, 'muni1.txt');
  assign(d2, 'muni2.txt');
  assign(d3, 'muni3.txt');
  assign(d4, 'muni4.txt');
  assign(d5, 'muni5.txt');
  // chargeArchive(a);

  reset(a);
  reset(d1);
  reset(d2);
  reset(d3);
  reset(d4);
  reset(d5);

  readText(d1, m1);
  readText(d2, m2);
  readText(d3, m3);
  readText(d4, m4);
  readText(d5, m5);

  getMin(d1, d2, d3, d4, d5, m1, m2, m3, m4, m5, min);

  while (min.id <> highValue) do
    begin
      read(a, mm);
      deceased:= 0;
      recovered:= 0;
      active:= 0;
      newCases:= 0;
      while (min.id <> mm.id) do
        read(a, mm);
      while ((min.id = mm.id) and (min.idStrain = mm.idStrain)) do
        begin
          deceased:= deceased + min.deceased;
          recovered:= recovered + min.recovered;
          active:= active + min.activeCases;
          newCases:= newCases + min.newCases;
          getMin(d1, d2, d3, d4, d5, m1, m2, m3, m4, m5, min);
        end;
      mm.deceased:= mm.deceased + deceased;
      mm.recovered:= mm.recovered + recovered;
      mm.activeCases:= active;
      mm.newCases:= newCases;
      seek(a, filepos(a) - 1);
      write(a, mm);
    end;

  close(a);
  close(d1);
  close(d2);
  close(d3);
  close(d4);
  close(d5);

  printMaster(a);
end.
