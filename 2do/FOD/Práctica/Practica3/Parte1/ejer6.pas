program ejer6;
const
  highValue = 9999;
type

  garment = record
    id: integer;
    des: string[30];
    colour: string[15];
    kind: string[10];
    stock: integer;
    price: real;
  end;

  archive = file of garment;

procedure setInfo (var g: garment);
begin
  writeln('ID');
  readln(g.id);
  if (g.id <> 0) then
    begin
      writeln('Descripcion');
      readln(d.des);
      writeln('Colour');
      readln(d.colour);
      writeln('Tipo de prenda');
      readln(d.kind);
      writeln('Stock');
      readln(g.stock);
      writeln('Precio');
      readln(g.price);
    end;
end;

procedure readArchive (var a: archive; var g: garment);
begin
  if (not eof(a)) then
    read(a, g)
  else
    g.id:= highValue;
end;

procedure readText (var t: text; var n: integer);
begin
  if (not eof(t)) then
    readln(t, n)
  else
    n:= highValue;
end;

procedure doDrops (var a: archive; var t: text);
var
  g: garment;
  n: integer;
begin
  reset(a);
  reset(t);

  readArchive(a, g);
  readText(t, n);

  while (n <> highValue) do
    begin
      while (n <> g.id) do
        readArchive(a, g);

      if (n = g.id) then
        begin
          g.stock:= g.stock * (-1);
          seek(a, filepos(a) - 1);
          write(a, g);
        end;
      
      readText(t, n);
      seek(a, 0);
    end;
end;

procedure chargeArchive (var a: archive);
var
  g: garment;
begin
  reset(a);
  setInfo(g);
  seek(a, filesize(a));
  while (g.id <> 0) do
    begin
      write(a, g);
      setInfo(g);
    end;
  close(a);
end;

procedure compactArchive (var a: archive);
var
  g: garment;
  na: archive;
begin
  reset(a);
  assign(na, 'nuevasPrendas.txt');
  rewrite(na);

  readArchive(a, g);

  while (g.id <> highValue) do
    begin
      if (g.stock >= 0) then
        write(na, g);
      readArchive(a, g);
    end;
  
  rename(a, 'viejasPrendas.txt');
  rename(na, 'prendas.txt');
end;
{
  Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con 
  la información correspondiente a las prendas que se encuentran a la venta. De cada 
  prenda  se  registra:  cod_prenda,  descripción,  colores,  tipo_prenda,  stock  y 
  precio_unitario.  Ante  un  eventual  cambio  de  temporada,  se  deben  actualizar  las 
  prendas  a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las 
  prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba 
  ambos archivos y  realice la baja lógica de las prendas, para ello deberá modificar el 
  stock de la prenda correspondiente a valor negativo. 
  Adicionalmente,  deberá  implementar  otro  procedimiento  que  se  encargue  de 
  efectivizar  las  bajas  lógicas  que  se  realizaron  sobre  el  archivo  maestro  con  la 
  información  de  las  prendas  a  la  venta.  Para  ello  se deberá utilizar una estructura 
  auxiliar (esto es, un archivo nuevo),  en el cual se copien únicamente aquellas prendas 
  que no están marcadas como borradas. Al finalizar este proceso de compactación 
  del archivo, se deberá renombrar el archivo nuevo con el nombre del archivo maestro 
  original.
}
var
  a: archive;
  t: text;
  i: integer;
begin
  asssign(a, 'prendas.txt');
  assign(t, 'bajasPrendas.txt');

  repeat
    writeln('1) Cargar el achivo.');
    writeln('2) Dar de baja las prendas que ya no se venderan.');
    writeln('0) Para terminar el programa.');
    readln(i);

    case i of
      1: chargeArchive(a);
      2:
        begin
          doDrops(a, t);
          compactArchive(a);
        end;
    writeln('');
    writeln('');
    end;
  until i = 0;

end.
