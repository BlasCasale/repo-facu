program ejer11;
const
  cut = 0;
type
  studentObj = record
    id: integer;
    lastName: string[30];
    average: real;
  end;

  list = ^node;

  node = record
    element: studentObj;
    next: list;
  end;

  {
    alumnos: id, apellido y promedio
    corta con 0 {while}
    una vez lee todo, informar todo segun promedio (ascendente)
  }
procedure addNode (var l: list; student: studentObj);
var
  newNode, current, prev: list;
begin
  new(newNode);
  newNode^.element:= student;
  current:= l;
    while ((current <> nil) and (current^.element.average > newNode^.element.average)) do
      begin
        prev:= current;
        current:= current^.next;
      end;
  
  if (current = l) then
    begin
      newNode^.next:= l;
      l:= newNode;
    end
  else
    begin
      prev^.next:= newNode;
      newNode^.next:= current;
    end;
end;
procedure roamList (l: list);
begin
  while (l <> nil) do
    begin
      writeln('ID: ', l^.element.id, ', apellido: ', l^.element.lastName, ' y su promedio: ', l^.element.average:0:2);
      l:= l^.next;
    end;
end;
procedure takeInfo (var student: studentObj);
begin
  writeln('Ingrese el ID del estudiante: ');
  readln(student.id);
  if (student.id <> cut) then
    begin
      writeln('Ingrese el apellido del estudiante: ');
      readln(student.lastName);
      writeln('Ingrese el promedio del estudiante: ');
      readln(student.average);
    end;
end;
var
  student: studentObj;
  l: list;
begin
  l:= nil;
  takeInfo(student);
  while (student.id <> cut) do
    begin
      addNode(l, student);
      takeInfo(student);
    end;
  roamList(l);
end.
