program nombrePrograma;
{
  1) leer legajos y promedios hasta que se envie el legajo -1
  2) informar la cantidad de alumnos leida
  3) informar los que tengan mas de 6.5
  4) informar el porcentaje de alumnos que tengan mas de 6.5 y que su legajo sea menor a 2500
}
const
  legValid= 2500;
  promValid= 6.5;
var
  leg, cantAluTot, cantAluProm, cantAluLeg: integer;
  prom, por, min, max: real;
begin
  cantAluTot:= 0;
  cantAluLeg:= 0;
  cantAluProm:= 0;
  min:= 0;
  max:= 10;
  write('Ingrese su numero de legajo: ');
  read(leg);
  while (leg <> -1) do
    begin
      write('Ingrese su promedio: ');
      read(prom);
      { despues deberia mirar porque no funciona este while }
      while ((prom < min) or (prom > max)) do
        begin
          write('Por favor ingrese un promedio valido: ');
          read(prom);
        end;
      cantAluTot:= cantAluTot+1;
      if (prom >= promValid) then
        cantAluProm:= cantAluProm + 1;
      if ((prom >= promValid) and (leg <= legValid)) then
        cantAluLeg:= cantAluLeg + 1;
      write('Por favor ingrese otro legajo: ');
      read(leg);
    end;
  por:= (cantAluLeg * 100) / cantAluTot;
  writeln('La cantidad total de alumnos ingresada es de ', cantAluTot);
  writeln('La cantidad de alumnos con mas de 6.5 de promedio son ', cantAluProm);
  writeln('El porcentaje de alumnos con mas de 6.5 de promedio y con legajo menor a 2500 es %', por:0:2);
end.
