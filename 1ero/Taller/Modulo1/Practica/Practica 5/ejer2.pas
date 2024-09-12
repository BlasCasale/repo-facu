program ejer2;
const
  cut = 'MMM';
type

  years = 2010..2018;

  // primer arbol

  brandVec = array [1..5] of string;

  modelVec = array [1..3] of string;

  carObj = record
    patent: integer;
    year: years;
    brand: string;
    model: string;
  end;

  tree = ^node;

  node = record
    element: carObj;
    sl: tree;
    sr: tree;
  end;

  // segundo arbol

  list = ^nodeList;

  carShort = record
    patent: integer;
    year: years;
    model: string;
  end;

  nodeList = record
    element: carShort;
    next: list;
  end;

  dataObj = record
    brand: string;
    next: list;
  end;

  secondTree = ^secondNode;

  secondNode = record
    element: dataObj;
    sl: secondTree;
    sr: secondTree;
  end;

procedure readCar (var c: carObj; brand: brandVec; model: modelVec);
begin
  c.brand:= brand[random(5) + 1];
  if (c.brand <> cut) then
    begin
      c.model:= model[random(3) + 1];
      c.year:= 2010 + (random((2018 - 2010)+1));
      c.patent:= random(1000);
    end;
end;

procedure createTree (var t: tree; c: carObj);
begin
	if (t = nil) then
		begin
			new(t);
			t^.sl:= nil;
			t^.sr:= nil;
			t^.element:= c;
		end
	else if (t^.element.patent > c.patent) then
		createTree(t^.sl, c)
	else
		createTree(t^.sr, c);
end;

procedure createTreeYear (t: tree; var ty: tree);

procedure insertTree (var ty: tree; c: carObj);
begin
	if (ty = nil) then
		begin
			new(ty);
			ty^.sl:= nil;
			ty^.sr:= nil;
			ty^.element:= c;
		end
	else
		begin
			if (ty^.element.year > c.year) then
				insertTree(ty^.sl, c)
			else
				insertTree(ty^.sr, c);
		end;
end;

begin
	if (t <> nil) then
		begin
			if (t^.sl <> nil) then
				createTreeYear(t^.sl, ty);
			insertTree(ty, t^.element);
			if (t^.sr <> nil) then
				createTreeYear(t^.sr, ty);
		end;
end;

procedure createSecondTree (var st: secondTree; c: carObj);
procedure addNode (var l: list; sc: carShort);
var
	newNode: list;
begin
	new(newNode);
	newNode^.next:= l;
	newNode^.element:= sc;
	l:= newNode;
end;

var
	sc: carShort;
begin
	sc.patent:= c.patent;
	sc.year:= c.year;
	sc.model:= c.model;
	if (st = nil) then
		begin
			new(st);
			st^.sl:= nil;
			st^.sr:= nil;
			st^.element.brand:= c.brand;
			st^.element.next:= nil;
			addNode(st^.element.next, sc);
		end
	else
		begin
			if (st^.element.brand = c.brand) then
				addNode(st^.element.next, sc)
			else if (st^.element.brand > c.brand) then
				createSecondTree(st^.sl, c)
			else
				createSecondTree(st^.sr, c);
		end;
end;

  {
    Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
    los autos en venta. Implementar un programa que:
    a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
    modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
    i. Una estructura eficiente para la búsqueda por patente.
    ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
    almacenar todos juntos los autos pertenecientes a ella.
    b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
    cantidad de autos de dicha marca que posee la agencia.
    c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
    la cantidad de autos de dicha marca que posee la agencia.
    d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
    la información de los autos agrupados por año de fabricación.
    e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
    modelo del auto con dicha patente.
    f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
    modelo del auto con dicha patente.
  }
  
procedure findInSecondTree (st: secondTree; patent: integer; var model: string);

procedure findInList (l: list; patent: integer; var model: string);
begin
	if ((l <> nil) and (model <> '')) then
		begin
			if (l^.element.patent = patent) then
				model:= l^.element.model;
			findInList(l^.next, patent, model);
		end;
end;

begin
	if ((st <> nil) and (model <> '')) then
		begin
			findInList(st^.element.next, patent, model);
			if (st^.sl <> nil) then
				findInSecondTree(st^.sl, patent, model);
			if (st^.sr <> nil) then
				findInSecondTree(st^.sr, patent, model);
		end;
end;

procedure findPatent (t: tree; patent: integer; var model: string);
begin
	if (t <> nil) then
		begin
			if (t^.element.patent = patent) then
				model:= t^.element.model
			else if (t^.element.patent > patent) then
				findPatent(t^.sl, patent, model)
			else if (t^.element.patent < patent) then
				findPatent(t^.sr, patent, model);
		end;
end;

procedure countBrandTwo (st: secondTree; brand: string; var count: integer);

procedure countCarsInList (l: list; var count: integer);
begin
	if (l <> nil) then
		begin
			count:= count + 1;
			countCarsInList(l^.next, count);
		end;
end;

begin
	if (st <> nil) then
		begin
			if (st^.element.brand = brand) then
				countCarsInList(st^.element.next, count)
			else if (st^.element.brand > brand) then
				countBrandTwo(st^.sl, brand, count)
			else
				countBrandTwo(st^.sr, brand, count);
		end;
end;

procedure chargeVecBrand (var v: brandVec);
begin
  v[1]:= 'Chevrolet';
  v[2]:= 'Ford';
  v[3]:= 'Fiat';
  v[4]:= 'Peugeot';
  v[5]:= cut;
end;

procedure chargeVecModel (var v: modelVec);
begin
  v[1]:= 'Base';
  v[2]:= 'Semi-full';
  v[3]:= 'Full';
end;

procedure solveCreation (var t: tree; var st: secondTree);
var
  brand: brandVec;
  model: modelVec;
  c: carObj;
begin
  chargeVecBrand(brand);
  chargeVecModel(model);
  readCar(c, brand, model);
  while (c.brand <> cut) do
	begin
		createTree(t, c);
		createSecondTree(st, c);
		readCar(c, brand, model);
	end;
end;

procedure printTree (t: tree);
begin
	if (t <> nil) then
		begin
			if (t^.sl <> nil) then
				printTree(t^.sl);
			writeln('patente: ', t^.element.patent);
			writeln('modelo: ', t^.element.model);
			writeln('marca: ', t^.element.brand);
			writeln('anio: ', t^.element.year);
			if (t^.sr <> nil) then
				printTree(t^.sr);
		end;
end;

procedure printSecondTree (st: secondTree);

procedure printList (l: list);
begin
	if (l <> nil) then
		begin
			writeln('año: ', l^.element.year);
			writeln('modelo: ', l^.element.model);
			printList(l^.next);
		end;
end;
begin
	if(st <> nil) then
		begin
			if (st^.sl <> nil) then
				printSecondTree(st^.sl);
			writeln('marca: ', st^.element.brand);
			printList(st^.element.next);
			if (st^.sr <> nil) then
				printSecondTree(st^.sr);
		end;
end;

procedure countBrand (t: tree; brand: string; var count: integer);
begin
	if (t <> nil) then
		begin
			if (t^.sl <> nil) then
				countBrand(t^.sl, brand, count);
			if (t^.element.brand = brand) then
				count:= count + 1;
			if (t^.sr <> nil) then
				countBrand(t^.sr, brand, count);
		end;
end;

var
  t: tree;
  ty: tree;
  st: secondTree;
  count, count2: integer;
  model, model2: string;
begin
  randomize;
  t:= nil;
  ty:= nil;
  st:= nil;
  model:= '';
  model2:= '';
  count:= 0;
  count2:= 0;
  // inciso a
  solveCreation(t, st);
  writeln('Primera impresion');
  writeln;
  printTree(t);
  writeln;
  writeln('Segunda impresion');
  printSecondTree(st);
  writeln;
  // inciso b
  countBrand(t, 'Chevrolet', count);
  writeln('Conteo de Chevrolet: ', count);
  writeln;
  // inciso c
  countBrandTwo(st, 'Chevrolet', count2);
  writeln('Conteo de Chevrolet 2: ', count2);
  writeln;
  // inciso d
  createTreeYear(t, ty);
  printTree(ty);
  writeln;
  // inciso e
  findPatent(t, 510, model);
  if (model <> '') then
	writeln('El modelo del auto es ', model);
  writeln;
  // inciso f
  findInSecondTree(st, 20, model2);
  if (model2 <> '') then
	writeln('El modelo2 del auto es ', model2);
end.
