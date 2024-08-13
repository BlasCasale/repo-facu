program ejer4;

type
  
  str30 = string[30];

  listW = ^nodeW;

  nodeW = record
    element: real;
    next: listW;
  end;

  list = ^node;

  patientObj = record
    name: str30;
    lastName: str30;
    listWeigth: listW;
  end;

  node = record
    element: patientObj;
    next: list;
  end;

procedure chargeList (var l: list);

procedure roamWeeks (l: listW; var currentWeek, week: integer; var acc: real);
var
  reference: real;
begin
  currentWeek:= 1;
  reference:= 0;
  while (l <> nil) do
    begin
      if ((l^.next <> nil) and (l^.element <= l^.next.^element)) then
        begin
          reference:= l^.next^.element - l^.element;
          week:= currentWeek + 1;
        end;
      acc:= acc + l^.element;
      currentWeek:= currentWeek + 1;
      l:= l^.next;
    end;
end;
procedure roamList (l: list);
var
  acc: real;
  currentWeek, week: integer;
begin
  while (l <> nil) do
    begin
      roamWeeks(l^.element.listWeigth, currentWeek, week, acc);
      writeln('Semana con mas aumento de peso ', week);
      writeln('La embarazada ', l^.element.lastName, ' aumento en total ', acc, 'kg');
      l:= l^.next;
    end;
end;
// Una maternidad dispone información sobre sus pacientes. De cada una se conoce: 
// nombre, apellido y peso registrado el primer día de cada semana de embarazo 
// (a lo sumo 42). La maternidad necesita un programa
// que analice esta información, determine e informe:
// a. Para cada embarazada, la semana con mayor aumento de peso.
// b. El aumento de peso total de cada embarazada durante el embarazo.
var
  l: list;

begin
  l:= nil;

  chargeList(l);
end.
