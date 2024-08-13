program ejer15;
const
  cut = -1;
type
  
  studentObj = record
    dni: integer;
    lastName: string[30];
    name: string[30];
    note: integer;
  end;

  list = ^node;

  node = record
    element: studentObj;
    next: list;
  end;

procedure addNode (var first, last: list; student: studentObj);
var 
newNode: list;
begin
  new(newNode);
  newNode^.element:= student;
  
  if (first = nil) then
    begin
      first:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;
procedure takeInfo (var student: studentObj);
begin
  write('Ingrese el DNI del alumno: ');
  readln(student.dni);
  if (student.dni <> cut) then
    begin
      writeln('Ingrese el apellido del alumno: ');
      readln(student.lastName);
      writeln('Ingrese el nombre del alumno: ');
      readln(student.name);
      writeln('Ingrese la nota del alumno: ');
      readln(student.note);
    end;
end;
procedure roamList (l: list);
begin
  while (l <> nil) do
    begin
      writeln('DNI: ', l^.element.dni, '. Apellido: ', l^.element.lastName, '. Nombre: ', l^.element.name, '. Nota: ' l^.element.note);
      l:= l^.next;
    end;
end;
  {
    alum: dni, apellido, nombre y nota
    mas de 8 al turno 1 o 4
    < 5 && > 8 al turno 2, 3 o 5
    > 5 no tienen turno
  }
var
  counter: integer;
  cond: boolean;
  student: studentObj;
  firstOne, firstTwo, firstThree, firstFour, firstFive: list;
  lastOne, lastTwo, lastThree, lastFour, lastFive: list;
begin
  takeInfo(student);
  counter:= 1;
  cond:= true;
  firstOne:= nil;
  firstTwo:= nil;
  firstThree:= nil;
  firstFour:= nil;
  firstFive:= nil;
  
  while (student.dni <> cut) do
    begin
      if (student.note >= 8) then
        begin
          if (cond) then
            begin
              addNode(firstOne, lastOne, student);
              cond:= false;
            end
          else
            begin
              addNode(firstFour, lastFour, student);
              cond:= true;
            end;
        end
      else if ((student.note < 8) and (student.note >= 5)) then
        begin
          if (counter = 1) then
            begin
              addNode(firstTwo, lastTwo, student);
              counter:= counter + 1;
            end
          else if (counter = 2) then
            begin
              addNode(firstThree, lastThree, student);
              counter:= counter + 1;
            end
          else
            begin
              addNode(firstFive, lastFive, student);
              counter:= 1;
            end;
        end;
      takeInfo(student);
    end;

  roamList(firstOne);
  roamList(firstTwo);
  roamList(firstThree);
  roamList(firstFour);
  roamList(firstFive);
end.
