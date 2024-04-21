program inception;

type
  dateType = record
    day: integer;
    month: integer;
    year: integer;
  end;
  dogType = record
    race: string;
    age: integer;
    name: string;
    lastVisit: date;
    birthdate: date;
  end;
procedure takeDate (var date: dateType);
begin
  read(date.day);
  read(date.month);
  read(date.year);
end;
procedure takeInfo (var dog: dogType);
begin
  read(dog.race);
  read(dog.name);
  read(dog.age);
  takeDate(dog.lastVisit);
  takeDate(dog.birthdate);
end;
var
  dog1: dogType;
begin
  read(dog1.lastVisit.day);
  {
    objeto dentro de objeto JS
  }
end.
