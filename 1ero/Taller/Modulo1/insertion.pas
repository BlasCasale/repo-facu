program insertion;
  {
    necesitamos saber la dimL
    posicion que se debe comparar
    cuantos elementos estan ordenados
    
    se arranca desde la segunda posicion del arreglo
  }
type
  vec = array [0..9] of integer;

var
  v: vec;
  dimL, i, j, value: integer;
begin
  for i:= 1 to dimL do
    begin
      value:= v[i];
      j:= i - 1;
      while ((j > -1) and (v[j] > value)) do
        begin
          v[j + 1]:= v[j];
          j:= j - 1;
        end;
      v[j + 1]:= actual;
    end;
end.
