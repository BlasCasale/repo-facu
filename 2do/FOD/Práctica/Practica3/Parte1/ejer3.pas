program ejer3;
const
  highValue = 9999;
  cut = 0;
type

  novel = record
    id: integer;
    gender: string[10];
    name: string[20];
    director: string[20];
    duration: integer;
    price: real;
  end;

  archive = file of novel;

procedure setInfo (var n: novel);
begin
  writeln('ID: (corte con 0)');
  readln(n.id);
  if (n.id <> cut) then
    begin
      writeln('Nombre:');
      readln(n.name);
      writeln('Genero:');
      readln(n.gender);
      writeln('Director:');
      readln(n.director);
      writeln('Duracion:');
      readln(n.duration);
      writeln('Precio:');
      readln(n.price);
    end;
end;

procedure readArchive (var a: archive; var n: novel);
begin
  if (not eof(a)) then
    read(a, n)
  else
    n.id:= highValue;
end;

procedure deleteRegister (var a: archive; id: integer);
var
  n: novel;
  rc, i: integer;
begin
  reset(a);

  readArchive(a, n);

  rc:= n.id;

  while ((n.id <> highValue) and (n.id <> id)) do
    readArchive(a, n);

  if ((n.id = id) and (n.id <> highValue)) then
    begin
      if (rc = 0) then
        begin
          n.id := 0;
          seek(a, filepos(a) - 1);
          i:= filepos(a);
          write(a, n);
          seek(a, 0);
          n.id:= i * (-1);
          write(a, n);
        end
      else
        begin
          seek(a, filepos(a) - 1);
          n.id:= rc;
          i:= filepos(a);
          write(a, n);
          seek(a, 0);
          n.id:= i * (-1);
          write(a, n);
        end;
      writeln('Se elimino correctamente el registro.');
    end
  else
    writeln('No se ha encontrado el registro buscado.');

  close(a);
end;

procedure addNovel (var a: archive; n: novel);
var
  nn: novel;
  rc: integer;
begin
  reset(a);
  readArchive(a, nn);
  if (nn.id = highValue) then
    begin
      nn.id:= 0;
      seek(a, 0);
      write(a, nn);
      write(a, n);
    end
  else
    begin
      rc:= nn.id * (-1);
      if (nn.id = 0) then
        begin
          seek(a, filesize(a));
          write(a, n);
        end
      else
        begin
          seek(a, rc);
          read(a, nn);
          seek(a, rc);
          write(a, n);
          seek(a, 0);
          write(a, nn);
        end;
    end;
  close(a);
end;

procedure addNovels (var a: archive);
var
  n: novel;
begin
  setInfo(n);
  while (n.id <> cut) do
    begin
      addNovel(a, n);
      setInfo(n);
    end;
end;

procedure updateRegister (var a: archive; id: integer);
var
  n: novel;
begin
  reset(a);
  readArchive(a, n);
  while ((n.id <> highValue) and (n.id <> id)) do
    readArchive(a, n);

  if (n.id = id) then
    begin
      writeln('Nuevo genero');
      readln(n.gender);
      writeln('Nuevo nombre');
      readln(n.name);
      writeln('Nueva duracion');
      readln(n.duration);
      writeln('Nuevo director');
      readln(n.director);
      writeln('Nuevo precio');
      readln(n.price);
      seek(a, filepos(a) - 1);
      write(a, n);
      writeln('Registro actualizado');
    end
  else
    writeln('No se encontro la novela con el id ', id);
  close(a);
end;

procedure createText (var a: archive);
var
  t: text;
  n: novel;
begin
  assign(t, 'novelas.txt');
  rewrite(t);
  reset(a);
  readArchive(a, n);
  while (n.id <> highValue) do
    begin
      writeln(t, n.id, ' ', n.gender);
      writeln(t, n.duration, ' ', n.name);
      writeln(t, n.price:0:2, ' ', n.director);
      readArchive(a, n);
    end;

  close(a);
  close(t);
end;
{
  Realizar un programa que genere un archivo de novelas filmadas durante el presente 
  año. De cada novela se registra: código, género, nombre, duración, director  y precio. 
  El programa debe presentar un menú con las siguientes opciones: 
  a.  Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se 
  utiliza  la  técnica  de  lista  invertida  para  recuperar  espacio  libre  en  el 
  archivo.  Para ello, durante la creación del archivo, en el primer registro del 
  mismo  se  debe  almacenar  la  cabecera  de  la  lista.  Es decir un registro 
  ficticio,  inicializando  con  el  valor  cero  (0)  el  campo correspondiente al 
  código  de  novela,  el  cual  indica  que  no  hay  espacio  libre  dentro  del 
  archivo. 
  b.  Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el 
  inciso  a),  se  utiliza  lista  invertida  para  recuperación  de  espacio.  En 
  particular,  para  el campo de “enlace”   de la lista (utilice el código de 
  novela  como  enlace),  se  debe  especificar  los  números  de  registro 
  referenciados  con  signo  negativo,  .  Una  vez  abierto  el  archivo, brindar 
  operaciones para: 
  i.  Dar de alta una novela leyendo la información desde teclado. Para 
  esta  operación,  en  caso  de  ser  posible,  deberá  recuperarse  el 
  espacio libre. Es decir, si en el campo correspondiente al código de 
  novela del registro cabecera hay un valor negativo, por ejemplo -5, 
  se debe leer el registro en la posición 5, copiarlo en la posición 0 
  (actualizar la lista de espacio libre) y grabar el nuevo registro en la 
  posición 5. Con el valor 0 (cero) en el registro cabecera se indica 
  que no hay espacio libre.    
  ii.  Modificar  los  datos  de una novela leyendo la información desde 
  teclado. El  código de novela no puede ser modificado. 
  iii.  Eliminar  una  novela  cuyo  código  es  ingresado  por  teclado.  Por 
  ejemplo, si se da de baja un registro en la posición 8, en el campo 
  código de novela del registro cabecera deberá figurar -8, y en el 
  registro en la posición 8 debe copiarse el antiguo registro cabecera. 
  c.  Listar en un archivo de texto todas las novelas, incluyendo las borradas, que 
  representan la lista de espacio libre. El archivo debe llamarse “novelas.txt”. 
  NOTA:  Tanto  en  la creación como en la apertura el nombre del archivo debe ser 
  proporcionado por el usuario
}
var
  a: archive;
  s: string[20];
  i, id: integer;
begin
  writeln('Ingrese el nombre del archivo de novelas: ');
  readln(s);
  assign(a, s + '.txt');
  rewrite(a);

  repeat
    writeln('1) Crear nuevos registros.');
    writeln('2) Borrar registros (busqueda por id).');
    writeln('3) Actualizar registros (busqueda por id).');
    writeln('4) Crear un archivo de texto con el archivo de novelas.');
    writeln('Terminar programa ingresando 0.');
    readln(i);
    
    case i of
      1: addNovels(a);
      2: 
        begin
          writeln('Ingrese el id a eliminar: ');
          readln(id);
          deleteRegister(a, id);
        end;
      3: 
        begin
          writeln('Ingrese el id de la novela a actualizar: ');
          readln(id);
          updateRegister(a, id);
        end;
      4: createText(a);
    end;
  until i = 0;

end.
