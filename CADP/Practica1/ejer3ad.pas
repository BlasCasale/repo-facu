program ejer3ad;
  {corte Z}
  {tanques rectangulares (R) o cilindricos (C)}
  {los tanques R tienen ancho (A), largo (B) y alto (C)}
  {los tanques C radio y alto}
  {las medidas se ingresan en metros (real)}
  {
    formulas:
    cilindro: pi * r^2 * h
    rectangulo: a * b * c
    promedio: volTotal / cantidad de tanques
  }
const
  cut = 'Z';
  pi = 3.14;
  lessThanVolume = 800;
  lessThanHeigth = 1.4;
var
  maxOne, maxTwo, tankCil, tankRec, less1mt, lessVolTot: integer;
  tank: char;
  width, heigth, large, radius, promCil, promRec, vol: real;
begin
  maxOne:
  write('Ingresa un tipo de tanque (R) o (C) para cortar el programa ingrese (Z): ');
  readln(tank);
  maxOne:= 0;
  maxTwo:= 0;
  tankCil:= 0;
  tankRec:= 0;
  less1mt:= 0;
  lessVolTot:= 0;
  promRec:= 0;
  promCil:= 0;
  while (tank <> cut) do
    begin
      if (tank = 'R') then
        begin
          tankRec:= tankRec + 1;
          writeln('Ingrese la altura del tanque (en metros): ');
          readln(heigth);
          if (heigth < lessThanHeigth) then
            less1mt:= less1mt + 1;
          writeln('Ingrese el ancho del tanque (en metros): ');
          readln(width);
          writeln('Ingrese el largo del tanque (en metros): ');
          readln(large);
          vol:= heigth * width * large;
          if (vol > maxOne) then
            begin
              maxTwo:= maxOne;
              maxOne:= vol;
            end
          else if (vol > maxTwo) then
            maxTwo:= vol;
          if (vol < lessV) then
            less:= vol;
          if (vol < lessThanVolume) then
            lessVolTot:= lessVolTot + 1;
          promRec:= promRec + vol;
        end;
      if (tank = 'C') then
        begin
          tankCil:= tankCil + 1;
          writeln('Ingrese el radio del tanque (en metros): ');
          readln(radius);
          writeln('Ingrese la altura del tanque (en metros): ');
          readln(heigth);
          if (heigth > lessThanHeigth) then
            less1mt:= less1mt + 1;
          vol:= pi * (radius * radius) * heigth;
          if (vol < lessThanVolume) then
            lessVolTot:= lessVolTot + 1;
          if(vol > maxOne) then
            begin
              maxTwo:= maxOne;
              maxOne:= vol;
            end
          else if (vol > maxTwo) then
            maxTwo:= vol;

          promCil:= promCil + vol;
        end;
      if (tankRec > 0) then
        promRec:= promRec / totalRec;

      if (tankCil > 0) then
        promCil:= promCil / totalRec;

      write('El promedio de los tanques cilindricos es ', promCil:0:2, ' y el de los rectangulares ', promRec:0:2);
      write('Los tanques con menor altura a 1.4 mt son ', less1mt);
      write('Los tanques con un volumen menor a 800 mt3  son ', lessVolTot);
      if (maxOne > 0) then
        write('El tanque con mayor mayor volumen tiene un volumen de ', maxOne:0:2, ' mt3');
      if (maxTwo > 0) then
        write('El tanque con segundo mayor volument tiene un volumen de ', maxTwo:0:2, ' mt3');
  {
    al finalizar:
    1) informan volumen de los 2 tanques vendidos R=X C=X
    2) promedio de todos los tanques cilindricos vendidos
    3) promedio de todos los tanques rectangulares vendidos
    4) cantdad de tanques con una altura < a 1.4 mt R=X C=X
    5) cantidad de tanques cuyo volumen < a 800 mt3 R=X C=X
  }
    end;
end.
