program parcial1;
const
  actualYear = 2022;
type

  rangeRatings = 0..17;

  vecRatings = array [rangeRatings] of integer;

  idRange = 1..20;

  playersObj = record
    id: integer;
    fullName: string[50];
    teamCode: idRange;
    ratings: vecRatings;
    year: integer;
  end;

  list = ^node;

  node = record
    element: playersObj;
    next: list;
  end;

  rangeTeams = 0..19;

  vecTeams = array [rangeTeams] of integer;

  objPlayersLessQ = record
    id1: integer;
    id2: integer;
    avarage1: real;
    avarage2: real;
  end;

procedure chargeList (var l: list); // se dispone

procedure addNode (var l: list; player: playersObj);
var
  newNode, prev, current: list;
begin
  new(newNode);
  newNode^.element:= player;
  current:= l;

  if (l = nil) then
    begin
      newNode^.next:= current;
      l:= newNode;
    end
  else
    begin
      while(current <> nil and current^.element.id < newNode^.element.id) do
        begin
          prev:= current;
          current:= current^.next;
        end;
    end;

  if (current = l) then
    begin
      newNode^.next:= current;
      l:= newNode;
    end
  else begin
    prev^.next:= newNode;
    newNode^.next:= current; 
  end;
end;

procedure countPlayers (var v: vecTeams; player: playersObj);
var
  i: integer;
begin

  if ((actualYear - player.year) = 30) then
    begin
      i:= player.teamCode;
      v[i -1]:= v[i - 1] + 1;
    end;
end;

procedure initializeVector(var v: vecTeams);
var
  i: integer;
begin
  for i:= 0 to 19 do
    v[i] := 0;
end;

procedure getPlayersLessQualifie(v: vecRatings; id: integer; var players: objPlayersLessQ); 
var
  i, counter: integer;
  avarage: real; 
begin
  counter:= 0;
  avarage:= 0;
  for i:= 0 to 17 do
  begin
    if(v[i] <> 0) then begin
      counter:= counter + 1;
      avarage:= avarage + v[i];
    end;
  end;
  if(counter >= 9) then begin
    avarage:= avarage/counter;
    if(avarage <= players.avarage1) then begin
      players.id2:= players.id1;
      players.id1:= id;
      players.avarage2:= players.avarage1;
      players.avarage1:= avarage;
    end;
    else if(avarage <= players.avarage2) then begin
      players.id2:= id;
      players.avarage2:= avarage;
    end;
  end;
end;

function evenCode(player: playersObj): boolean;
var
  counter, aux: integer;
begin
  
end;

  {
    revista deportiva dispone de la info
    jugador: id, nombre y apellido, codigo de equipo, año de nacimiento, calificiacion por los 18 partidos del torneo
    calificacion 0 a 10: 0 no jugo
    informar:
    por equipo informar los jugadores menores a 30 años (2022 - año de nacimiento, vector)
    informar los codigos de los 2 jugadores con menor calificacion en los partidos que participo, solo considerar a los jugadores que jugaron 9 partidos
    generar una lista con los jugadores cuyo codigo tiene solamente 2 digitos pares y haya nacido entre 1987 y 1991, debe estar ordenada por codigo de jugador (ascendente)
  }
var
  listPlayes, players, aux: list;
  player: playersObj;
  teams: vecTeams;

begin
  chargeList(listPlayes); // se dispone

  aux:= listPlayes;

end.
