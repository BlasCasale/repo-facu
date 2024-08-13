program ejer13;
const
  years = 49;
  months = 11;
  points = 99;
type

  arrayPoints = record
    data: array [0..points] of real;
    length: integer;
  end;

  arrayMonths = record
    data: array [0..months] of arrayPoints;
    length: integer;
  end;

  arrayYears = record
    data: array [0..years] of arrayMonths;
    length: integer;
  end;

procedure chargePoints (var point: arrayPoints; var acc, max: real; var maxYear: integer; actualYear: integer);
var
  i: integer;
  temp: real;
begin
  for i:= 0 to points do
    begin
      write('Ingrese la temperatura: ');
      readln(temp);
      point[i].data:= temp;
      point[i].length:= i + 1;
      acc:= acc + temp;
      if (max <= temp) then
        begin
          max:= temp;
          maxYear:= actualYear;
        end;
    end;
end;
procedure chargeMonths (var month: arrayMonths; var acc, max: real; var maxYear: integer; actualYear: integer);
var
  i: integer;
begin
  for i:= 0 to months do
    begin
      chargePoints(month[i], acc, max, actualYear);
      month[i].lentgh:= i + 1;
    end;
end;
  {
    se quiere llenar el array con las 100 temperaturas por los 12 meses por 50 años
    informar el año con mayor temperatura promedio a nivel mundial
    informar el año con la mayor temperatura en algun punto del planeta en los ultimos 50 años
  }
var
  i: integer; {para iterar}
  year: arrayYears; {el array de los array}
  max, acc, maxAverage, currentAverage: real; {variables para acumular y sacar resultados}
  maxYear, yearMaxAverage: integer; {el año con mayor temp}
begin
  max:= -1;
  maxAverage:= -1;
  for i:= 0 to years do
    begin
      acc:= 0;
      chargeMonths(year[i], acc, max, maxYear, i);
      currentAverage:= acc / 1200;
      if (maxAverage <= currentAverage) then
        begin
          yearMaxAverage:= i;
          maxAverage:= currentAverage;
        end;
      year[i].lentgh:= i + 1;
    end;
end.
