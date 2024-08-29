program trees;
const
	cut = 0;

type
	tree = ^node;
	
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
	
	node = record
		element: sell;
		sl: tree;
		sr: tree;
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
	aux: integer;
	day: dayRange;
	month: monthRange;
	year: yearRange;
	d: dateObj;
	quantity: integer;
begin
	aux:= random(1000);
	if (aux <> cut) then
		begin
			s.prodID:= aux;
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
	if (s.prodId <> 0) then
		begin
			if (t = nil) then
				begin
					new(t);
					t^.element:= s;
					t^.sl:= nil;
					t^.sr:= nil;
				end
			else
				begin
					if (t^.element.prodID < s.prodId) then
						createTree(t^.sl, s)
					else
						createTree(t^.sr, s);
				end;
		end;
end;

procedure createSecondTree (t: tree; var st: tree);
var
	count: integer;
begin
	count:= 0;
	
end;

var

BEGIN
	randomize;
	
END.

