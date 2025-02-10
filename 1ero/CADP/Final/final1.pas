program nombrePrograma;

type

  str = string[50];

  rangePublication = 1..12;

  publish = record
    title: str;
    author: str;
    dni: integer;
    typePub: rangePublication;
  end;

  counterPub = array [rangePublication] of integer;

procedure readPublish (var p: publish);
begin
  readln(p.dni);
  if (p.dni <> 0) then
    begin
      readln(p.title);
      readln(p.author);
      readln(p.typePub);
    end;
end;

procedure initializeCounter (var v: counterPub);
var
  i: integer;
begin
  for i:= 1 to 12 do
    v[i]:= 0;
end;

procedure actVec (var v: counterPub; t: rangePublication);
begin
  v[t]:= v[t] + 1;
end;

function getMax (v: counterPub): rangePublication;
var
  i, max: integer;
begin
  max:= -1;
  for i:= 1 to 12 do
    begin
      if (v[i] > max) then
        max:= i;
    end;
  getMax:= max;
end;

var
  v: counterPub;
  p: publish;
  counterAuthor, dni: integer;
begin
  initializeCounter(v);

  readPublish(p);

  while (p.dni <> 0) do
    begin
      counterAuthor:= 0;
      dni:= p.dni;
      while (p.dni <> 0 and dni = p.dni) do
        begin
          counterAuthor:= counterAuthor + 1;
          actVec(v, p.typePub);
        end;
      writeln(counterAuthor);
    end;

  writeln(getMax(v));
end.
