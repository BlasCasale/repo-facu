program ejer7;
const
  highValue = 9999;
type

  bird = record
    id: integer;
    name: string[30];
    family: string[15];
    des: string[20];
    zone: string[15];
  end;

procedure readArchive (var a: archive; var b: bird);
begin
  if (not eof(a)) then
    read(a, b)
  else
    b.id:= highValue;
end;

procedure deleteBird (var a: archive; id: integer);
var
  b: bird;
  deleted: boolean;
begin
  reset(a);
  readArchive(a, b);
  deleted:= false;
  while ((b.id <> highValue) and (not deleted)) do
    begin
      if (id = b.id) then
        begin
          b.id:= b.id * (-1);
          seek(a, filepos(a) - 1);
          write(a, b);
          deleted:= true;  
        end;
      readArchive(a, b);
    end;

  close(a);
end;

procedure compactArchive (var a: archive);
var
  b: bird;
  i, last: integer;
begin
  reset(a);
  readArchive(a, b);
  last:= filesize(a) - 1;
  i:= 0;
  while (i < last) do
    begin
      if (b.id < 0) then
        begin
          seek(a, last);
          readArchive(a, b);
          if (b.id < 0) then
            begin
              while (b.id < 0) do
                begin
                  last:= last - 2;
                  readArchive(a, b);
                end;
            end;
          seek(a, i);
          write(a, b);
        end;
      i:= filepos(a);
      readArchive(a, b);
    end;

  seek(a, last);
  truncate(a);
  close(a);
end;
{
  Se cuenta con un archivo que almacena información sobre especies de aves en vía 
  de extinción, para ello se almacena: código, nombre de la especie, familia de ave, 
  descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice 
  un  programa  que  permita  borrar  especies  de  aves  extintas.  Este  programa  debe 
  disponer de dos procedimientos:  
  a.  Un procedimiento que dada una especie de ave (su código) marque la misma 
  como borrada (en caso de querer borrar múltiples especies de aves, se podría 
  invocar este procedimiento repetidamente). 
  b.  Un  procedimiento  que  compacte  el  archivo,  quitando  definitivamente  las 
  especies de aves marcadas como borradas.  Para quitar los registros se deberá 
  copiar el último registro del archivo en la posición del registro a borrar y luego 
  eliminar del archivo el último registro de forma tal de evitar registros duplicados.  
  i.  Implemente una variante de este procedimiento de compactación del 
  archivo (baja física) donde el archivo se trunque una sola vez.
}
var

begin

end.
