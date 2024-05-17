type
  notes = record
    notas: array [0..29] of real;
    dimL:integer;
    prom: real;
    nombre: string;
  end;

  alumnos = array [0..99] of notes;
  
function maximo (v: alumnos): integer;
var 
  i, indice, max: integer;
begin
  max:= -1;
  i:= 0;
  while (i <= v[i].dimL) do
    begin
      if (v[i].prom >= max) then
        begin
          max:= v[i].prom;
          indice:= v[i];
        end;
        i:= i + 1;
    end;
  function:= max;
end;

