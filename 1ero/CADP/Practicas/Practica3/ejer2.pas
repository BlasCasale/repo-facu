program ejer2Pr3;
{
  corta en el año 2020 (while)
  informar los casamientos en meses de verano (enero, febrero, marzo)
  informar los casamientos que fueron en los primeros 10 dias
}
type
  date = record
    day: integer;
    month: integer;
    year: integer;
  end;
  monthOfSummer = 1..3;
  firstDays = 1..10;
procedure takeInfo (var dateToUpdate: date);
  begin
    writeln('Ingrese el año: ');
    readln(dateToUpdate.year);
    if (dateToUpdate.year <> 2020) then
      begin
        writeln('Ingrese el mes: ');
        readln(dateToUpdate.month);
        write('Ingrese el dia: ');
        readln(dateToUpdate.day);
      end;
  end;
procedure countMonths (var counter: integer; dateToCheck: date);
begin
  if (dateToCheck.month = monthOfSummer) then
    counter:= counter + 1;
end;
procedure countDays (var counter: integer; dateToCheck: date);
begin
  if ((dateToCheck.month = monthOfSummer) and (dateToCheck.day = firstDays)) then
    counter:= counter + 1;
end;
var
  counterDays, counterMonths: integer;
  marriageDate: date; 
begin
  counterDays:= 0;
  counterMonths:= 0;
  takeInfo(marriageDate);
  while (marriageDate.year <> 2020) do
    begin
      counterMonths(counterMonths, marriageDate);
      counterDays(counterDays, marriageDate);
      takeInfo(marriageDate);
    end;
  writeln('La cantidad de casamientos en los meses de verano fueron ', counterMonths);
  writeln('La cantidad de casamientos en los primeros 10 dias del mes fueron ', counterDays);
end.
