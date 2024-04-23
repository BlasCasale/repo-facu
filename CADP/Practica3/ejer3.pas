program ejer3Pr2;
{
  1 docente cada 23435 alumnos x
  informar cantidad de escuelas de la plata con una relacion superior a la dicha x
  cue y nombre de las dos mejores escuelas con relacion docente alumno x
  un modulo para la lectura
  un modulo para la proporcion
}
const
  schools = 2400;
  proportionStudentPerTeacher = 23435;
type
  school = record
    cue: integer;
    name: string;
    teachers: integer;
    students: integer;
    state: string;
  end;
procedure takeInfo(var schoolToUpdate: school);
begin
  write('Ingrese el CUE: ');
  readln(schoolToUpdate.cue);
  write('Ingrese el nombre de la escuela: ');
  readln(schoolToUpdate.name);
  write('Ingrese la cantidad de profesores: ');
  readln(schoolToUpdate.teachers);
  write('Ingrese la cantidad de estudiantes: ');
  readln(schoolToUpdate.students);
  write('Ingrese el partido de la escuela: ');
  readln(schoolToUpdate.state);
end;
function getProportion (schoolToCheck: school): real;
begin
  getProportion:= schoolToCheck.students / proportionStudentPerTeacher;
end;
function checkLaPlataSchool (schoolToCheck: school; counter:integer; propotion: real): integer;
begin
  if ((schoolToCheck.state = 'La Plata') and (propotion >= 1)) then
    checkLaPlataSchool:= counter + 1;
end;
procedure checkBetterProportion (schoolToCheck: school; proportion: real; var firstProportion: real; var firstSchool: string; var secondProportion: real; var secondSchool: string);
begin
  if (proportion >= firstProportion) then
    begin
      secondProportion:= firstProportion;
      secondSchool:= firstSchool;
      firstProportion:= proportion;
      firstSchool:= schoolToCheck.name;
    end
  else if (proportion >= secondProportion) then
    begin
      secondProportion:= proportion;
      secondSchool:= schoolToCheck.name;
    end;
end;
var
  proportion, firstSchool, secondSchool: real;
  counterLaPlataSchool, i: integer;
  firstSchoolName, secondSchoolName: string;
  actualSchool: school;
begin
  firstSchool:= -1;
  secondSchool:= -1;
  for i := 1 to schools do
    begin
      takeInfo(actualSchool);
      second:= actualSchool;
      proportion:= getProportion(actualSchool);
      counterLaPlataSchool:= checkLaPlataSchool(actualSchool, counterLaPlataSchool, proportion);
      checkBetterProportion(actualSchool, proportion, firstSchool, firstSchoolName, secondSchool, secondSchoolName);
    end;
  writeln('La cantidad de escuelas de la plata con proporcion mayor a 1 es ', counterLaPlataSchool);
  writeln('La escuela con mejor proporcion es ', firstSchoolName, ' y la segunda ', secondSchoolName);
end.
