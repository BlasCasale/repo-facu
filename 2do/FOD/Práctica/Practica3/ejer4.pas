program ejer4;
const
  highValue = 9999;
type

  flower = record
    name: string[45];
    id: integer;
  end;

  archive = file of flower;

procedure readArchive (var a: archive; var f: flower);
begin
  if (not eof(a)) then
    read(a, f)
  else
    f.id:= highValue;
end;

procedure deleteRegister (var a: archive; id: integer);
var
  f: flower;
  i, rc: integer;
begin
  reset(a);
  readArchive(a, f);
  rc:= f.id;
  while ((f.id <> highValue) and (f.id <> id)) do
    readArchive(a, f);
  if (f.id = id) then
    begin
        seek(a, filepos(a) - 1);
        i:= filepos(a);
        f.id:= rc;
        write(a, f);
        seek(a, 0);
        f.id:= i * (-1);
        write(a, f);
        writeln('Se elimino el registro correctamente.');
    end
  else
    writeln('No se encontro el registro con id ', id);
end;

procedure setInfo (var f: flower);
begin
  writeln('ID (0 para cortar)');
  readln(f.id);
  if (f.id <> 0) then
    begin
      writeln('Nombre');
      readln(f.name);
    end;
end;

procedure addFlower (var a: archive; f: flower);
var
  r: flower;
  rc: integer;
begin
  reset(a);
  readArchive(a, r);

  if (r.id = highValue) then
    begin
      seek(a, 0);
      r.id:= 0;
      write(a, r);
      write(a, f);
    end
  else
    begin
      if (r.id = 0) then
        begin
          seek(a, filesize(a));
          write(a, f);
        end
      else
        begin
          rc:= r.id * (-1);
          seek(a, rc);
          read(a, r);
          rc:= r.id;
          seek(a, filepos(a) - 1);
          write(a, f);
          seek(a, 0);
          r.id:= rc;
          write(a, r);
        end;
    end;
  close(a);
end;

procedure printArchive (var a: archive);
var
  f: flower;
begin
  reset(a);
  readArchive(a, f);
  while (f.id <> highValue) do
    begin
      if (f.id > 0) then
        writeln('ID ', f.id , ' nombre ', f.name);
      readArchive(a, f);
    end;
  close(a);
end;
{
  Dada la siguiente estructura:  
       type 
         reg_flor = record 
          nombre: String[45]; 
          codigo: integer; 
        end; 
  
        tArchFlores = file of reg_flor; 
  Las  bajas  se  realizan  apilando  registros  borrados  y  las  altas  reutilizando  registros 
  borrados.  El  registro  0  se  usa  como  cabecera  de  la  pila  de  registros  borrados: el 
  número 0 en el campo código implica que no hay registros borrados y -N indica que el 
  próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.  
  a. Implemente el siguiente módulo: 
  Abre  el  archivo  y  agrega  una  flor,  recibida  como  parámetro 
  manteniendo la política descrita anteriormente
  procedure  agregarFlor  (var  a:  tArchFlores  ;  nombre:  string; 
  codigo:integer); 
  b.  Liste  el  contenido  del  archivo  omitiendo  las  flores eliminadas. Modifique lo que 
  considere necesario para obtener el listado.
}
var
  a: archive;
  f: flower;
  i, id: integer;
begin
  assign(a, 'flores.txt');
  
  repeat
    writeln('1) Crear registro en el archivo.');
    writeln('2) Eliminar registro del archivo.');
    writeln('3) Listar registros no eliminados.');
    writeln('0) Terminar programa.');
    readln(i);

    case i of
      1:
        begin
          setInfo(f);
          while (f.id <> 0) do
            begin
              addFlower(a, f);
              setInfo(f);
            end;
        end;
      2:
        begin
          writeln('Ingrese el ID del registro a eliminar.');
          readln(id);
          deleteRegister(a, id);
        end;
      3: printArchive(a);
    end;
  until i = 0;
end.
