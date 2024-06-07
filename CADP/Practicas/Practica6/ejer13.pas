program ejer13;
const
  usersL = 3599;
  economy = 'Economica';
type
  
  rangeRole = 1..4;

  userObj = record
    name: string[30];
    mail: string[30];
    role: rangeRole;
    participant: string[30];
    lastAccess: integer;
  end;

  userVec = array [0..usersL] of userObj;

  counterVec = array [0..3] of integer;

  list = ^node;

  node = record
    element: userObj;
    next: list;
  end;

procedure addNode (var l: list; user: userObj);
var
  newNode, prev, current: list;
begin
  new(newNode);
  newNode^.element:= user;
  current:= l;
  while ((current <> nil) and (current^.element.lastAccess < newNode^.element.lastAccess)) do
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
procedure initializeCounter (var v: counterVec);
var
  i: integer;
begin
  for i:= 0 to 3 do
    v[i]:= 0;
end;
procedure incrementCounter (var v: counterVec; user: userObj);
begin
  if (user.role = 1) then
    v[0]:= v[0] + 1
  else if (user.role = 2) then
    v[1]:= v[1] + 1
  else if (user.role = 3) then
    v[2]:= v[2] + 1
  else
    v[3]:= v[3] + 1;
end;
procedure takeInfo (var user: userObj);
begin
  write('Ingrese el mail del usuario: ');
  readln(user.mail);
  writeln('Ingrese el nombre del usuario: ');
  readln(user.name);
  writeln('Ingrese el rol del usuario (del 1 al 4): ');
  readln(user.role);
  writeln('Ingrese el nombre de la revista que participa: ');
  readln(user.participant);
  writeln('Ingrese hace cuantos dias el usuario no se conecta: ');
  readln(user.lastAccess);
end;
procedure getLessConnectedUsers (var mailOne, mailTwo: string; var minOne, minTwo: integer; user: userObj);
begin
  if (user.lastAccess >= minOne) then
    begin
      minTwo:= minOne;
      mailTwo:= mailOne;
      minOne:= user.lastAccess;
      mailOne:= user.mail;
    end
  else if (user.lastAccess >= minTwo) then
    begin
      minTwo:= user.lastAccess;
      mailTwo:= user.mail;
    end;
end;
  {
    hay un array con 3600 usuarios
    user: nombre, mail, role (1: editor, 2: autor, 3: revisor, 4: lector), revista donde participa y dias desde el ultimo accceso
    informar:
    a) nombre y cantidad de dias del ultimo acceso de todos los usuarios de la revista "Economica" (ascendete)
    b) cantidad de usuarios por rol
    c) mail de los 2 usuario con mas tiempo sin ingresar
  }
var
  counter: counterVec;
  users: userVec;
  minOne, minTwo, i: integer;
  mailOne, mailTwo: string[30];
  user: userObj;
  l: list;
begin
  initializeCounter(counter);
  minOne:= -1;
  minTwo:= -1;
  l:= nil;
  for i:= 0 to usersL do
    begin
      user:= users[i];
      if (user.participant = economy) then
        addNode(l, user);
      incrementCounter(counter, user);
      getLessConnectedUsers(minOne, minTwo, mailOne, mailTwo, user);
    end;
    
  writeln('Usuario 1 ', mailOne, ' y usuario 2 ', mailTwo);

  for i:= 0 to 3 do
    writeln('Usuario con rol ', i + 1, ' fueron ', counter[i]);
end.
