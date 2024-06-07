program ejer3;
{
  vector de integer con dimF y dimL
  modulo que imprima desde la primera a la ultima posicion
  modulo que imprima desde la ultima a primera posicion
  modulo que imprima de la mitad de la dimL hacia la primera y desde la mitad mas 1 hasta el final
  modulo que reciba x e y, imprimir el vector desde x a y, puede ser que x sea mayor o menor a y
}
const
  numbers = 10;
  long = 9;
type
  vec = array [0..long] of integer;
procedure takeInfo (var vector: vec);
var
  i: integer;
begin
  for i:= 0 to long do
    read(vec[i]);
end;
procedure readInfo (vector: vec; dimL: integer);
var
  i: integer;
begin
  for i:= 0 to dimL do
    wirte(vector[i]);
end;
procedure readInverse (vector: vec; dimL: integer);
var
  i: integer;
begin
  for i:= dimL downTo 0 do
    write(vector[i]);
end;
procedure readHalf (vector:vec; dimL: integer);
var
  i,half:integer;  
begin
  half:= dimL div 2;
  for i:= 0 to half do
    wirte(vector[i]);
  half:= half + 1;
  for i:= half to dimL do
    write(vector[i]);
end;
procedure readPoints (vector: vec; x,y, dimL: integer);
var
  i:integer;
begin
  if (x > y) then
    begin
      for i:= x downTo y do
        write(vector[i]);
    end
  else
    begin
      for i:= y to x do
        write(vector[i]);
    end;
end;
begin

end.
