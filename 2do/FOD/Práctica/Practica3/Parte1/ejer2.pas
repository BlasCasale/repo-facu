program ejer2;
const
  highValue = 9999;
  less = 1000;
type

  assistant = record
    id: integer;
    cellphone: integer;
    dni: integer;
    mail: string[20];
    fullname: string[30];
  end;

  archive = file of assistant;

procedure readText (var t: text; var a: assistant);
begin
  if (not eof(t)) then
    begin
      readln(t, a.id, a.cellphone, a.dni, a.mail);
      readln(t, a.fullname);
    end
  else
    a.id:= highValue;
end;

procedure readArchive (var a: archive; var ass: assistant);
begin
  if (not eof(a)) then
    read(a, ass)
  else
    ass.id:= highValue;
end;

procedure createBinary (var a: archive; var t: text);
var
  ass: assistant;
begin
  rewrite(a);
  reset(t);
  readText(t, ass);

  while (ass.id <> highValue) do
    begin
      write(a, ass);
      readText(t, ass);
    end;

  close(a);
  close(t);
end;

procedure printArchive (var a: archive);
var
  ass: assistant;
begin
  reset(a);
  readArchive(a, ass);
  while (ass.id <> highValue) do
    begin
      writeln('id ', ass.id, ' nombre ', ass.fullname, ' mail ', ass.mail);
      readArchive(a, ass);
    end;

  close(a);
end;

procedure deleteLog (var a: archive);
var
  ass: assistant;
  c: char;
begin
  reset(a);
  readArchive(a, ass);
  while (ass.id <> highValue) do
    begin
      if (ass.id < less) then
        begin
          c:= '!';
          ass.fullname:= c + ass.fullname;
          seek(a, filepos(a) - 1);
          write(a, ass);
        end;
      readArchive(a, ass);
    end;
  close(a);
end;
{
  Definir un programa que genere un archivo con registros de longitud fija conteniendo 
  información  de  asistentes  a  un  congreso  a  partir  de  la  información  obtenida  por 
  teclado. Se deberá almacenar la siguiente información: nro de asistente, apellido y 
  nombre,  email,  teléfono  y  D.N.I.  Implementar  un  procedimiento  que,  a  partir  del 
  archivo de datos generado, elimine de forma lógica todos los asistentes con nro de 
  asistente inferior a 1000.  
  Para ello se podrá utilizar algún carácter especial situándolo delante de algún campo 
  String a su elección.  Ejemplo:  ‘@Saldaño’. 
}
var
  a: archive;
  t: text;
begin
  assign(a, 'asistentesCongreso.txt');
  assign(t, 'asistentesTex.txt');

  // createBinary(a, t);
  printArchive(a);

  deleteLog(a);
  
  printArchive(a);
end.
