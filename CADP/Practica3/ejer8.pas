program nombrePrograma;
const
  cutId = -1;
  daireaux = 'Daireaux';
type

  teacherType = record
    dni: integer;
    name: string;
    lastName: string;
    email: string;
  end;

  projectType = record
    id: integer;
    title: string;
    teacher: teacherType;
    students: integer;
    schoolName: string;
    location: string;
  end;

procedure takeInfoTeacher (var teacher: teacherType);
begin
  write('Ingrese el DNI del profesor');
  readln(teacher.dni);
  write('Ingrese el nombre del profesor');
  readln(teacher.name);
  write('Ingrese el apellido del profesor');
  readln(teacher.lastName);
  write('Ingrese el mail del profesor');
  readln(teacher.mail);
end;
procedure takeInfoProject (var project: projectType);
begin
  write('Ingrese el ID del proyecto');
  readln(project.id);
  if (project.id <> cutId) then
    begin
      write('Ingrese el titulo del proyecto');
      readln(project.title);
      takeInfoTeacher(project.teacher);
      write('Ingrese la cantidad de alumnos que participan del proyecto');
      readln(project.students);
      write('Ingrese el nombre de la escuela');
      readln(project.schoolName);
      write('Ingrese el partido de la escuela');
      readln(project.location);
    end;
end;
procedure getMaxStudents (project: projectType; var maxOne, maxTwo: integer; var nameSchoolOne, nameSchoolTwo: string);
begin
  if (project.students >= maxOne) then
    begin
      maxTwo:= maxOne;
      nameSchoolTwo:= nameSchoolOne;
      maxOne:= project.students;
      nameSchoolOne:= project.schoolName;
    end
  else if (project.students >= maxTwo) then
    begin
      maxTwo:= project.students;
      nameSchoolTwo:= project.schoolName;
    end;
end;
function splitDigits (id: integer): boolean;
var
  aux, counterEven, counterOdd: integer;
begin
  counterEven:= 0;
  counterOdd:= 0;
  while (id > 0) do
    begin
      aux:= id mod 10;
      if ((aux mod 2) = 0) then
        counterEven:= counterEven + 1
      else
        counterOdd:= counterOdd + 1;
      id:= id div 10;
    end;
  splitDigits:= counterEven = counterOdd;
end;
var
  totalSchool, locationSchool: integer; {contadores de las escuelas}
  studentsCounter, maxOneStudents, maxTwoStudents: integer; {contador y max de los estudiantes}
  nameSchoolOne, nameSchoolTwo: string; {nombres para las escuelas con mas alumnos participando}
  titleProject: string;
  project: projectType;
  actualSchool, actualLocation: string;
begin
{
  cada proyecto tiene un id, titulo, un docente coordinador (dni, nombre, apellido, email), alumnos participantes, nombre de la escuela y localidad
  cada escuela puede presentar mas de un proyecto
  la info se ingresa por localidad y para localidad por escuela
  ingresar proyectos hasta el codigo -1 {while}

  informar:
  cantidad total de escuelas y cantidad de escuelas por localidad x
  nombre de las dos escuelas con mayor cantidad de alumnos participantes x
  titulo de los proyectos de la localidad de daireaux cuyo codigo tiene tantos digitos pares e impares
}
  totalSchool:= 0;
  takeInfoProject(project);
  maxOneStudents:= -1;
  maxTwoStudents:= -1;
  while (project.id <> cutId) do
    begin
      actualLocation:= project.location;
      while ((project.id <> cutId) and (project.location = actualLocation)) do
        begin
          locationSchool:= 0;
          studentsCounter:= 0;
          actualSchool:= project.schoolName;
          while ((project.id <> cutId) and (projecto.location = actualLocation) and (project.school = actualSchool)) do
            begin
              studentsCounter:= studentsCounter + project.students;
              if ((actualLocation = daireaux) and (splitDigits(project.id))) then
                titleProject:= project.title;
              totalSchool:= totalSchool + 1;
              locationSchool:= locationSchool + 1;
              readln(project);
            end;
          write(studentsCounter, ' son los alumnos que participaron en la escuela ', actualSchool);
          getMaxStudents(project, maxOne, maxTwo, nameSchoolOne, nameSchoolTwo);
        end;
      writeln('En la localidad de ', actualLocation, ' participaron ', locationSchool, ' escuelas');
    end;
  write('La escuela con mayor cantidad de alumnos es ', nameSchoolOne);
  writeln('Y la segunda con mas alumnos es ', nameSchoolTwo);
end.
