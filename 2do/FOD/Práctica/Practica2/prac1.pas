program ejer1;
const
  cut = 0;
type

  employee = record
    id: integer;
    name: string[20];
    earnings: real;
  end;

  archive = file of employee;

procedure setInfo (var e: employee);
begin
  with e do
    begin
      writeln('ID');
      readln(id);
      if (id <> cut) then
        begin
          writeln('Nombre');
          readln(name);
          writeln('Comisiones');
          readln(earnings);
        end;
    end;
end;
{
  Una empresa posee un archivo con información de los ingresos percibidos por diferentes
  empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
  nombre y monto de la comisión. La información del archivo se encuentra ordenada por
  código de empleado y cada empleado puede aparecer más de una vez en el archivo de
  comisiones.
  Realice un procedimiento que reciba el archivo anteriormente descripto y lo compacte. En
  consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
  única vez con el valor total de sus comisiones.
  NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
  recorrido una única vez.
}

procedure readArchive (var a: archive; var e: employee);
begin
  if (not eof(a)) then
    read(a, e)
  else
    e.id := cut;
end;

procedure addEmploye (var a: archive);
var
  e: employee;
begin
  reset(a);
  setInfo(e);

  seek(a, filesize(a));
  while (e.id <> cut) do
    begin
      write(a, e);
      setInfo(e);
    end;

  close(a);
end;

procedure printArchive(var a: archive);
var
  e: employee;
begin
  reset(a);
  while (not eof(a)) do
    begin
      read(a, e);
      with e do
        writeln('ID ', id, ' comision ', earnings:0:2, ' nombre ', name);
    end;
  close(a);
end;

procedure copyArchive (var a, na: archive);
var
  e, newE: employee;
  name: string;
  act: integer;
  acc: real;
begin
  reset(a);
  reset(na);
  readArchive(a, e);
  while (e.id <> cut) do
    begin
      act:= e.id;
      acc:= 0;
      name:= e.name;
      while ((e.id <> cut) and (e.id = act)) do
        begin
          acc:= e.earnings + acc;
          readArchive(a, e);
        end;
      newE.id:= act;
      newE.name:= name;
      newE.earnings:= acc;
      write(na, newE);
    end;
  
  close(a);
  close(na);
end;

var
  a, na: archive;
  i: integer;
begin
  assign(a, 'detalleComision.txt');
  assign(na, 'resumenComision.txt');

  // rewrite(a);
  // rewrite(na);

  writeln('1) Agregar empleado con su comision.');
  writeln('2) Imprimir listado de detalle de empleados.');
  writeln('3) Imprimir listado del resumen de los empleados.');
  writeln('4) Hacer copia del archivo de detalle a un resumen.');

  readln(i);

  case i of
    1: addEmploye(a);
    2: printArchive(a);
    3: printArchive(na);
    4: copyArchive(a, na);
  end;
end.
