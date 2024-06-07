program ejer12bPr2;
{
  de cada campo se lee: localidad, hectareas sembradas y tipo de zona
  la lectura corta cuando se ingresa un campo de 900 ha en "Saladillo", que debe procesarse
  el precio es de 320 por tn
  informar:
  la cantidad de campos en Tres de Febrero con rendimiento estimado superior a $10000 x
  la localidad del campo con peor y mejor rendimiento economico x
  rendimiento promedio

  var:
  state, ha, zone, farmTDF, worstProfit, betterProfit, averageProfit, worstFarm, betterFarm
}
const
  cutState = 'Saladillo';
  cutHa = 900;
  tdf = 'Tres de Febrero';
  profitTDF = 10000;
  price = 320;
procedure takeInfo (var state: string; var ha: integer; var zone: integer);
begin
  write('Ingrese la localidad del campo: ');
  readln(state);
  write('Ingrese las hectareas que tiene el campo: ');
  readln(ha);
  write('Ingrese la zona del campo (del 1 al 3): ');
  readln(zone);
end;
function getCurrency (ha: integer; zone: integer): real;
begin
  if (zone = 1) then
    getCurrency:= (ha * 6) * price
  else if (zone = 2) then
    getCurrency:= (ha * 2.6) * price
  else if (zone = 3) then
    getCurrency:= (ha * 1.4) * price;
end;
procedure checkFarmTDF (state: string; profit: real; var counter: integer);
begin
  if ((state = tdf) and (profit >= profitTDF)) then
    counter:= counter + 1;
end;
procedure checkFarm (state: string; profit: real; var max: real; var maxFarm: string; var min: real; var minFarm: string);
begin
  if (profit >= max) then
    begin
      maxFarm:= state;
      max:= profit;
    end;
  if (profit <= min) then
    begin
      min:= profit;
      minFarm:= state;
    end;
end;
function getAverage (totalFarm: integer; totalProfit: real): real;
begin
  getAverage:= totalProfit / totalFarm;
end;
var
  state, worstFarm, betterFarm: string[30];
  ha, zone, farmTDF, totalFarm: integer;
  worstProfit, betterProfit, averageProfit, profit, totalProfit: real;
begin
  worstProfit:= 99999;
  betterProfit:= -1;
  farmTDF:= 0;
  totalFarm:= 0;
  totalProfit:= 0;
  
  repeat
    takeInfo(state, ha, zone);
    profit:= getCurrency(ha, zone);
    checkFarm(state, profit, betterProfit, betterFarm, worstProfit, worstFarm);
    checkFarmTDF(state, profit, farmTDF);
    totalFarm:= totalFarm + 1;
    totalProfit:= totalProfit + profit;
  until ((state = cutState) and (ha = cutHa));

  averageProfit:= getAverage(totalFarm, totalProfit);
  writeln('El rendimiento promedio es de  U$D', averageProfit:0:2);
  writeln('La cantidad de campos de Tres de Febrero con un rendimiento superior a $10000 son ', farmTDF, ' campos');
  writeln('El campo con peor rendimiento es de la localidad de ', worstFarm);
  writeln('El campo con mejor rendimiento es de la localidad de ', betterFarm);
end.
