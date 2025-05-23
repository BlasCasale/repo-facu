program ejer4;
const
  cut = 'fin';
  highValue = 9999;
type

  str20 = string[20];

  employee = record
    lastname: str20;
    name: str20;
    id: integer;
    age: integer;
    dni: integer;
  end;

  archive = file of employee;

procedure readArchive (var a: archive; var e: employee);
begin
  if (not eof(a)) then
    read(a, e)
  else
    e.id:= highValue;
end;

procedure setInfo (var e: employee);
begin
  writeln('Apellido:');
  readln(e.lastname);
  if (e.lastname <> cut) then
    begin
      writeln('Nombre:');
      readln(e.name);
      writeln('ID:');
      readln(e.id);
      writeln('Edad:');
      readln(e.age);
      writeln('DNI:');
      readln(e.dni);
    end;
end;

procedure optionA (var a: archive);
var
  e: employee;
begin
  reset(a);
  seek(a, filesize(a));
  setInfo(e);
  while (e.lastname <> cut) do
    begin
      write(a, e);
      setInfo(e);
    end;
  close(a);
end;

procedure option1 (var a: archive);
var
  e: employee;
  stri: str20;
begin
  writeln('Ingrese el nombre o apellido que quiere filtrar: ');
  readln(stri);
  reset(a);
  while (not eof(a)) do
    begin
      read(a, e);
      if ((e.name = stri) or (e.lastname = stri)) then
        writeln('A:', e.lastname, ' N: ', e.name, ' I: ', e.id, ' E: ', e.age, ' D: ', e.dni);
    end;
  close(a);
end;

procedure option2 (var a: archive);
var
  e: employee;
begin
  reset(a);
  while (not eof(a)) do
    begin
      read(a, e);
      writeln('A:', e.lastname, ' N: ', e.name, ' I: ', e.id, ' E: ', e.age, ' D: ', e.dni);
    end;
  close(a);
end;

procedure option3 (var a: archive);
var
  e: employee;
begin
  reset(a);

  while (not eof(a)) do
    begin
      read(a, e);
      if (e.age > 70) then
        writeln('A:', e.lastname, ' N: ', e.name, ' I: ', e.id, ' E: ', e.age, ' D: ', e.dni);
    end;

  close(a);
end;

procedure optionB (var a: archive);
var
  i: integer;
begin

  writeln('1) Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado.');
  writeln('2) Listar en pantalla los empleados de a uno por linea.');
  writeln('3) Listar en pantalla empleados mayores de 70 años, proximos a jubilarse.');
  readln(i);

  case i of 
    1: option1(a);
    2: option2(a);
    3: option3(a);
  end;
  
end;

procedure optionC (var a: archive);
var
  e: employee;
begin
  setInfo(e);
  reset(a);
  while (e.lastname <> cut) do
    begin
      seek(a, filesize(a));
      write(a, e);
      setInfo(e);
    end;
  close(a);
end;

procedure optionD (var a: archive);
var
  e: employee;
  num: integer;
begin
  writeln('Ingrese el ID del empleado que quiere modificarle la edad: ');
  readln(num);
  reset(a);
  while (not eof(a)) do
    begin
      read(a, e);
      if (e.id = num) then
        begin
          writeln('Ingrese la nueva edad: ');
          readln(num);
          e.age:= num;
          seek(a, filepos(a) - 1);
          write(a, e);
        end;
      setInfo(e);
    end;
  close(a);
end;

procedure optionE (var a: archive);
var
  e: employee;
  na: archive;
begin
  assign(na, 'todos_empleados.txt');
  rewrite(na);
  reset(a);

  while (not eof(a)) do
    begin
      read(a, e);
      write(na, e);
    end;

  close(na);
  close(a);
end;

procedure optionF (var a: archive);
var
  e: employee;
  na: archive;
begin
  assign(na, 'faltaDNIEmpleado.txt');
  rewrite(na);

  reset(a);

  while (not eof(a)) do
    begin
      read(a, e);
      if (e.dni <> 0) then
        write(na, e);        
    end;
  
  close(a);
  close(na);
end;

procedure optionG (var a: archive);
var
  e: employee;
  i, id: integer;
begin
  reset(a);
  writeln('Ingrese el ID a buscar');
  readln(id);
  readArchive(a, e);
  while ((e.id <> highValue) and (e.id <> id)) do
    readArchive(a, e);
  
  if (e.id = id) then
    begin
      if (filepos(a) = filesize(a) -1) then
        seek(a, filepos(a) - 1)
      else
        begin
          i:= filepos(a) - 1;
          seek(a, filesize(a) - 1);
          read(a, e);
          seek(a, i);
          write(a, e);
          seek(a, filesize(a) - 1);   
        end;
      truncate(a);
    end;
  close(a);
end;

{
  Modificar  el  ejercicio  4  de  la  práctica  1  (programa  de  gestión  de  empleados), 
  agregándole una opción para realizar bajas copiando el último registro del archivo en 
  la posición del registro a borrar y luego truncando el archivo en la posición del último 
  registro de forma tal de evitar duplicados.
}

var
  arch, newA: archive;
  c: char;
  e: employee;
begin
  assign(arch, 'empleados.txt');

  writeln('A) Ingresar los empleados.');
  writeln('B) Listar los empleados.');
  writeln('C) Aniadir una o mas empleados.');
  writeln('D) Modificar edad a una o mas empleados.');
  writeln('E) Exportar el archivo.');
  writeln('F) Exportar a un archivo los empleados sin DNI (00).');
  writeln('G) Eliminar un registro por ID.');
  readln(c);

  case c of
    'A', 'a': optionA(arch);
    'B', 'b': optionB(arch);
    'C', 'c': optionC(arch);
    'D', 'd': optionD(arch);
    'E', 'e': optionE(arch);
    'F', 'f': optionF(arch);
    'G', 'g': optionG(arch);
  end;

end.

