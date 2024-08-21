program selection;
  {
    este algoritmo const de N vueltas, donde N es la dimension logica del arreglo
    en la primer vuelta busca el mas chico (si se quiere ordenar ascendentemente) e intercambia posicion con el primer elemento del arreglo, en la segunda arranca de la 2 y busca la posi del elemento mas chico que le sigue y lo cambia, asi hasta terminar el arreglo
  }
type
  vec = array [0..10] of integer;

var
  v: vec;
  i, j, posi, value, dimL: integer;
begin
  for i:= 0 to dimL - 1 do
    begin
      posi:= i;
      for j:= i + 1 to dimL do
        begin
          if v[j] < v[posi] then 
            posi:= j;
        end;
      value:= v[posi];
      v[posi]:= v[i];
      v[i]:= value;
    end;
end.
