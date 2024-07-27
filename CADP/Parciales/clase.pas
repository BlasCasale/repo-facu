program viajes;
type
	rango_mes=1..12;
	rango_ciudad=1..20;
	
	viaje=record
		cod_tren:integer;
		mes_viaje:rango_mes;
		pasajero:integer;
		cod_ciudad:rango_ciudad;
	end;

	lista=^nodo;

	nodo=record
		dato:viaje;
		sig:lista;
	end;

	vector_mes=array[rango_mes] of real;

	vector_costo=array[rango_ciudad] of real; //se dispone
	
	tren=record
		cod:integer;
		cant_viajes:integer;
	end;

	lista2=^nodo2;

	nodo2=record
		dato:tren;
		sig:lista2;
	end;

procedure cargar_lista(var l:lista); //se dispone
procedure inicializar_vector_costo(var vc:vector_costo); //se dispone

procedure inicializar_vector_mes(var vm:vector_mes);
var i:integer;
begin
	for i:=1 to 12 do
		vm[i]:=0;
end;

procedure agregar_adelante(var l2:lista2; t: tren);
var
	nue:lista2;
begin
	new(nue);
	nue^.dato:=t;
	nue^.sig:=l2;
	l2:=nue;
end;

procedure actualizar_vector (var v: vector_mes; vc: vector_costo; mes: rango_mes; ciu: rango_ciudad);
begin
  v[mes]:= v[mes] + vc[ciu];
end;

procedure max (vm: vector_mes);
var
  i, mes: integer;
  max: real;
begin
  max:= -1;

  for i:= 1 to 12 do
    begin
      if (vm[i] >= max) then
        begin
          mes:= i;
          max:= vm[i];
        end;
    end;

  writeln('Mes con mayor recaudacion ', mes);
end;

procedure recorrer_lista(l:lista; var l2:lista2);
var
  vc: vector_costo;
  vm: vector_mes;
  actual, mes, ciu, contador: integer;
  t: tren;
  promedio: real;
begin

  inicializar_vector_mes(vm);
  inicializar_vector_costo(vc);

	while (l <> nil) do
	begin
    actual:= l^.dato.cod_tren;
    // contador para contar los viajes hechos
    contador:= 0;
    // contador de pasajeros
    promedio:= 0;

    while ((l <> nil) and (actual = l^.dato.cod_tren)) do
      begin
        contador:= contador + 1;
        mes:= l^.dato.mes_viaje;
        ciu:= l^.dato.cod_ciudad;
        actualizar_vector(vm, vc, mes, ciu);
        promedio:= l^.dato.pasajero;
        l:= l^.sig;
      end;

    promedio:= promedio / contador;
    write('Promedio de pasajeros ', promedio:0:2);
    // actualizamos registro para insertar en la segunda lista
    t.cant_viajes:= contador;
    t.cod:= actual;
    agregar_adelante(l2, t);
  end;

  max(vm);
end;

  {
    generar lista por cod tren, cant viajes
    informar mes con mayor monto
    informar promedio pas por tren entre todos sus viajes
  }

var
  l: lista;
  l2: lista2;
begin
  l:= nil;
  l2:= nil;

  cargar_lista(l); // se dispone
  recorrer_lista(l, l2);
end;