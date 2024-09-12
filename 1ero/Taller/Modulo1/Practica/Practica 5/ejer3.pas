program ejer3;
const
	cut = 0;
type  
	categoryRange = 1..10;
	
	productObj = record
		id: integer;
		category: categoryRange;
		stock: integer;
		price: real;
	end;
	
	productShort = record
		id: integer;
		stock: integer;
		price: real;
	end;
	
	tree = ^node;
	
	node = record
		element: productShort;
		sl: tree;
		sr: tree;
	end;
		
	vecTrees = array [categoryRange] of tree;
	
	maxStock = record
		id: integer;
		stock: integer;
	end;
	
	vecMax = array [categoryRange] of maxStock;
	
	vecCounter = array [categoryRange] of integer;
	
procedure initializeCounter (var v: vecCounter);
var
	i: categoryRange;
begin
	for i:= 1 to 10 do
		v[i]:= 0;
end;

procedure initializeVecMax (var v: vecMax);
var
	i: categoryRange;
begin
	for i:= 1 to 10 do
		begin
			v[i].stock:= -1;
			v[i].id:= -1; 
		end;
end;
	
procedure initializeVec (var v: vecTrees);
var
	i: categoryRange;
begin
	for i:= 1 to 10 do
		v[i]:= nil;
end;

procedure readProd (var p: productObj);
begin 
	p.id:= random(1000);
	if (p.id <> cut) then
		begin
			p.stock:= random(1000) + 1;
			p.category:= random(10) + 1;
			p.price:= (random(100) / 100) + ((random(5) + 1) * 1.17); 
		end;
end;

procedure createTree (var t: tree; p: productObj);
begin
	if (t = nil) then
		begin
			new(t);
			t^.sl:= nil;
			t^.sr:= nil;
			t^.element.id:= p.id;
			t^.element.price:= p.price;
			t^.element.stock:= p.stock;
		end
	else
		begin
			if (t^.element.id > p.id) then
				createTree(t^.sl, p)
			else
				createTree(t^.sr, p);
		end;
end;

procedure solveCreation (var v: vecTrees);
var
	p: productObj;
begin
	readProd(p);
	while (p.id <> cut) do
		begin
			createTree(v[p.category], p);
			readProd(p);
		end;
end;

procedure printTree (t: tree);
begin
	if (t <> nil) then
		begin
			if (t^.sl <> nil) then
				printTree(t^.sl);
			writeln('id: ', t^.element.id);
			writeln('stock: ', t^.element.stock);
			writeln('price: ', t^.element.price:0:2);
			writeln;
			if(t^.sr <> nil) then
				printTree(t^.sr);
		end;
end;

procedure printVec (v: vecTrees);
var
	i: categoryRange;
begin
	for i:= 1 to 10 do
		begin
			writeln(i);
			if (v[i] <> nil) then
				printTree(v[i]);
			writeln;
		end;
end;

procedure findIdByCategory (v: vecTrees; value: integer; index: categoryRange; var id: integer; var ok: boolean);

procedure findId (t: tree; value: integer; var id: integer; var ok: boolean);
begin
	if ((t <> nil) and (not ok)) then
		begin
			if (t^.element.id = value) then
				ok:= true
			else if (t^.element.id > value) then
				findId(t^.sl,value, id, ok)
			else
				findId(t^.sr, value, id, ok);
		end;
end;

begin
	findId(v[index], value, id, ok);
end;

procedure findBiggerId (v: vecTrees; var vM: vecMax);

procedure roamTree (t: tree; var max: maxStock);
begin
	if (t <> nil) then
		begin
			if (t^.sr <> nil) then
				roamTree(t^.sr, max)
			else
				begin
					max.id:= t^.element.id;
					max.stock:= t^.element.stock;
				end;
		end;
end;

var
	i: categoryRange;
begin
	for i:= 1 to 10 do
		begin
			roamTree(v[i], vM[i]);
		end;
end;

procedure printMax (v: vecMax);
var
	i: integer;
begin
	for i:= 1 to 10 do
		begin
			if (v[i].id <> -1) then
				begin
					writeln('rubro: ', i);
					writeln('id: ', v[i].id);
					writeln('stock: ', v[i].stock);
					writeln;
				end;
		end;
end;

procedure actVec (var v: vecCounter; count: integer; index: categoryRange);
begin
	v[index]:= count;
end;

procedure solveCount (t: tree; var counter: integer; min, max: integer);
begin
	if (t <> nil) then
		begin
			if (t^.sl <> nil) then
				solveCount(t^.sl, counter, min, max);
			if ((t^.element.id >= min) and (t^.element.id <= max)) then
				counter:= counter + 1;
			if (t^.sr <> nil) then
				solveCount(t^.sr, counter, min, max);
		end;
end;

procedure splitTree (t: tree; var counter: integer; min, max: integer);
begin
	if (t <> nil) then
		begin
			if (t^.element.id > max) then
				solveCount(t^.sl, counter, min, max)
			else if (t^.element.id <= min) then
				solveCount(t^.sr, counter, min, max)
			else
				solveCount(t, counter, min, max);
		end;
end;

procedure countIdBetweenValues (v: vecTrees; var c: vecCounter; min, max: integer);
var
	counter: integer;
	i: categoryRange;
begin
	for i:= 1 to 10 do
		begin
			counter:= 0;
			splitTree(v[i], counter, min, max);
			if (counter <> 0) then
				actVec(c, counter, i);
		end;
end;

procedure printCounter (v: vecCounter);
var
	i: categoryRange;
begin
	for i:= 1 to 10 do
		begin
			writeln;
			if (v[i] <> 0) then
				writeln('index: ', i, ' cantidad: ', v[i]);
		end;
end;

  {
    Un supermercado requiere el procesamiento de sus productos. De cada producto se
    conoce código, rubro (1..10), stock y precio unitario. Se pide:
    a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
    vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
    más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
    b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
    de producto y retorne si dicho código existe o no para ese rubro.
    c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
    rubro, el código y stock del producto con mayor código.
    d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
    retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
    ingresados
  }

var
	v: vecTrees;
	vM: vecMax;
	c: vecCounter;
	id: integer;
	ok: boolean;
begin
	// inciso a
	initializeVec(v);
	solveCreation(v);
	printVec(v);
	// inciso b
	id:= -1;
	ok:= false;
	findIdByCategory(v, 201, 3, id, ok);
	if (ok) then
		writeln('Se encontro el id buscado')
	else
		writeln('No se encontro el id buscado');
	// inciso c
	initializeVecMax(vM);
	findBiggerId(v, vM);
	printMax(vM);
	// inciso d
	initializeCounter(c);
	countIdBetweenValues(v, c, 15, 401);
	printCounter(c);
end.
