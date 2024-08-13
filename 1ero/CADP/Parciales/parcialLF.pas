program parcial1;
const
  dimFTeams = 28;
  dimFGames = 27;
  actualYear = 2022;
type
  
  rangeCode = 1..dimFTeams;

  rangeGames = 1..dimFGames;

  vecGames = array [rangeGames] of real; // vector con los partidos y sus calificaciones

  playerObj = record
    id: integer;
    fullname: string;
    codeTeam: rangeCode;
    year: integer;
    games: vecGames;
  end;

  list = ^node;

  node = record
    element: playerObj;
    next: list;
  end;

  vecCounter = array [rangeCode] of integer; // vector para contar los mayores de 35

  playerBestAverageObj = record
    id: integer;
    average: real;
  end;

procedure chargeList (var l: list); // se dispone

procedure initializeVec (var v: vecCounter);
var
  i: integer;
begin
  // inicializo para usar el contador
  for i:= 1 to dimFTeams do
    v[i]:= 0;
end;

procedure actualizeVec (var v: vecCounter; player: playerObj);
begin
  if ((actualYear - player.year) >= 35) then
    v[player.codeTeam]:= v[player.codeTeam] + 1;
end;

procedure getAverage (v: vecGames; var average: real);
var
  i, games: integer;
begin
  average:= 0;
  games:= 0;

  for i:= 1 to rangeGames do
    begin
      if (v[i] <> 0) then
        begin
          average:= average + v[i];
          games:= games + 1;
        end;
    end;
  
  if (games >= 14) then
    average:= average / games
  else
    average:= 0;    
end;

procedure actualizeMax (var maxOne, maxTwo: playerBestAverageObj; average: real; id: integer);
begin
  if (average >= maxOne.average) then
    begin
      maxTwo.average:= maxOne.average;
      maxTwo.id:= maxOne.id;
      maxOne.average:= average;
      maxOne.id:= id;
    end
  else if (average >= maxTwo.average) then
    begin
      maxTwo.average:= average;
      maxTwo.id:= id;
    end;
end;

function decomposeId (id: integer): boolean;
var
  aux, counter: integer;
begin
  counter:= 0;

  while (id <> 0) do
    begin
      aux:= id mod 10;
      if (((aux mod 2) <> 0) and (aux <> 0)) then
        counter:= counter + 1;
      id:= id div 10;
    end;

  decomposeId:= counter = 3;
end;

function trueYears (year: integer): boolean;
begin
  trueYears:= (year >= 1983) and (year <= 1990);

end;

procedure addNode (var l: list; player: playerObj);
var
  prev, current, newNode: list;
begin
  new(newNode);
  newNode^.next:= nil;
  newNode^.element:= player;
  current:= l;

  if (l = nil) then
    begin
      l:= newNode;
    end
  else
    begin
      while ((current <> nil) and (current^.element.id < newNode^.element.id)) do
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
end;

procedure roamList (l: list; var sl: list; var maxOne, maxTwo: playerBestAverageObj; var counter: vecCounter);
var
  player: playerObj;
  average: real;
begin
  while (l <> nil) do
    begin
      player:= l^.element;
      if ((decomposeId(player.id)) and (trueYears(player.year))) then
        addNode(sl, player);
      actualizeVec(counter, player);
      getAverage(player.games, average);
      actualizeMax(maxOne, maxTwo, average, player.id);
    end;
end;

procedure informQuantity (v: vecCounter);
var
  i: integer;
begin
  for i:= 1 to dimFTeams do
    write('El equipo con codigo ', i, ' tiene ', v[i], ' jugadores con mas de 35 años');
end;

  {
    informar:
    a) para cada equipo la cant de jug de mas de 35 años (2022 - año) x
    b) informar los codigos de los 2 jugadores con mejor calificacion promedio, considerar solo cuando participo (!= 0) en mas de 14 fechas
    c) implementar e invocar un mod que genere una lista con los jug cuyo cod tenga exactamente 3 digitos impares y haya nacido entre 1983 y 1990. tiene que estar ordenada por id de jugador
  }
var
  l, secondL: list;
  maxOne, maxTwo: playerBestAverageObj;
  counter: vecCounter;
begin
  l:= nil;
  secondL:= nil;

  maxOne.average:= -1;
  maxTwo.average:= -1;

  chargeList(l); // se dispone

  roamList(l, secondL, maxOne, maxTwo, counter);
  informQuantity(counter);
end.
