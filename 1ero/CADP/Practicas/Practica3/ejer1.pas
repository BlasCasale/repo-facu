program Registros;
{
  leer la info de los alumnos
  el alumno 0 no debe procesarse
}
type
  str20 = string[20];
  alumno = record
    codigo : integer;
    nombre : str20;
    promedio : real;
  end;
procedure leer(var alu : alumno);
begin
  writeln('Ingrese el código del alumno');
  read(alu.codigo);
  if (alu.codigo <> 0) then 
  begin
    writeln('Ingrese el nombre del alumno'); 
    read(alu.nombre);
    writeln('Ingrese el promedio del alumno'); 
    read(alu.promedio);
  end;
end;
procedure getProm (var prom: real; var betterProm: real; name: str20; var betterName: str20);
begin
  if (prom >= betterProm) then
    begin
      betterName:= name;
      betterProm:= prom;
    end;
end;
var
  a: alumno;
  betterName: str20;
  counter: integer;
  betterProm: real;
begin
  leer(a);
  betterProm:= -1;
  while (a.codigo <> 0) do
    begin
      getProm(a.promedio, betterProm, a.nombre, betterName);
      counter:= counter + 1;
      leer(a);
    end;
  writeln('La cantidad de alumnos leidos son ', counter);
  writeln('El alumno con mayor promedio es ', betterName);
end.