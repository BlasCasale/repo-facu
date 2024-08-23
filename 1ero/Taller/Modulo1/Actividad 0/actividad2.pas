program actividad2;
const
  start = 0;
  dimF = 49;
type
  range = start..dimF;

  vec = array [range] of integer;

  vecT = record
    v: vec;
    dimL: range;
  end;
procedure chargeVec (var v: vecT; min, max, cut: integer);
var
  value: integer;
begin
  value:= random(max);
  while ((v.dimL < dimF) and (value <> cut)) do
    begin
      while ((value < min) and (value <> cut)) do
        value:= random(max);
      if (value <> cut) then
        begin
          v.v[v.dimL]:= value;
          v.dimL:= v.dimL + 1;
        end;
      value:= random(max);
    end;
end;
procedure initializeVec (var v: vec);
var
  i: integer;
begin
  for i:= 0 to dimF do
    v[i]:= 0;
end;
procedure printVec (v: vecT);
var
  i: integer;
begin
  // derecho
  // i:= 0;
  // while (i < v.dimL) do
  //   begin
  //     writeln(v.v[i]);
  //     i:= i + 1;
  //   end;

  // inverso
  i:= v.dimL;
  while (i <> 0) do
    begin
      writeln(v.v[i]);
      i:= i - 1;
    end;
end;
var
  v: vecT;
  max, min, cut: integer;
begin
  randomize;

  writeln('Ingrese un minimo: ');
  readln(min);
  writeln('Ingrese un maximo: ');
  readln(max);
  writeln('Ingrese el numero de corte: ');
  readln(cut);

  v.dimL:= 0;
  initializeVec(v.v);

  chargeVec(v, min, max, cut);

  printVec(v);
end.
