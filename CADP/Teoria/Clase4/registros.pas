program registros;

type
  object = record
    name: string;
    age: integer;
  end;
  dog = record
    race: string;
    age: integer;
    name: string;
  end;
procedure takeInfo (var doggy: dog);
begin
  read(doggy.race);
  read(doggy.age);
  read(doggy.name);
end;
procedure readInfo (doggy: dog);
begin
  write(doggy.name);
  write(doggy.race);
end;
var
  dog1, dog2: dog;
begin
  dog1.age:= 2;
  dog1.name:= 'Apolo';
  dog1.race:= 'Gran danes';
  dog1:= dog2;
  write(dog1.race);
  read(dog1.age);
  read(dog1.name);
  read(dog1.race);
  takeInfo(dog1);
  takeInfo(dog2);
  readInfo(dog1);
  readInfo(dog2);
  {
    la comparacion entre campos se hace igual que en JS
    accediendo a campos
    no se puede comparar el objeto entero
    (solamente se puede asignar el mismo registro)
  }
  read(dog1); { Esto no }
end.
