program ejer6;
type
  limited = string[30];
  procesorObj = record
    brand: limited;
    line: limited;
    cores: integer;
    ghz: real;
    nm: integer;
  end;
procedure getBrandAndLine (procesor: procesorObj; var actualBrand, actualLine: limited);
begin
  if ((procesor.cores >= 2) and (procesor.nm <= 22)) then
    begin
      actualBrand:= procesor.brand;
      actualLine:= procesor.line;
    end;
end;
procedure getMaxBrands (procesor: procesorObj; var maxOne, maxTwo: integer; counter: integer; var maxBrandOne, maxBrandTwo: limited);
begin
  if (procesor.nm >= 14) then
    begin
      if (counter >= maxOne) then
        begin
          maxTwo:= maxOne;
          maxBrandTwo:= maxBrandOne;
          maxOne:= counter;
          maxBrandOne:= procesor.brand;
        end;
      else if (counter >= maxTwo) then
        begin
          maxTwo:= counter;
          maxBrandTwo:= procesor.brand;
        end;
    end;
end;
procedure countMulticore (procesor: procesorObj; var counter: integer);
begin
  if (((procesor.brand = 'AMD') or (procesor.brand = 'Intel')) and (procesor.ghz >= 2)) then
    counter:= counter + 1;
end;
procedure takeInfo (var procesor: procesorObj);
begin
  write('Ingrese la marca del procesador: ');
  readln(procesor.brand);
  write('Ingrese la linea del procesador: ');
  readln(procesor.line);
  write('Ingrese la cantidad de nucleos que tiene el procesador: ');
  readln(procesor.cores);
  write('Ingrese la cantidad de Ghz que tiene el procesador: ');
  readln(procesor.ghz);
  write('Ingrese la cantidad de nm que tiene el procesador: ');
  readln(procesor.nm);
end;
var
  procesor: procesorObj;
  actual, actualBrand, actualLine, maxBrandOne, maxBrandTwo: limited;
  counter, counterMulti maxOne, maxTwo: integer;
begin
{
  leer hasta cambiar de marca
  la lectura finaliza cuando los core son 0
  informar 
  marca y linea de procesador con mas de 2 core con hasta 22nm
  las 2 marcas con mayor cantidad de procesadores de 14 nm
  cantidad de procesadores multicore de Intel o AMD, que los relojes tengan mas de 2 Ghz
}
  takeInfo(procesor);
  maxOne:= -1;
  maxTwo:= -1;
  counter:= 0;
  counterMulti:= 0;
  while (procesor.cores <> 0) do
    begin
      actual:= procesor.brand;
      while ((actual = procesor.brand) and (procesor.cores <> 0)) do
        begin
          countMulticore(procesor, counterMulti);
          if (procesor.nm >= 14) then
            counter:= counter + 1;
          takeInfo(procesor);
        end;
      getMaxBrands(procesor, maxOne, maxTwo, counter, maxBrandOne, maxBrandTwo);
      getBrandAndLine(procesor, actualBrand, actualLine);
      write('Marca ', actualBrand, ' y la linea ', actualLine);
      counter:= 0;
    end;
  write('La cantidad de procesadores de AMD e Intel son ', counterMulti);
  writeln('La marca con mayor cantidad de procesadores de 14nm es ', maxBrandOne, ' y la segunda ', maxBrandTwo);
end.
