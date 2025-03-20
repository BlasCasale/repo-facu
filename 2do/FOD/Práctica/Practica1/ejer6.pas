program ejer6;
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

procedure option5 (var a: archive);
var
  c: cellphone;
begin
  setInfo(c);
  reset(a);
  seek(a, filesize(a));
  while (c.id <> 0) do
    begin
      write(a, c);
      setInfo(c);
    end;

  close(a);
end;

procedure option6 (var a: archive);
var
  c: cellphone;
  na: text;
begin
  assign(na, 'SinStock.txt');
  rewrite(na);
  reset(a);

  while (not eof(a)) do
    begin
      read(a, c);
      with c do
        begin
          writeln(na, id, price, brand);
          writeln(na, stock, minStock, desc);
          writeln(na, name);
        end;
    end;
  
  close(na);
  close(a);
end;

{
  Agregar al menú del programa del ejercicio 5, opciones para:
  a. Añadir uno o más celulares al final del archivo con sus datos ingresados por
  teclado.
  b. Modificar el stock de un celular dado.
  c. Exportar el contenido del archivo binario a un archivo de texto denominado:
  ”SinStock.txt”,con aquellos celulares que tengan stock 0.
  NOTA: Las búsquedas deben realizarse por nombre de celular.
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
  writeln('5) Agregar mas celulares al archivo.');
  writeln('6) Exportar los celulares sin stock.');

  case i of
    1: option1(a, na);
    2: option2(na);
    3: option3(na);
    4: option4(na);
    5: option5(a);
    6: option6(a);
  end;
end.
