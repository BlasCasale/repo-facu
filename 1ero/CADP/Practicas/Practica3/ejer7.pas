program nombrePrograma;
type
  limited = string[20];
  investigationCenterObj = record
    university: limited;
    name: limited;
    investigators: integer;
    scholars: integer;
  end;
procedure takeInfo (var investigationCenter: investigationCenterObj);
begin
  write('Ingrese el nombre de la universidad del centro ');
  readln(investigationCenter.university);
  write('Ingrese el nombre del centro (abreviado): ');
  readln(investigationCenter.name);
  write('Ingrese la cantidad de investigadores que hay en el centro: ');
  readln(investigationCenter.investigators);
  write('Ingrese la cantidad de becarios que hay en el centro: ');
  readln(investigationCenter.scholars);
end;
procedure getMoreInvestigators (investigationCenter: investigationCenterObj; var maxOne: integer; var maxUniversity: limited);
begin
  if (investigationCenter.investigators >= maxOne) then
    begin
      maxOne:= investigationCenter.investigators;
      maxUniversity:= investigationCenter.university;
    end;
end;
procedure getLessScholars (investigationCenter: investigationCenterObj; var lessOne, lessTwo: integer; var lessCenterOne, lessCenterTwo: limited);
begin
  if (investigationCenter.scholars <= lessOne) then
    begin
      lessTwo:= lessOne;
      lessCenterTwo:= lessCenterOne;
      lessOne:= investigationCenter.scholars;
      lessCenterOne:= investigationCenter.name;
    end;
end;
var
  center: investigationCenterObj;
  maxInvestigators, counterInvestigators, counterScholars, lessOne, lessTwo, centersPerUni: integer;
  maxUniInvestigators, actual, lessCenterOne, lessCenterTwo: limited;
begin
{
  leer centro de investigaciones, a que universidad pertenece, cantidad de investigadores y becarios
  leer por universidad
  corta cuando se ingresa 0 investigadores {while}
  informar cantidad de centros por universidad
  informar la universidad con mas investigadores
  informar los 2 centros con menos becarios
}
  lessOne:= -1;
  lessTwo:= -1;
  maxInvestigators:= 0;
  takeInfo(center);
  while (center.investigators <> 0) do
    begin
    actual:= center.university;
    counterInvestigators:= 0;
    centersPerUni:= 0;
    while ((actual = center.university) and (center.investigators <> 0)) do
      begin
        centersPerUni:= centersPerUni + 1;
        counterInvestigators:= counterInvestigators + center.investigators;
        counterScholars:= counterScholars + center.scholars;
        getLessScholars(center, lessOne, lessTwo, lessCenterOne, lessCenterTwo);
        takeInfo(center);
      end;
    getMoreInvestigators(counterInvestigators, maxInvestigators, maxUniInvestigators);
    writeln('La universidad ', actual, ' tiene ', centersPerUni, ' centros de investigacion.');
    end;
  write('La universidad con mas investigadores es ', maxUniInvestigators);
  writeln('El centro con menos becarios es ', lessCenterOne, ' y el segundo es ', lessCenterTwo);
end.
