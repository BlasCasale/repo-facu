program ejer5;
type

  str20 = string[20];

  cellphone = record
    name: str20;
    id: integer;
    desc: string;
    brand: str20;
    price: real;
    minStock: integer;
    stock: integer;
  end;

  archive = file of cellphone;

procedure setInfo (var c: cellphone);
begin
  writeln('ID:');
  readln(c.id);
  if (c.id <> 0) then
    begin
      writeln('Precio:');
      readln(c.price);
      writeln('Marca:');
      readln(c.brand);
      writeln('Stock mínimo:');
      readln(c.minStock);
      writeln('Stock:');
      readln(c.stock);
      writeln('Descripcion:');
      readln(c.desc);
      writeln('Nombre:');
      readln(c.name);
    end;
end;

procedure option1 (var a: text; var na: archive);
var
  c: cellphone;
begin
  reset(a);
  reset(na);

  while (not eof(a)) do
    begin
      with c do
        begin
          readln(a, id, price, brand);
          readln(a, stock, minStock, desc);
          readln(a, name);
        end;
        write(na, c);
    end;

  close(a);
  close(na);
end;

procedure option2 (var a: archive);
var
  c: cellphone;
begin
  reset(a);

  while (not eof(a)) do
    begin
      read(a, c);
      with c do
        begin
          if (stock < minStock) then
            writeln('id ', id, ' precio ', price, ' marca ', brand, ' stock ', stock, ' minStock ', minStock, ' desc ', desc, ' nombre ', name);
            writeln(desc);
        end;
    end;

  close(a);
end;

procedure option3 (var a: archive);
var
  c: cellphone;
  s: string;
begin
  reset(a);

  writeln('Ingrese la descripcion del celular a buscar: ');
  readln(s);
  while (not eof(a)) do
    begin
      read(a, c);
      with c do
        begin
          if (s = desc) then
            writeln('id ', id, ' precio ', price, ' marca ', brand, ' stock ', stock, ' minStock ', minStock, ' desc ', desc, ' nombre ', name);
        end;
    end;

  close(a);
end;

procedure option4 (var a: archive);
var
  c: cellphone;
  t: text;
begin
  reset(a);

  assign(t, 'celulares.txt');
  rewrite(t);

  while (not eof(a)) do
    begin
      read(a, c);
      with c do
        begin
          writeln(t, id, price, brand);
          writeln(t, stock, minStock, desc);
          writeln(t, name);
        end;
    end;
  
  close(a);
  close(t);
end;
{
  Realizar un programa para una tienda de celulares, que presente un menú con
  opciones para:
  a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
  ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
  correspondientes a los celulares, deben contener: código de celular, el nombre,
  descripcion, marca, precio, stock mínimo y el stock disponible.
  b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
  stock mínimo.
  c. Listar en pantalla los celulares del archivo cuya descripción contenga una
  cadena de caracteres proporcionada por el usuario.
  d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
  “celulares.txt”con todos los celulares del mismo.
  NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el usuario
  una única vez.
  NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique en
  tres líneas consecutivas: en la primera se especifica: código de celular, el precio y
  marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera
  nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo
  “celulares.txt”.
}

var
  a: text;
  na: archive;
  c: cellphone;
  s: str20;
  i: integer;
begin
  assign(a, 'celulares.txt');
  writeln('Ingrese el nombre del archivo: ');
  readln(s);
  assign(na, s + '.txt');

  writeln('1) Para exportar el contenido de celulares al nuevo archivo.');
  writeln('2) Para listar los celulares sin stock.');
  writeln('3) Para buscar un celular por su descripcion.');
  writeln('4) Para exportar el contenido del nuevo archivo a celulares.txt');

  case i of
    1: option1(a, na);
    2: option2(na);
    3: option3(na);
    4: option4(na);
  end;
end.
