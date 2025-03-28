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
procedure addEmploye (var a: archive);
var
  ant, act, e: employee;
begin
  reset(a);
  setInfo(e);

  while (e.id <> cut) do
    begin
      if (not eof(a)) then
        begin
          read(a, act);
          while (e.id < act.id) do
            begin
              ant:= act;
              read(a, act);
            end;
          seek(a, filepos(a) - 1);
          write(a, e);
          while (not eof(a)) do
            begin
              read(a, ant);
              seek(a, filepos(a) - 1);
              write(a, act);
            end;
        end
      else
        write(a, e);

      setInfo(e);
    end;
end;
var

begin

end.
