program ejer7;
const
  cut = -1;
  long = 9;
type
  vec = array [0..long] of integer;
procedure initializeVec (var v: vec);
var
  i: integer;
begin
  for i:= 0 to long do
    v[i]:= 0;
end;
procedure countOcurrences (var v: vec; num: integer);
var
  aux: integer;
begin
  while (num <> 0) do
    begin
      aux:= num mod 10;
      v[aux]:= v[aux] + 1;
      num:= num div 10;
    end;
end;
procedure mostOcurrences (v: vec);
var
  i, max: integer;
begin
  max:= -1;
  for i:= 0 to long do
    begin
      if (max <= v[i]) then
        max:= i;
    end;
  write('El numero con mayor ocurrencias es el ', i);
end;
procedure noOcurrences (v: vec);
var
  i: integer;
begin
  for i:= 0 to long do
    begin
      if (v[i] = 0) then
        write('El digito ', i , ' no tuvo ocurrencias');
    end;
end;
var
  v: vec;
  number: integer;
begin
  write('Ingrese un numero: ');
  read(number);
  initializeVec(v);
  while (number <> -1) do
    begin
      countOcurrences(v, number);
      read(number);
    end;
  mostOcurrences(v);
  noOcurrences(v);
end.
