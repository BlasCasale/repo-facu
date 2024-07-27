program clase2;
const
  cut = -1;
type
  
  rangeGen = 1..8;

  movie = record
    id: integer;
    name: string;
    idGen: rangeGen;
    average: real;
  end;

  list= ^node;

  node = record
    element: movie;
    next: list;
  end;

  critica = record
    dni: integer;
    fullname: string;
    id: integer;
    point: real;
  end;

  vecGen = array [rangeGen] of real;

procedure chargeList (var l: list); // se dispone

procedure initializeVec (var v: vecGen);
var
  i: integer;
begin
  for i:= 1 to 8 do
    v[i]:= 0;
end;

procedure actVec (var v: vecGen; gen: rangeGen; point: real);
begin
  v[gen]:= v[gen] + point;
end;

procedure max (v: vecGen);
var
  i, gen: integer;
  max: real;
begin
  max:= -1;
  for i:= 1 to 8 do
    begin
      if (v[i] >= max) then
        begin
          gen:= i;
          max:= v[i];
        end;
    end;

  writeln('Genero con mas pts ', gen);
end;

function decompose (dni: integer): boolean;
var
  aux, even, odd: integer;
begin
  even:= 0;
  odd:= 0;

  while (dni <> 0) do
    begin
      aux:= dni mod 10;

      if (aux mod 2 = 0) then
        even:= even + 1
      else
        odd:= odd + 1;

      dni:= dni div 10;
    end;

  decompose:= even = odd;
end;

procedure deteleNode (var l: list; id: integer);
var
  prev, current: list;
begin
  // prev => anterior  current => actual
  current:= l;

  while ((current <> nil) and (current^.element.id <> id)) do
    begin
      prev:= current;
      current:= current^.next;
    end;

  if ((current <> nil) and (current^.element.id = id)) then
    begin
      prev^.next:= current^.next;
      dispone(current);
    end;
end;

function findGen (l: list; id: integer): integer;
begin
  while ((l <> nil) and (l^.element.id <> id)) do
    l:= l^.next;

  findGen:= l^.element.idGen;
end;

procedure actualizeList (l: list; average: real; id: integer);
begin
  while((l <> nil) and (l^.element.id <> id)) do
    l:= l^.next;

  l^.element.average:= average;
end;

procedure takeInfo (var c: critica);
begin
  writeln('ID peli: ');
  readln(c.id);
  if (c.id <> -1) then
    begin
      writeln('DNI critico: ');
      readln(c.dni);
      writeln('Nombre completo del crit: ');
      readln(c.fullname);
      writeln('Puntaje de la peli: ');
      readln(c.points);
    end;
end;

procedure roamList (l: list);
var
  crit: critica;
  v: vecGen;
  actual, counter: integer;
  gen: rangeGen;
  average: real;
begin
  initializeVec(v);
  takeInfo(crit);

  while (crit.id <> -1) do
    begin
      actual:= crit.id;
      counter:= 0;
      average:= 0;
      gen:= findGen(l, actual);

      while ((crit.id <> -1) and (actual = crit.id)) do
        begin
          average:= average + crit.point;
          counter:= counter + 1;
          actVec(v, gen, crit.point);
          
          if (decompose(crit.dni)) then
            writeln('Nombre y apellido: ', crit.fullname);
          
          takeInfo(crit);
        end;
      
      average:= average / counter;

      actualizeList(l, average, actual);
    end;

  max(v);
end;
  {
    se dispone de una lista de peliculas
    pelicula: id, name, idGen (1..8), average (sin orden)

    a) actualizar (la l que se dispone) average, los criticos: dni, fullname, id, points. corta con -1 (corte de control)
    b) informar el codGen que tiene mas pts entre las criticas
    c) informar fullname de criticos con pares e impares por igual en dni
    d) modulo que elmine una peli (puede no existir)
  }
var
  l: list;
begin
  l:= nil;

  chargeList(l); // se dispone
  roamList(l);
  deteleNode(l, 123);
end.
