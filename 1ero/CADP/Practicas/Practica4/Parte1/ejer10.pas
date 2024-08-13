program ejer10;
  {
    programa que lea a lo sumo 300 empleados
    corta cuando el salario es 0 {while}
    realizar un modulo que incremente el sueldo en un 15%, recibe por param valor real X, el vec y la dimL
    realizar un modulo que muestre en pantalla el sueldo promedio de los empleados
  }
const
  long = 299;
  cut = 0;
type
  vec = array [0..long] of real;
procedure incrementSalaries (x: real; var v: vec; dimL: integer);
var
  i: integer;
begin
  for i:= 0 to dimL do
    v[i]:= ((v[i] * x) / 100) + v[i];
end;
function getAverage (v: vec; dimL: integer): real;
var
  average: real;
  i: integer;
begin
  average:= 0;
  for i:= 0 to dimL do
    average:= average + v[i];
  getAverage:= average / dimL;
end;
var
  v: vec;
  i: integer;
  data: real;
begin
  write('Ingrese un salario (0 para cortar la ejecucion): ');
  readln(data);
  i:= 0;
  while (data <> 0) do
    begin
      v[i]:= data;
      i:= i + 1;
      writeln('Ingrese un salario (0 para cortar la ejecucion): ');
      readln(data);
    end;
  if (i <> 0) then
    begin
      incrementSalaries(15, v, i);
      getAverage(v, i);
    end;
end.
