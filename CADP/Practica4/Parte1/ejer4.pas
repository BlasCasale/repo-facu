program ejer4;
  {
    vector de 100 numeros
    findIndex
    swap x por y (entre 1 y 100)
    reduce
    promedio
    maxValue
    minValue
  }
const
  long = 100;
type
  vec = array [0..99] of integer;
function findIndex (v: vec; x: integer): integer;
var
  i: integer;
begin
  i:= 0;
  while (i <= long) do
    begin
      if (x = v[i]) then
        findIndex:= i;
      i:= i + 1;
    end;
  findIndex:= -1;
end;
procedure swapValues (x, y: integer; var v: vec);
var
  one, two: integer;
begin
  one:= v[x];
  two:= v[y];
  v[x]:= two;
  v[y]:= one;
end;
function reduce (v: vec): integer;
var
  i, total: integer;
begin
  total:= 0;
  for i:= 0 to 99 do
    total:= v[i] + total;
  reduce:= total;
end;
function average (v: vec): real;
var
  i: integer;
  ave: real;
begin
  ave:= 0;
  for i:= 0 to 99 do
    ave:= ave + v[i];
  ave:= ave / long;
end;
function maxValue (v: vec): integer;
var
  i, max: integer;
begin
  max:= -1;
  for i:= 0 to 99 do
    begin
      if (v[i] >= max) then
        max:= i;
    end;
  maxValue:= max;
end;
function minValue (v:vec): integer;
var
  i, min: integer;
begin
  min:= 99999;
  for i:= 0 to 99 do
    begin
      if (v[i] <= min) then
        min:= i;
    end;
  function:= min;
end;
procedure takeInfo (var v: vec; var dimL: integer);
var
  i, data: integer;
begin
  i:= 0;
  read(data);
  while ((i <= (long -1)) and (data <> 0)) do
    begin
      v[i]:= data;
      read(data);
      i:= i + 1;
    end;
  dimL:= i + 1;
end;
var
  
begin
  {Programa principal}
end.
