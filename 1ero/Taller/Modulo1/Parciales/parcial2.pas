program parcial2;

type

	{
		una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes durante el año 2023.
		a) implementar un modulo que lea informacion de las atenciones y retorne un vector donde se almacenen las atenciones agrupadas por mes.
		Las atenciones de cada mes deben quedan almacenadas en un arbol binario de busqueda ordenado por DNI del paciente y solo deben almacenarse 
		DNI del pacienete y codigo de diagnostico.
		De cada atencion se lee: matricula del medico, DNI del paciente, mes y diagnostico (valor entre L y P). La lectura finaliza con la
		matricula 0
		b) implementar un modulo recursivo que reciba el vector generado en a) y retorne el mes con mayor cantidad de atenciones
		c) implementar un modulo que reciba el vector generado en a) y un DNI de paciente, y retorne si fue atendido o no, el paciente
		con el DNI ingresado
	}
	
	meses = 1..12;
	
	atencion = record
		matricula: integer;
		dni: integer;
		mes: meses;
		diagnostico: char;
	end;
	
	datoA = record
		dni: integer;
		diagnostico: char;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: datoA;
		hi: arbol;
		hd: arbol;
	end;
	
	vecMeses = array [meses] of arbol;
	
procedure leerAt (var a: atencion);
var
	v: array [1..5] of char = ('L', 'M', 'N', 'O', 'P');
begin
	a.matricula:= random(1000);
	if (a.matricula <> 0) then
		begin
			a.dni:= random(3000) + 1;
			a.mes:= random(12) + 1;
			a.diagnostico:= v[random(5) + 1];
		end;
end;

procedure iniciarVec (var v: vecMeses);
var
	i: integer;
begin
	for i:= 1 to 12 do
		v[i]:= nil;
end;

procedure crearArbol (var a: arbol; at: atencion);
begin
	if (a = nil) then
		begin
			new(a);
			a^.hi:= nil;
			a^.hd:= nil;
			a^.dato.dni:= at.dni;
			a^.dato.diagnostico:= at.diagnostico;
		end
	else
		begin
			if (a^.dato.dni > at.dni) then
				crearArbol(a^.hi, at)
			else
				crearArbol(a^.hd, at);
		end;
end;

procedure resolverCreacion (var v: vecMeses);
var
	a: atencion;
begin
	leerAt(a);
	while (a.matricula <> 0) do
		begin
			crearArbol(v[a.mes], a);
			leerAt(a);
		end;
end;

procedure contarCant (a: arbol; var cant: integer);
begin
	if (a <> nil) then
		begin
			if (a^.hi <> nil) then
				contarCant(a^.hi, cant);
			cant:= cant + 1;
			if (a^.hd <> nil) then
				contarCant(a^.hd, cant);
		end;
end;

function encontrarMax (v: vecMeses): meses;
var
	i, cant, max: integer;
	mes: meses;
begin
	max:= -1;
	for i:= 1 to 12 do
		begin
			cant:= 0;
			contarCant(v[i], cant);
			if (cant >= max) then
				begin
					max:= cant;
					mes:= i;
				end;
		end;
	encontrarMax:= mes;
end;

procedure imprimir (a: arbol);
begin
	if (a <> nil) then
		begin
			if (a^.hi <> nil) then
				imprimir(a^.hi);
			writeln(a^.dato.dni);
			writeln;
			if (a^.hd <> nil) then
				imprimir(a^.hd);
		end;
end;

procedure imprimirArbol (v: vecMeses);
var
	i: integer;
begin
	for i:= 1 to 12 do
		imprimir(v[i]);
end;

procedure encontrar (a: arbol;var ok: boolean; dni: integer);
begin
	if ((a <> nil) and (not ok)) then
		begin
			if (a^.dato.dni = dni) then
				ok:= true
			else
				begin
					if (a^.dato.dni > dni) then
						encontrar(a^.hi, ok, dni)
					else
						encontrar(a^.hd, ok, dni);
				end;
		end;
end;

procedure encontrarDNI (v: vecMeses;var ok: boolean; dni: integer);
var
	i: integer;
begin
	i:= 1;
	while ((i <= 12) and (not ok)) do
		begin
			encontrar(v[i], ok, dni);
			i:= i + 1;
		end;
end;
var
	v: vecMeses;
	ok: boolean;
begin
	randomize;
	iniciarVec(v);
	resolverCreacion(v);
	writeln('El mes con mas atenciones: ', encontrarMax(v));
	imprimirArbol(v);
	ok:= false;
	encontrarDNI(v, ok, 123);
	writeln;
	writeln(ok);
end.
