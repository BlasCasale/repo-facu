program add;
  {
    agregar es atras del ultimo elemento
  }
const
  long = 9;
type
  nums = array [0..long] of integer;
procedure add (var v: vec; value: integer; var dimL: integer; var ok: boolean);
var
begin
  ok: false;
  if ((dimL + 1) <= (long + 1)) then
    begin
      ok:= true;
      v[dimL]:= value;
      dimL:= dimL + 1;
    end;
end;
procedure insert (var v: vec; var dimL: integer; value, posi: integer; var ok: boolean);
var
  i: integer;
begin
  ok:= false;
  if (((dimL + 1) <= (long + 1)) and (posi <= 0) and (posi <= dimL)) then
    begin
      for i:= dimL downTo posi do
        v[i]:= v[i - 1];
      v[posi]:= value;
      dimL:= dimL + 1;
      ok:= true;
    end;
end;
procedure delete (var v: vec; var dimL: integer; posi: integer; var ok: boolean);
var
  i: integer;
begin
  ok:= false;
  if ((posi >= 0) and (posi <= dimL)) then
    begin
      for i:= posi to dimL do
        v[i]:= v[i + 1];
      dimL:= dimL - 1;
      ok:= true;
    end;
end;
var
  {Variables}

begin
  {Programa principal}
end.
