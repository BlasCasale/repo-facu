program ejer1;
const
  long = 499;
type
  vec = array [0..long] of integer; 
function findN (v: vec; n, dimL: integer): boolean;
var
  i: integer;
  exist: boolean;
begin
  i:= 0;
  exist:= false;
  while ((i <= dimL) and (not exist)) do
    begin
      if (v[i] = n) then
        exist:= true;
      i:= i + 1;
    end;
  findN:= exist;
end;
function findNAsc (v: vec; n, dimL: integer): boolean;
var
  i: integer;
  ok: boolean;
begin
  i:= 0;
  ok:= false;
  while ((i <= (dimL -1)) and (not ok)) do
    begin
      if (v[i] = n) then
        ok: true;
      i:= i + 1;
    end;
  findN:= ok;
end;
var
  v: vec;
  dimL: integer;
begin
  cargar(v,dimL);
end.
