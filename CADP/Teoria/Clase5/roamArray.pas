program nombrePrograma;
const
  long = 9;
  multi = 3;
  {
    el recorrido puede ser parcial o total (por diferentes razones)
  }
type
  vector = array [0..long] of integer;
procedure chargeInfo (var vec: vector);
var
  i, value: integer;
begin
  for i:= 0 to long do
    read(vec[i]);
end;
function countMulti (arr: vector): integer;
var
  i, quan: integer;
begin
  for i:= 0 to long do
    begin
      if ((arr[i] mod multi) = 0) then
        quan:= quan + 1;
    end;
  countMulti:= quan;
end;
function findMulti (arr: vector): integer;
var
  i: integer;
begin
  i:= 0;
  { el menor estricto sirve para recorrerlo y entrar en el ultimo }
  { se puede hacer esto? sin usar el boolean, porque si no encuentro nada, se que no me salgo con el while }
  while ((i <= long)) do
    begin
      if ((arr[i] mod multi) = 0) then
        findMulti:= i;
      i:= i + 1;
    end;
  write('No se encontro multi de ', multi);
end;
var
  arr: vector;
  quan: integer;
begin
  chargeInfo(arr);
  write(countMulti(arr));
end.
