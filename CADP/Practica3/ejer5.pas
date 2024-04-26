program ejer5;
{
  realizar un programa que lea la informacion de autos que hay a la venta
  de cada auto se lee: marca, modelo y precio
  corta cuando la marca es ZZZ (while)
  informar el precio promedio por marca
  informar marca y modelo del auto mas caro
}
type
  limited = string[30];
  carObj = record
    brand: limited;
    model: limited;
    price: integer;
  end;
procedure takeInfo (var car: carObj);
begin
  write('Ingrese la marca del auto: ');
  readln(car.brand);
  write('Ingrese el modelo del auto: ');
  readln(car.model);
  write('Ingrese el precio del auto: ');
  readln(car.price);
end;
function getAverage (totalAmount, totalCars: integer): integer;
begin
  getAverage:= totalAmount / totalCars;
end;
procedure getHigherAmount (var maxCar: integer; car: carObj; var maxModel: limited; var maxBrand: limited);
begin
  if (car.price >= maxCar) then
    begin
      maxCar:= car.price;
      maxModel:= car.model;
      maxBrand:= car.brand;
    end;
end;
var
  car: carObj;
  max, totalAmount, totalCars: integer;
  average: real;
  maxModel, maxBrand, actual: limited;
begin
  max:= -1;
  totalAmount:= 0;
  totalCars:= 0;
  takeInfo(car);
  while (car.brand <> 'ZZZ') do
    begin
      actual:= car.brand;
      while (car.brand = actual) do
        begin
          getHigherAmount(max, car, maxModel, maxBrand);
          totalAmount:= totalAmount + car.price;
          totalCars:= totalCars + 1;
          takeInfo(car);
        end;
      totalAmount:= 0;
      totalCars:= 0;
      average:= getAverage(totalAmount, totalCars);
      writeln('La marca ', actual , ' tiene un promedio de precio ', average:0:2);
    end;
  writeln('El auto mas caro es de la marca ', maxBrand, ' y el modelo es ', maxModel);
end.
