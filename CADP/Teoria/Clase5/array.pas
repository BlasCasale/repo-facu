program nombrePrograma;
const
  long = 9;
{
  obviamente es un tipo de dato compuesto
  el array o vector es una estructura de datos homogenea porque siempre ingresan datos del mismo tipo
  es de tipo estatica porque se define la longitud al momento de declararla
  es indexada y lineal porque para acceder a un elemento se accede por el indice y es de tipo ordinal
}
type
  { nombre = array [rango] of tipo }
  { el rango debe ser de tipo ordinal (char, integer, boolean, subrango) }
  {
    el tipo debe ser de tipo estatico
    char, entero, booleano, subrango, real, registro, vector
  }
  vector = array [0..long] of integer;
procedure chargeInfo (var vec: vector);
var
  i, value: integer;
begin
  for i:= 0 to long do
    read(vec[i]);
end;
procedure showInfo (vec: vector);
var
  i: integer;
begin
  for i:= 0 to long do
    write(vec[i]);
end;
function maxNumber (vec: vector): integer;
var
  i, max: integer;
begin
  max:= -1;
  for i:= 0 to long do
    begin
      if (vec[i] >= max) then
        max:= vec[i];
    end;
  maxNumber:= max;
end;
function verify (vec: vector; value: integer): integer;
var
  i, quan: integer;
begin
  quan:= 0;
  for i:= 0 to long do
    begin
      if (value = vec[i]) then
        quan:= quan + 1;
    end;
  verify:= quan;
end;
var
  firtsArray, secondArray: vector;
  i, j, value: integer;
begin
  { cargar valores, solo se puede asignar un vector a otro, como los objetos }
  { con los elementos puedo hacer cualquier tipo de operacion }
  { no se puede hacer read(firstArray) }
  // i:= 1;
  // j:= 8;
  // secondArray:= firtsArray;
  // firtsArray[0]:= 4;
  // firtsArray[i]:= 2;
  // firtsArray[j]:= 0;
  { [4, 2, , , , , , , 0, ] }

  for i:= 0 to long do
    begin
      // read(value);
      // firstArray[i]:= value;
      read(firstArray[i]);
    end;

  read(value);
  j:= 4;
  for i:= dimL downTo j do
    firstArray[i + 1]:= firstArray[i];
    if (j=i) then firstArray[i] := value;
  
  chargeInfo(secondArray);
  showInfo(secondArray);
end.
