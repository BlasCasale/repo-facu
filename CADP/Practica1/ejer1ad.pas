program nombrePrograma;
const
  cut = 100;
  k50 = 50000;
var
  id, i, inverTot, idMax, more50: integer;
  inver, prom, maxInver, sum: real;
begin
  {monto promedio de inversiones por empresa, el id de la empresa con mas inversiones, empresas con mas de 50k de inver}
  {tambien informar cada inversion, su cantidad de inversiones}
  prom:= 0;
  maxInver:= 0;
  more50:= 0;
  repeat
    write('Ingrese el codigo de la empresa: ');
    readln(id);
    write('Indique la cantidad de inversiones de la empresa: ');
    readln(inverTot);

    for i:= 1 to inverTot do
      begin
        writeln('Ingrese el monto de la inversion: ');
        readln(inver);
        while (inver < 0) do
          begin
            writeln('Ingrese un monto valido: ');
            readln(inver);
          end;
        sum:= sum + inver;
        writeln('Se invirtio el monto de: $', inver:0:2);
      end;

    if (sum > maxInver) then
      begin
        maxInver:= sum;
        idMax:= id;
      end;

    if (sum > k50) then
      more50:= more50 + 1;

    prom:= sum / inverTot;

    writeln('La empresa ', id, ' tiene un monto promedio de inversiones de ', prom:0:2);

    sum:= 0;

  until id = cut;

  writeln('El codigo de la empresa con mas inversiones es ', idMax, ' y su total invertido es de $', maxInver);
  writeln('La cantidad de empresas con mas de $50000 de inversion son ', more50);
end.
