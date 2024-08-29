program ejer3;
const 
  start = 0;
  dimF = 19;
  min = 300;
  max = 1550; // uno mas para que retorne hasta 1550
  {
    Implementar un programa que invoque a los siguientes módulos.
    a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
    y menores a 1550 (incluidos ambos). X
    b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
    en la práctica anterior) X
    c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
    encabezado: 
    Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
    Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
    en el vector.
    Desafío...
  }
type
  range = start..dimF;
  rangeNumbers = min..max;
  vecT = array [range] of rangeNumbers;

  vec =  record
    v: vecT;
    dimL: range;
  end;

procedure chargeVecRecursive (var v: vec);
var
  value: integer;
begin
  if (v.dimL <= dimF) then
    begin
      value:= min + random((max + 1) - min);
      v.v[v.dimL]:= value;
      v.dimL:= v.dimL + 1;
      if (v.dimL < dimF) then
        chargeVecRecursive(v);
    end;
end;

// ordenar por seleccion
procedure selectionVec (var v: vec);

// con este procedimiento avanzo sobre la segunda seleccion
procedure secondAdvance (v: vec; var posi, j: integer);
begin
  if (j <= (v.dimL - 1)) then
    begin
      if (v.v[j] < v.v[posi]) then
        posi:= j;
      j:= j + 1;
      secondAdvance(v, posi, j);
    end;
end;

// con este procedimiento avanzo sobre el primer indice
procedure firstAdvance (var v: vec; i, j, posi, value: integer);
begin
  if (i <= (v.dimL -2)) then
    begin
      posi:= i;
      j:= i + 1;
      secondAdvance(v, posi, j);
      value:= v.v[posi];
      v.v[posi]:= v.v[i];
      v.v[i]:= value;
      i:= i + 1;
      firstAdvance(v, i, j, posi, value);
    end;
end;

var
  i, j, posi, value: integer;
begin
  i:= 0;
  j:= 0;
  value:= 0;
  posi:= 0;
  firstAdvance(v, i, j, posi, value);
end;

procedure printRecursive (v: vec);

procedure advance (v: vec; var i: integer);
begin
  if (i < v.dimL) then
    begin
      writeln(v.v[i]);
      i:= i + 1;
      advance(v, i);
    end;  
end;

var
  i: integer;
begin
  i:= 0;
  advance(v, i);
end;

procedure dichotomous (v: vec; value: integer; var pos: integer);

procedure dicho (v: vec; value: integer; var pos: integer; first, last, mid: range);
begin
  mid:= (first + last) div 2;
  if ((first <= last) and (value <> v.v[mid])) then
    begin
      if (value < v.v[mid]) then
        last:= mid - 1
      else
        first:= mid + 1;
      mid:= (first + last) div 2;
    end;
  
  if ((first <= last) and (value <> v.v[mid])) then
    dicho(v, value, pos, first, last, mid)
  else
    begin
      if (value = v.v[mid]) then
        pos:= mid
      else
        pos:= - 1;
    end;
end;

var
  mid, first, last: range;
begin
  first:= 0;
  last:= v.dimL;
  dicho(v, value, pos, first, last, mid);
end;

var
  v: vec;
  pos: integer;
  value: integer;
begin
  randomize;
  value:= 1030;
  v.dimL:= 0; // inicializo la dimen del vec para que funcione el modulo
  chargeVecRecursive(v);
  selectionVec(v);
  printRecursive(v);
  dichotomous(v, value, pos);
  writeln('Pos: ', pos);
end.
