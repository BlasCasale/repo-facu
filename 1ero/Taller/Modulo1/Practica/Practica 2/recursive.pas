{1.- Implementar un programa que invoque a los siguientes m�dulos.
a. Un m�dulo recursivo que retorne un vector de a lo sumo 15 n�meros enteros �random� mayores a 10 y menores a 155 (incluidos ambos).
La carga finaliza con el valor 20.
b. Un m�dulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un m�dulo recursivo que reciba el vector generado en a) e imprima el contenido del vector. X
d. Un m�dulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.
e. Un m�dulo recursivo que reciba el vector generado en a) y devuelva el m�ximo valor del vector. X
f. Un m�dulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario. X
g. Un m�dulo que reciba el vector generado en a) e imprima, para cada n�mero contenido en el vector, sus d�gitos en el orden en que aparecen en el n�mero.
Debe implementarse un m�dulo recursivo que reciba el n�mero e imprima lo pedido. Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const dimF = 15;
      min = 10;
      max = 155;
type vector = array [1..dimF] of integer;

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var valor: integer;
  begin
    valor:= min + random (max - min + 1);
    if ((valor <> 20 ) and (dimL < dimF)) 
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);
         end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;
 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);

procedure recursionInterna (v: vector; dimL: integer; var i: integer);
begin
  if (i <= dimL) then
    begin
      writeln(v[i]);
      i:= i + 1;
      recursionInterna(v, dimL, i);
    end;
end;

var
  i: integer;
begin
  i:= 1;
  recursionInterna(v, dimL, i);
end; 
    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos <= dimL)  
    then SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else SumarRecursivo:=0  
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer;

function buscar (v: vector; dimL, i, max: integer): integer;
begin
    if (i <= dimL) then
      begin
        if (max <= v[i]) then
          max:= v[i];
        i:= i + 1;
        max:= buscar(v, dimL, i, max);
      end;
end;

var
  i, max: integer;
begin
  max:= -1;
  i:= 1;
  max:= buscar(v, dimL, i, max);
  ObtenerMaximo:= max;
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;

procedure buscar (v: vector; dimL, valor, i: integer; ok: boolean);
begin
  if ((i <= dimL) and (not ok)) then
    begin
      if (v[i] = valor) then
        ok:= true;
      else
        begin
          i:= i + 1;
          buscar(v, dim, valor, i, ok);
        end;
    end;
end;

var
  i: integer;
  ok: boolean;
begin
  ok:= false;
  i:= 1;
  BuscarValor:= ok;
end; 

procedure ImprimirDigitos (v: vector; dimL: integer);

procedure descomponer (num: integer);
begin
  if (num <> 0) then
    begin
      writeln(num mod 10);
      num:= num div 10;
      descomponer(num);
    end;
end;

procedure recorrerVec (v: vector; dimL, i: integer);
begin
  if (i <= dimL) then
    begin
      descomponer(v[i]);
      i:= i + 1;
      recorrerVec(v, dimL, i);
    end;
end;

var
  i: integer;
begin
  i:= 1;
  recorrerVec(v, dimL, i);
end; 

var dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);
                     {  ImprimirVectorRecursivo (v, dimL);}
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);
end.