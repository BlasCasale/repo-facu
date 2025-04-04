program ejer3;
const
  highValue = 'ZZZZ';
type

{
  A  partir  de  información  sobre  la  alfabetización  en  la  Argentina, se necesita actualizar un 
  archivo  que  contiene  los  siguientes  datos:  nombre  de  provincia,  cantidad  de  personas 
  alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos 
  agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de 
  localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos 
  necesarios para actualizar el archivo maestro a partir de los dos archivos detalle. 
  NOTA:  Los  archivos  están  ordenados  por  nombre  de  provincia  y  en  los archivos detalle      
  pueden venir 0, 1 ó más registros por cada provincia
}
  
  report = record
    name: string[20];
    locality: integer;
    respondents: integer;
    literate: integer;
  end;

  province = record
    name: string[20];
    respondents: integer;
    literate: integer;
  end;

  master = file of province;
  detail = file of report;

procedure setProvince (var p: province);
begin
  with p do
    begin
      writeln('Nombre: ');
      readln(name);
      if(name <> highValue) then
        begin
          respondents:= 0;
          literate:= 0;
        end;
    end;
end;

procedure setReport (var p: report);
begin
  with p do
    begin
      writeln('Nombre: ');
      readln(name);
      if (name <> highValue) then
        begin
          writeln('Localidad: ');
          readln(locality);
          writeln('Respondieron: ');
          readln(respondents);
          writeln('Alfabetizados: ');
          readln(literate);
        end;
    end;
end;

procedure readProvince (var a: master; var p: province);
var
begin
  if (not eof(a)) then
    read(a, p)
  else
    p.name:= highValue;
end;

procedure readReport (var a: detail; var r: report);
begin
  if (not eof(a)) then
    read(a, r)
  else
    r.name:= highValue;
end;

procedure getMin (var d1, d2: detail; var r1, r2: report; var min: report);
begin
  if (r1.name <= r2.name) then
    begin
      min:= r1;
      readReport(d1, r1);
    end
  else
    begin
      min:= r2;
      readReport(d2, r2);
    end
end;

procedure addToReport (var d: detail);
var
  r: report;
begin
  reset(d);
  setReport(r);
  seek(d, filesize(d));
  while (r.name <> highValue) do
    begin
      write(d, r);
      setReport(r);
    end;
  close(d);
end;

procedure addProvince (var m: master);
var
  p: province;
begin
  reset(m);
  setProvince(p);
  seek(m, filesize(m));
  while (p.name <> highValue) do
    begin
      write(m, p);
      setProvince(p);
    end;
  close(m);
end;

procedure actMaster (var m: master; var d1, d2: detail);
var
  p: province;
  r1, r2, min: report;
  literate, respondents: integer;
  act: string[20];
begin
  reset(m);
  reset(d1);
  reset(d2);

  readReport(d1, r1);
  readReport(d2, r2);

  getMin(d1, d2, r1, r2, min);

  while (min.name <> highValue) do
    begin
      readProvince(m, p);

      literate:= 0;
      respondents:= 0;

      // busco la provincia que coincida con el nombre del minimo
      while (min.name <> p.name) do
        readProvince(m, p);
      
      while (min.name = p.name) do
        begin
          literate:= literate + min.literate;
          respondents:= respondents + min.respondents;
          getMin(d1, d2, r1, r2, min);
        end;
      
      p.literate:= p.literate + literate;
      p.respondents:= p.respondents + respondents;
      seek(m, filepos(m) - 1);
      write(m, p);
    end;
  
  close(m);
  close(d1);
  close(d2);
end;

begin

end.
