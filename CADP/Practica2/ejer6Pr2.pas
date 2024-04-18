program ejer6Pr2;
  {
    leer 100 productos
    para cada prod leer precio, codigo y tipo (pantalon, remera, camisa, medias, campera, etc)
    informar codigo de los dos productos mas baratos
    codigo del producto pantalon mas caro
    precio promedio
  }
const
  products = 100;
  pant = 'pantalon';
type
  names = string[30];
procedure checkLess (price: real; id: integer; var lessOne: real; var lessTwo: real; var idLessOne: integer; var idLessTwo: integer);
  begin
    if (price < lessOne) then
      begin
        idLessTwo:= idLessOne;
        lessTwo:= lessOne;
        idLessOne:= id;
        lessOne:= price;
      end
    else if (price < lessTwo) then
      begin
        idLessTwo:= id;
        lessTwo:= price;
      end;
  end;
procedure checkPant (price: real; id: integer; var maxPricePant: real; maxIdPant: integer);
  begin
    if (price > maxPricePant) then
      begin
        maxIdPant:= id;
        maxPricePant:= price;
      end;
  end;
procedure takeInfo (var id: integer; var price: real; var name: names);
  begin
    write('Ingrese el codigo del producto: ');
    readln(id);
    write('Ingrese el precio del producto: ');
    readln(price);
    write('Ingrese el tipo de producto: ');
    readln(name);
  end;
procedure readInfo (name: names; price: real; id: integer);
  begin
    writeln('El producto ', name, ' con un precio de ', price:0:2, ' y con codigo ', id);
  end;
function getAverage (totalAmount: real; totalSells: integer): real;
  begin
    getAverage:= totalAmount / totalSells;
  end;
function counterSells (totalSells: integer) : integer;
  begin
    counterSells:= totalSells + 1;
  end;
function addAmountSells (totalAmount: real; sell: real): real;
  begin
    addAmountSells:= totalAmount + sell;
  end;
var
  i, id, idLessOne, idLessTwo, maxIdPant, totalSells: integer;
  price, priceLessOne, priceLessTwo, maxPricePant, totalAmount, average: real;
  name: names;
begin
  totalSells:= 0;
  priceLessOne:= 99999;
  priceLessTwo:= 99999;
  totalAmount:= 0;
  maxPricePant:= -1;
  for i:= 1 to products do
    begin
      takeInfo(id, price, name);

      if (name = pant) then
          checkPant(price, id, maxPricePant, maxIdPant);

      checkLess(price, id, priceLessOne, priceLessTwo, idLessOne, idLessTwo);
      
      totalSells:= counterSells(totalSells);

      totalAmount:= addAmountSells(totalAmount, price);

      readInfo(name, price, id);
    end;
  
  average:= getAverage(totalAmount, totalSells);
end.
