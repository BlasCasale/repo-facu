program ejer2;
const
  long = 499;
  cut = 'ZZZ';
type
  vec = array [0..long] of string;
procedure deleteName (var v: vec; var dimL: integer; name: string; var ok: boolean);
var
  i, aux: integer;
begin
  ok:= false;
  aux:= 0;
  while ((aux <= dimL) and (not ok)) do
    begin
      if (name = v[aux]) then
        begin
          for i:= aux to dimL do
            v[i]:= v[i + 1];
          ok:= true;
          dimL:= dimL - 1;
        end;
      aux:= aux + 1;
    end;
end;
procedure insert (var v: vec; dimL: integer; name: string; var ok: boolean);
var
begin
  ok:= false;
  if (4 <= dimL) then
    begin
      v[4]:= name;
      ok:= true;
    end;
end;
procedure addName (var v: vec; var dimL:integer; var ok: boolean; name: string);
begin
  ok:= false;
  if ((dimL + 1) <= (long + 1)) then
    begin
      v[dimL]:= name;
      ok:= true;
      dimL:= dimL + 1;
    end;
end;
  {
    leer nombres de alumnos y almacenarlos en un vector de hasta 500 elementos, finaliza cuando se lee el nombre zzz {while}
    leer un nombre y eliminar la primera ocurrencia en el vector
    leer un nombre e insertar en la posicion 4
    leer un nombre y agregarlo al vector
  }
var
  dimL: integer;
  name: string;
  v: vec;
  ok: boolean;
begin
  dimL:= 0;
  write('Ingrese el nombre del alumno: ');
  read(name);
  while (name <> cut) do
    begin
      addName(v, dimL, ok, name);
      write('Ingrese otro nombre: ');
      read(name);
    end;
  write('Ingrese el nombre para insertarlo en el indice 4: ');
  read(name);
  insert(v, dimL, name, ok);
  write('Ingrese el nombre del alumno que se quiere borrar: ');
  read(name);
  deleteName(v, dimL, name, ok);
end.
