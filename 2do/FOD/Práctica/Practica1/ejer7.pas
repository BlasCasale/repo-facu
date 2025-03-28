program ejer7;

type

  novel = record
    id: integer;
    price: real;
    gender: string[20];
    name: string[30];
  end;

  archive =  file of novel;
{
  Realizar un programa que permita:
  a. Crear un archivo binario a partir de la información almacenada en un archivo de texto.
  El nombre del archivo de texto es: “novelas.txt”
  b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar
  una novela y modificar una existente. Las búsquedas se realizan por código de novela.
  NOTA: La información en el archivo de texto consiste en: código de novela,
  nombre,género y precio de diferentes novelas argentinas. De cada novela se almacena la
  información en dos líneas en el archivo de texto. La primera línea contendrá la siguiente
  información: código novela, precio, y género, y la segunda línea almacenará el nombre
  de la novela.
}

procedure option1 (var a: archive);
var
  no: novel;
  t: text;
begin
  reset(a);
  assign(t, 'novelas.txt');
  reset(t);
  while (not eof(t)) do
    begin
      with no do
        begin
          read(t, id, price, gender);
          read(t, name);
          write(a, no);
        end;
    end;
end;

procedure setInfo (var n: novel);
begin
  writeln('Id: ');
  readln(n.id);
  if (n.id <> 0) then
    begin
      writeln('Precio: ');
      readln(n.price);
      writeln('Genero: ');
      readln(n.gender);
      writeln('Nombre: ');
      readln(n.name);
    end;
end;

procedure option2 (var a: archive);
var
  n: integer;
  no: novel;
begin
  writeln('1) Para agregar novelas (0 para terminar).');
  writeln('2) Para modificar novelas (por id).');
  readln(n);
  reset(a);

  if (n == 1) then
    begin
      setInfo(no);
      seek(a, filesize(a));
      while (no.id <> 0) do
        begin
          write(a, no);
          setInfo(no);
        end;
    end
  else
    begin
      writeln('Ingrese el ID a buscar: ');
      readln(n);
      while (not eof(a)) do
        begin
          read(a, no);
          if (no.id == n) then
            begin
              writeln('Ingrese el nuevo precio: ');
              readln(no.price);
              writeln('Ingrese el nuevo genero: ');
              readln(no.gender);
              writeln('Ingrese el nuevo nombre: ');
              readln(no.name);
              seek(a, filepos(a) - 1);
              write(a, no);
            end;
        end;
    end;
end;

var
  a: archive;
  n: integer;
begin
  assign(a, 'novelas.dat');
  rewrite(a);

  close(a);

  writeln('1) Crear archivo binario por medio del archivo de texto novelas.txt');
  writeln('2) Agregar o modificar novelas al archivo binario.');

  readln(n);

  if (n == 1) then
    option1(a)
  else
    option2(a);
end.
