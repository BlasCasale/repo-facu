program trees;
const
	cut = 0;
type
	
	dayRange = 1..31;
	monthRange = 1..12;
	yearRange = 1980..2024;
	
	dateObj = record
		day: dayRange;
		month: monthRange;
		year: yearRange;
	end;
	
	sell = record
		prodId: integer;
		date: dateObj;
		quantity: integer;
	end;

	sellShort = record
		quantity: integer;
		date: dateObj;
	end;

	tree = ^node;
	
	node = record
		element: sell;
		sl: tree;
		sr: tree;
	end;

	secondTree = ^secondNode;

	info = record
		prodId: integer;
		quantity: integer;
	end;

	secondNode = record
		element: info;
		sl: secondTree;
		sr: secondTree;
	end;

	thirdTree = ^thirdNode;

	list = ^nodeList;

	infoList = record
		prodId: integer;
		next: list;
	end;

	nodeList = record
		element: sellShort;
		next: list;
	end;

	field = ^infoList; // con esto podria psarle la info a otro modulo de manera mas simple

	thirdNode = record
		element: field;
		sl: thirdTree;
		sr: thirdTree;
	end;
{
	a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
	Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
	con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
	i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
	producto. Los códigos repetidos van a la derecha.
	ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
	código de producto. Cada nodo del árbol debe contener el código de producto y la
	cantidad total de unidades vendidas.
	iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
	código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
	las ventas realizadas del producto.
}

procedure createSell (var s: sell);
var
	day: dayRange;
	month: monthRange;
	year: yearRange;
	quantity: integer;
begin
	s.prodId:= random(10);
	if (s.prodId <> cut) then
		begin
			day:= random(31) + 1;
			month:= random(12) + 1;
			year:= 1980 + random(2024 - 1980) + 1;
			s.date.day:= day;
			s.date.month:= month;
			s.date.year:= year;
			quantity:= random(500) + 1;
			s.quantity:= quantity;
		end;
end;

procedure createTree (var t: tree; s: sell);
begin
	if (t = nil) then
		begin
			new(t);
			t^.element:= s;
			t^.sl:= nil;
			t^.sr:= nil;
		end
	else if (s.prodId < t^.element.prodId) then
		createTree(t^.sl, s)
	else
		createTree(t^.sr, s);
end;

procedure solveCreation (var t: tree);
var
	s: sell;
begin
	createSell(s);
	while (s.prodId <> cut) do
		begin
			createTree(t, s);
			createSell(s);
		end;
end;

procedure createTreeByQuantity (t: tree; var st: secondTree);

procedure createSecondTree (t: tree; var st: secondTree);
begin
	if (st = nil) then
		begin
			new(st);
			st^.element.prodId:= t^.element.prodId;
			st^.element.quantity:= t^.element.quantity;
			st^.sl:= nil;
			st^.sr:= nil;
		end
	else
		begin
			if (t^.element.prodId < st^.element.prodId) then
				createSecondTree(t, st^.sl)
			else if (t^.element.prodId > st^.element.prodId) then
				createSecondTree(t, st^.sr)
			else
				st^.element.quantity:= st^.element.quantity + t^.element.quantity			
		end;

end;

begin
	if (t <> nil) then
		begin
			createSecondTree(t, st);
			if (t^.sl <> nil) then
				createTreeByQuantity(t^.sl, st);
			if (t^.sr <> nil) then
				createTreeByQuantity(t^.sr, st);
		end;
end;

procedure createTreeWithLists (t: tree; var tt: thirdTree);

procedure addNode (s: sell; var l: list);
var
	newNode: list;
begin
	if (l = nil) then
		begin
			new(newNode);
			newNode^.element.quantity:= s.quantity;
			newNode^.element.date:= s.date;
			newNode^.next:= nil;
			l:= newNode;
		end
	else
		addNode(s, l^.next);
end;

procedure createThirdTree (t: tree; var tt: thirdTree);
begin
	if (tt = nil) then
		begin
			new(tt);
			tt^.element^.prodId:= t^.element.prodId;
			tt^.element^.next:= nil;  // este nil es para incializar la lista
			addNode(t^.element, tt^.element^.next);
			tt^.sl:= nil;
			tt^.sr:= nil;
		end
	else
		begin
			if (t^.element.prodId < tt^.element^.prodId) then
				createThirdTree(t, tt^.sl)
			else if (t^.element.prodId > tt^.element^.prodId) then
				createThirdTree(t, tt^.sr)
			else
				addNode(t^.element, tt^.element^.next);
		end;
end;

begin
	if (t <> nil) then
		begin
			createThirdTree(t, tt);

			if (t^.sl <> nil) then
				createTreeWithLists(t^.sl, tt);

			if (t^.sr <> nil) then
				createTreeWithLists(t^.sr, tt);
		end;
end;

// zona de prints 
procedure printDate (d: dateObj);
begin
	writeln('dia: ', d.day);
	writeln('mes: ', d.month);
	writeln('anio: ', d.year);
end;

procedure printMainTree (t: tree);
begin
	if (t <> nil) then
		begin
			if (t^.sl <> nil) then
				printMainTree(t^.sl);
			writeln;
			writeln('id: ', t^.element.prodId, ' , cantidad: ', t^.element.quantity);
			printDate(t^.element.date);
			writeln;
			if (t^.sr <> nil) then
				printMainTree(t^.sr);
		end;
end;

procedure printSecondTree (st: secondTree);
begin
	if (st <> nil) then
		begin
			if (st^.sl <> nil) then
				printSecondTree(st^.sl);
			writeln('id: ', st^.element.prodId, ', cantidad: ', st^.element.quantity);
			if (st^.sr <> nil) then
				printSecondTree(st^.sr);
		end;
end;

procedure printThirdTree (tt: thirdTree);

procedure printList (l: list);
begin
	if (l^.next <> nil) then
		printList(l^.next);
	writeln('cantidad: ', l^.element.quantity);
	printDate(l^.element.date);
end;

begin
	if (tt <> nil) then
		begin
			if (tt^.sl <> nil) then
				printThirdTree(tt^.sl);
			writeln;
			writeln('id: ', tt^.element^.prodId);
			printList(tt^.element^.next);
			writeln;
			if (tt^.sr <> nil) then
				printThirdTree(tt^.sr);
		end;
end;

// programa principal
var
	t: tree;
	st: secondTree;
	tt: thirdTree;
BEGIN
	randomize;
	t:= nil;
	st:= nil;
	tt:= nil;

	solveCreation(t);

	//createTreeByQuantity(t, st);

	createTreeWithLists(t, tt);

	writeln('Impresion para el main');
	writeln;
	writeln;
	printMainTree(t);
	writeln;
	writeln;
	writeln('Impresion para el second');
	writeln;
	writeln;
	//printSecondTree(st);
	writeln;
	writeln;
	writeln('Impresion para el third');
	writeln;
	writeln;
	printThirdTree(tt);
	writeln;
	writeln;
	writeln('1ero: ', t^.element.prodId, ' ', t^.element.quantity);
END.

