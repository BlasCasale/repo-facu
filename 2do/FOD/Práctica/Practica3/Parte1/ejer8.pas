program ejer8;
const
  highValue = 'ZZZZ';
type

  linux = record
    name: string[20];
    year: integer;
    version: string[10];
    developers: integer;
    desc: string[30];
  end;

  archive = file of linux;

procedure readArchive (var a: archive; var l: linux);
begin
  if (not eof(a)) then
    read(a, l)
  else
    l.name:= highValue;
end;

function searchDistribution (var a: archive; name: string): integer;
var
  l: linux;
  i: integer;
begin
  reset(a);
  readArchive(a, l);

  while ((l.name <> highValue) and (l.name <> name)) do
    readArchive(a, l);

  if (l.name = name) then
    i:= filepos(a) - 1
  else
    i:= -1;
  
  close(a);

  searchDistribution:= i;
end;

procedure createRegister (var a: archive; l: linux);
var
  aux: linux;
  i: integer;
begin
  reset(a);
  readArchive(a, aux);

  i:= searchDistribution(a, l.name);

  if (aux.name = highValue) then
    begin
      aux.developers:= 0;
      seek(a, 0);
      write(a, aux);
      write(a, l);
    end
  else
    begin
      if (i = -1) then
        writeln('Ya existe la distribucion.')
      else
        begin
          if (aux.developers = 0) then
            begin
              seek(a, filesize(a) - 1);
              write(a, l);
            end
          else
            begin
              i:= aux.developers * (-1);
              seek(a, i);
              read(a, aux);
              seek(a, i);
              write(a, l);
              seek(a, 0);
              write(a, aux);
            end;
        end;
    end;
  
  close(a);
end;

procedure deleteRegister (var a: archive; name: string);
var
  rc, aux: linux;
  i: integer;
begin
  i:= searchDistribution(a, name);
  if (i = -1) then
    writeln('No existe la distribucion con nombre ', name)
  else
    begin
      reset(a);
      readArchive(a, rc);
      seek(a, i);
      read(a, aux);
      seek(a, i);
      aux.developers:= filepos(a) * (-1);
      write(a, rc);
      seek(a, 0);
      write(a, aux);
      close(a);
    end;
end;
{
  Se cuenta con un archivo con información de las diferentes distribuciones de linux 
  existentes. De cada distribución se conoce: nombre, año de lanzamiento, número de 
  versión  del  kernel,  cantidad  de  desarrolladores  y  descripción.  El  nombre  de  las 
  distribuciones no puede repetirse. Este archivo debe ser mantenido realizando bajas 
  lógicas y utilizando la técnica de reutilización de espacio libre llamada lista invertida. 
  Escriba  la  definición  de  las  estructuras  de  datos  necesarias  y  los  siguientes 
  procedimientos: 
  a.  BuscarDistribucion:  módulo  que  recibe  por  parámetro  el  archivo,  un 
  nombre de distribución y devuelve la posición dentro del archivo donde se 
  encuentra  el registro correspondiente a la distribución dada (si existe) o 
  devuelve -1 en caso de que no exista.. 
  b.  AltaDistribucion: módulo que recibe como parámetro el archivo y el registro 
  que contiene los datos de una nueva distribución, y se encarga de agregar 
  la distribución   al archivo reutilizando espacio disponible en caso de que 
  exista. (El control de unicidad lo debe realizar utilizando el módulo anterior). 
  En caso de que la distribución que se quiere agregar ya exista se debe 
  informar “ya existe la distribución”. 
  c.  BajaDistribucion:  módulo  que  recibe  como  parámetro  el  archivo  y  el 
  nombre de una distribución, y se encarga de dar de baja lógicamente la 
  distribución  dada.  Para  marcar una distribución como borrada se debe 
  utilizar el campo cantidad de desarrolladores para mantener actualizada 
  la lista invertida. Para verificar que la distribución a borrar exista debe utilizar 
  el  módulo  BuscarDistribucion.  En  caso  de  no  existir  se  debe  informar 
  “Distribución no existente”.
}
var

begin

end.
