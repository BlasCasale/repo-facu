program ejer9Pr2;
{
  para cada alum: nombre, apellido, id
  cortar cuando id = 1200 (debe procesarse)
  apellido de los 2 alumnos con id mas chico
  nombre de los 2 alumnos con id mas grande
  porcentaje de los alumnos con id par (pares * 100 / totalAlum)
}
const
  cut = 1200;
type
  names= string[30];
procedure getMaxId (id: integer; name: names; var maxIdOne: integer; var maxIdTwo: integer; var nameMaxOne: names; var nameMaxTwo: names);
begin
  if (id > maxIdOne) then
    begin
      maxIdTwo:= maxIdOne;
      nameMaxTwo:= nameMaxOne;
      maxIdOne:= id;
      nameMaxOne:= name;
    end;
  else if (id > maxIdTwo) then
    begin
      maxIdTwo:= id;
      nameMaxTwo:= name;
    end;
end;
procedure getLessId (id: integer; lastName: names; var lessIdOne: integer; var lessIdTwo: integer; var lastNameLessOne: names; var lastNameLessTwo: names);
begin
  if (id < lessIdOne) then
    begin
      lessIdTwo:= lessIdOne;
      lastNameLessTwo:= lastNameLessOne;
      lessIdOne:= id;
      lastNameLessOne:= lastName;
    end;
  else if (id < lessIdTwo) then
    begin
      lessIdTwo:= id;
      lastNameLessTwo:= lastName;
    end;
end;
procedure takeInfo (var id: integer; var name: names; var lastName: names);
begin
  write('Ingrese el legajo del alumno');
  readln(id);
  writeln('Ingrese el nombre del alumno');
  readln(name);
  write('Ingrese el apellido del alumno');
  readln(lastName);
end;
function returnEvenId (id: integer): boolean;
begin
  returnEvenId:= id mod 2 = 0;
end;
var
  id, maxIdOne, maxIdTwo, lessIdOne, lessIdTwo, totalAlum, totalEven: integer;
  average: real;
  name, lastName, nameMaxOne, nameMaxTwo, lastNameLessOne, lastNameLessTwo: names;
begin
  maxIdOne:= -1;
  maxIdTwo:= -1;
  lessIdOne:= 99999;
  lessIdTwo:= 99999;
  nameMaxOne:= '';
  nameMaxTwo:= '';
  totalAlum:= 0;
  totalEven:= 0;
  repeat
    takeInfo(id, name, lastName);
    if (returnEvenId(id)) then
      totalEven:= totalEven + 1;
    totalAlum:= totalAlum +1;
    getMaxId(id, name, maxIdOne, maxIdTwo, nameMaxOne, nameMaxTwo);
    getLessId(id, lastName, lessIdOne, lessIdTwo, lastNameLessOne, lastNameLessTwo);
  until id = cut;
  average:= (totalEven * 100) / totalAlum;
  writeln('El apellido con legajo mas chico es ', lastNameLessOne, ' y el segundo mas chico es ', lastNameLessTwo);
  writeln('El nombre con legajo mas grande es ', nameMaxOne, ' y el segundo mas grande es ', nameMaxTwo);
  writeln('El porcentaje de alumnos con legajo par es %', average);
end.
