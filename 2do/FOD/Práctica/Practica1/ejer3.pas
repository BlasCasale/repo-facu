program ejer3;

const
  cut = 'fin';
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

{
  Realizar un programa que presente un menú con opciones para:
  a. Crear un archivo de registros no ordenados de empleados y completarlo con
  datos ingresados desde teclado. De cada empleado se registra: número de
  empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
  DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
  b. Abrir el archivo anteriormente generado y
  i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
  determinado.
  ii. Listar en pantalla los empleados de a uno por línea.
  iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.
}
procedure optionA (var a: archive);
var
  e: employee;
begin
  rewrite(a);
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

  writeln('1) Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado. \n 2) Listar en pantalla los empleados de a uno por linea. \n 3) Listar en pantalla empleados mayores de 70 años, proximos a jubilarse.');

  readln(i);

  case i of 
    1: option1(a);
    2: option2(a);
    3: option3(a);
  end;
  
end;
var
  arch: archive;
  c: char;
begin
  assign(arch, 'empleados.txt');

  writeln('A) Ingresar los empleados. \n B) Listar los empleados.');
  readln(c);

  case c of
    'A', 'a': optionA(arch);
    'B', 'b': optionB(arch);
  end;

end.
