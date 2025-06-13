program parcial1;
const
  highValue = 9999;
type

  team = record
    id: integer;
    name: string[30];
    year: integer;
    idTourament: integer;
    idRival: integer;
    goalsScored: integer;
    goalsReceived: integer;
    points: integer;
  end;

  archive = file of team;

procedure readArchive (var a: archive; var t: team);
begin
  if (not eof(a)) then
    read(a, t)
  else
    t.id:= highValue;
end;

procedure createInform (var a: archive);
var
  t: team;
  goalsScored, goalsReceived, points, id, year, idTourament, winned, draw, lost: integer;
  name, nameChamp: string[30];
begin
  reset(a);
  readArchive(a, t);

  while (t.id <> highValue) do
    begin
      year:= t.year;
      writeln('Anio ', year);
      while ((t.id <> highValue) and (year = t.year)) do
        begin
          idTourament:= idTourament;
          maxPoints:= -1;
          writeln('Cod torneo: ', idTourament);
          while ((t.id <> highValue) and (year = t.year) and (t.idTourament = idTourament)) do
            begin
              id:= t.id;
              goalsScored:= 0;
              goalsReceived:= 0;
              points:= 0;
              winned:= 0;
              draw:= 0;
              lost:= 0;
              name:= t.name;
              writeln('Cod equipo ', id)
              while ((t.id <> highValue) and (year = t.year) and (t.idTourament = idTourament) and (t.id = id)) do
                begin
                  goalsReceived:= t.goalsReceived;
                  goalsScored:= t.goalsScored;
                  if (t.points = 3) then
                    winned:= winned + 1
                  else if (t.points = 1) then
                    draw:= draw + 1
                  else
                    lost:= lost + 1;
                  points:= points + t.points;
                  readArchive(a, t);
                end;
              if (maxPoints < points) then
                begin
                  maxPoints:= points;
                  nameChamp:= name;
                end;
              writeln('Goles a favor ', goalsScored);
              writeln('Goles en contra ', goalsReceived);
              writeln('Diferencia de gol ', goalsScored - goalsReceived);
              writeln('Partidos ganados ', winned);
              writeln('Partidos empatados ', draw);
              writeln('Partidos perdidos ', lost);
              writeln('Puntos obtenidos ', points);
            end;
          writeln('El equipo campeon fue ', name, ' con el codigo de torneo ', idTourament, ' y el codigo del equipo es ', id);
        end;
    end;
end.
