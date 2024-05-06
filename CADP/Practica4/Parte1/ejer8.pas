program ejer8;
const
  stud = 400;
type
  studentObj = record
    id: integer;
    dni: integer;
    lastName: string;
    name: string;
    bornYear: integer;
  end;

  olderStudent = record
    year: integer;
    name: string;
    lastName: string;
  end;

  vec = array [0..399] of student;

procedure chargeInfo (var v: vec; i: integer);
var
  student: studentObj;
begin
  write('Ingrese el nro de inscripcion: ');
  readln(student.id);
  write('Ingrese el dni del alumno: ');
  readln(student.dni);
  write('Ingrese el apellido del alumno: ');
  readln(student.lastName);
  write('Ingrese el nombre del alumno: ');
  readln(student.name);
  write('Ingrese el año de nacimiento: ');
  readln(student.bornYear);
  v[i]:= student;
end;
function getDniEven (v: vec): real;
var
  i, aux, num, counter: integer;
  bool: boolean;
  student: studentObj;
begin
  counter:= 0;
  for i:= 0 to 399 do
    begin
      student:= v[i];
      num:= student.dni;
      bool:= true;
      while ((num <> 0) and (bool)) do
        begin
          aux:= num mod 10;
          if ((aux mod 2) <> 0) then
            bool:= false;
          num:= num div 10;
        end;
      if (bool) then
        counter:= counter + 1;
    end;
  getDniEven:= (counter * 100) / stud;
end;
procedure getOlderStudents (v: vec; var maxOne, maxTwo: olderStudent);
var
  i: integer;
  actual: studentObj;
begin
  for i:= 0 to 399 do
    begin
      actual:= v[i];
      if (actual.bornYear <= maxOne.bornYear) then
        begin
          maxTwo:= maxOne;
          maxOne:= actual;
        end
      else if (actual.bornYear <= maxTwo.bornYear) then
        maxTwo:= actual;
    end;
end;
var
  v: vec;
  maxOne, maxTwo: studentObj;
  i: integer;
  averageEven: real;
begin
  for i:= 0 to 399 do
    chargeInfo(v, i);
  write('El porcentaje de alumnos con dni con todos los digitos par es ', getDniEven(v), '%');
  getOlderStudents(v, maxOne, maxTwo);
  writeln('El nombre y apellido del alumno mas grande es ', maxOne.name, ' ', maxOne.lastName, ' y el segundo mas grande es ', maxTwo.name, ' ', maxTwo.lastName);
end.
