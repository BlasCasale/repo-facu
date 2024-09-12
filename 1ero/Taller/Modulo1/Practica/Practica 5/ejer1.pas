program blas;
const
	cut = 0;
	start = 0;
	finish = 300;
type
	range = start..finish;
	
	officeObj = record
		id: integer;
		dni: integer;
		expense: real;
	end;
	
	vector = array [range] of officeObj;

	vec = record
		dato: vector;
		dimL: range;
	end;
	
{
	El administrador de un edificio de oficinas tiene la información del pago de las expensas
	de dichas oficinas. Implementar un programa con:
	a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
	administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
	propietario y valor de la expensa. La lectura finaliza cuando llega el código de
	identificación 0.
	b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
	código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
	vistos en la cursada.
	c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
	generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
	retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
	Luego el programa debe informar el DNI del propietario o un cartel indicando que no
	se encontró la oficina.
	d) Un módulo recursivo que retorne el monto total de las expensas
}
procedure cargarVec (var v: vec);
var
	aux: integer;
begin
	v.dimL:= 0;
	aux:= random(301);
	while (aux <> cut) and (v.dimL < finish) do
		begin
			v.dimL:= v.dimL + 1;
			v.dato[v.dimL].id:= aux;
			v.dato[v.dimL].dni:= random(1000) + 1;
			v.dato[v.dimL].expense:= random(250) + ((random(100) + 1) / 100);
			aux:= random(301);
		end;
end;

procedure selectionVec (var v: vec);
var
	i, j, posi: range;
	value: officeObj;
begin
	if (v.dimL <> 0) then
		begin
			for i:= 1 to v.dimL - 1 do
				begin
					posi:= i;
					for j:= i + 1 to v.dimL do
						begin
							if (v.dato[j].id < v.dato[posi].id) then
								posi:= j;
						end;
					value:= v.dato[posi];
					v.dato[posi]:= v.dato[i];
					v.dato[i]:= value;
				end;
		end;
end;

procedure printVec (v: vec);

procedure print (v: vec; i: range);
begin
	if (v.dimL >= i) then
		begin
			writeln('id: ', v.dato[i].id);
			writeln('dni: ', v.dato[i].dni);
			writeln;
			writeln;
			writeln;
			i:= i + 1;
			print(v, i);
		end;
end;
var
	i: range;
begin
	i:= 1;
	print(v, i);
end;

var
	v: vec;
BEGIN
	randomize;
	cargarVec(v);
	selectionVec(v);
	printVec(v);
	
END.

