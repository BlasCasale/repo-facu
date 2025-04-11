program ejer8;
const
  highValue = 9999;
  valueToInform = 10000;
type

  province = record
    id: integer;
    population: integer;
    consumedHerb: integer;
    name: string[20];
  end;

  archive = file of province;

  survey = record
    id: integer;
    consumedHerb: integer;
  end;
{
  Se  quiere  optimizar  la  gestión  del  consumo  de  yerba  mate  en  distintas  provincias  de 
  Argentina.  Para  ello,  se  cuenta  con  un  archivo  maestro  que  contiene  la  siguiente 
  información: código de provincia, nombre de la provincia, cantidad de habitantes y cantidad 
  total de kilos de yerba consumidos históricamente.
  Cada  mes, se reciben 16 archivos de relevamiento con información sobre el consumo de 
  yerba en los distintos puntos del país. Cada archivo contiene: código de provincia y cantidad 
  de  kilos  de  yerba  consumidos  en  ese  relevamiento.  Un  archivo  de  relevamiento  puede 
  contener  información  de  una  o  varias  provincias,  y  una misma provincia puede aparecer 
  cero, una o más veces en distintos archivos de relevamiento. 
  Tanto el archivo maestro como los archivos de relevamiento están ordenados por código de 
  provincia. 
  Se  desea  realizar  un  programa  que  actualice  el  archivo  maestro  en  base  a  la  nueva 
  información  de  consumo  de  yerba.  Además,  se  debe  informar  en  pantalla  aquellas 
  provincias (código y nombre) donde la cantidad total de yerba consumida supere los 10.000 
  kilos históricamente, junto con el promedio consumido de yerba por habitante. Es importante 
  tener en cuenta tanto las provincias actualizadas como las que no fueron actualizadas. 
  Nota: cada archivo debe recorrerse una única vez.
}

procedure readMaster (var a: archive; var p: province);
begin
  if (not eof(a)) then
    read(a, p)
  else
    p.id:= highValue;
end;

procedure readText (var a: text; var s: survey);
begin
  if (not eof(a)) then
    readln(a, s.id, s.consumedHerb)
  else
    s.id:= highValue;
end;

procedure getMin (var d1, d2, d3, d4, d5: text; var s1, s2, s3, s4, s5, min: survey);
begin
  if ((s1.id <= s2.id) and (s1.id <= s3.id) and (s1.id <= s4.id) and (s1.id <= s5.id)) then
    begin
      min:= s1;
      readText(d1, s1);
    end
  else if ((s2.id <= s3.id) and (s2.id <= s4.id) and (s2.id <= s5.id)) then
    begin
      min:= s2;
      readText(d2, s2);
    end
  else if ((s3.id <= s4.id) and (s3.id <= s5.id)) then
    begin
      min:= s3;
      readText(d3, s3);
    end
  else if ((s4.id <= s5.id)) then
    begin
      min:= s4;
      readText(d4, s4);
    end
  else
    begin
      min:= s5;
      readText(d5, s5);
    end;
end;

var
  a: archive;
  d1, d2, d3, d4, d5: text;
  s1, s2, s3, s4, s5, min: survey;
  p: province;
  acc: integer;
begin
  assign(a, 'provinciasYerba.txt');
  assign(d1, 'yerba1.txt');
  assign(d2, 'yerba2.txt');
  assign(d3, 'yerba3.txt');
  assign(d4, 'yerba4.txt');
  assign(d5, 'yerba5.txt');

  reset(a);
  reset(d1);
  reset(d2);
  reset(d3);
  reset(d4);
  reset(d5);

  readText(d1, s1);
  readText(d2, s2);
  readText(d3, s3);
  readText(d4, s4);
  readText(d5, s5);

  getMin(d1, d2, d3, d4, d5, s1, s2, s3, s4, s5, min);

  readMaster(a, p);

  while (min.id <> highValue) do
    begin
      // busco con el minimo el id que coincida
      while (min.id <> p.id) do
        begin
          if (p.consumedHerb >= valueToInform) then
            writeln('ID ', p.id, ' Nombre ', p.name);
          readMaster(a, p);
        end;

      acc:= 0;

      while (min.id = p.id) do
        begin
          acc:= min.consumedHerb + acc;
          getMin(d1, d2, d3, d4, d5, s1, s2, s3, s4, s5, min);    
        end;

      p.consumedHerb:= p.consumedHerb + acc;

      if (p.consumedHerb >= valueToInform) then
        writeln('ID ', p.id, ' Nombre ', p.name);

      seek(a, filepos(a) - 1);

      write(a, p);

      readMaster(a, p);
    end;

  close(a);
  close(d1);
  close(d2);
  close(d3);
  close(d4);
  close(d5);
end.
