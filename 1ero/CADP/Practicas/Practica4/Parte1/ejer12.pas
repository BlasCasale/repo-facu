program ejer12;
const
  long = 52;
  galaxiesTypes = 3;
type
  galaxyObj = record
    name: string;
    mass: integer;
    gType: integer;
    distance: integer;
  end;

  galaxyMass = record
    name: string;
    mass: integer;
  end;

  vec = array [0..long] of galaxyObj;
  galType = array [0..galaxiesTypes] of integer;
procedure takeInfo (var galaxy: galaxyObj);
begin
  write('Ingresa el tipo de galaxia: ');
  readln(galaxy.gType);
  writeln('Ingresa el nombre de la galaxia: ');
  readln(galaxy.name);
  writeln('Ingrese la masa en Kg de la galaxia: ');
  readln(galaxy.mass);
  write('Ingrese la distancia en parsec desde la tierra: ');
  readln(galaxy.distance);
end;
procedure getTotalMass (galaxy: galaxyObj; var totalMass, massOfThree: integer);
begin
  if ((galaxy.name = 'Via lactea') or (galaxy.name = 'Andromeda') or (galaxy.name = 'Triangulo')) then
    massOfThree:= massOfThree + galaxy.mass;    
  totalMass:= totalMass + galaxy.mass;
end;
procedure countGalaxies (var v: galType; galaxy: galaxyObj);
begin
  if (galaxy.gType = 1) then
    v[galaxy.gType -1]:= v[galaxy.gType -1] + 1
  else if (galaxy.gType = 2) then
    v[galaxy.gType -1]:= v[galaxy.gType -1] + 1
  else if (galaxy.gType = 3) then
    v[galaxy.gType -1]:= v[galaxy.gType -1] + 1
  else
    v[galaxy.gType -1]:= v[galaxy.gType -1] + 1;
end;
procedure findMassiveGalaxies (galaxy: galaxyObj; var maxOne, maxTwo: galaxyMass);
begin
  if (galaxy.mass >= maxOne.mass) then
    begin
      maxTwo:= maxOne;
      maxOne.mass:= galaxy.mass;
      maxOne.name:= galaxy.name;
    end
  else if (galaxy.mass >= maxTwo.mass) then
    begin
      maxTwo.mass:= galaxy.mass;
      maxTwo.name:= galaxy.name;
    end;
end;
procedure findSmallerGalaxies (galaxy: galaxyObj; var lessOne, lessTwo: galaxyMass);
begin
  if (galaxy.mass <= lessOne.mass) then
    begin
      lessTwo:= lessOne;
      lessOne.mass:= galaxy.mass;
      lessOne.name:= galaxy.name;
    end
  else if (galaxy.mass <= lessTwo.mass) then
    begin
      lessTwo.mass:= galaxy.mass;
      lessTwo.name:= galaxy.name;
    end;
end;
var
  i: integer;
  totalMass, massOfThree, counterNoIrregular: integer;
  galaxiesArray: vec;
  counter: galType;
  galaxy: galaxyObj;
  maxOne, maxTwo, lessOne, lessTwo: galaxyMass;
  average: real;
begin
  counterNoIrregular:= 0;
  totalMass:= 0;
  massOfThree:= 0;
  maxOne.mass:= -1;
  maxTwo.mass:= -1;
  lessOne.mass:= 99999;
  lessTwo.mass:= 99999;

  for i:= 0 to galaxiesTypes do
    counter[i]:= 0;

  for i:= 0 to long do
    begin
      takeInfo(galaxy);
      countGalaxies(counter, galaxy);
      getTotalMass(galaxy, totalMass, massOfThree);
      findMassiveGalaxies(galaxy, maxOne, maxTwo);
      findSmallerGalaxies(galaxy, lessOne, lessTwo);
      if ((galaxy.gType <> 4) and (galaxy.distance <= 1000)) then
        counterNoIrregular:= counterNoIrregular + 1;
    end;

  average:= (massOfThree * 100) / totalMass;
  
  write('El porcentaje de masa de las 3 principales galaxias es %', average);

  for i:= 0 to galaxiesTypes do
    write('Hay ', counter[i] , ' del tipo ', i + 1);
  {
    galaxia:
    tipo (1: eliptica, 2: espiral, 3: lenticular, 4: irregular)
    masa (en kg)
    distancia (pc) desde la tierra
    53 galaxias
    informar:
    la cantidad de galaxias de cada tipo x
    la masa total acumulada de las 3 galaxias principales (via lactea, andromeda y triangulo) y el porcentaje que representa respecto a la masa total de galaxias x
    la cantiadad de galaxias no irregulares que se encuentran a menos de 1000 pc x
    el nombre de las dos galaxias con mayor masa y las dos con menor masa x
  }
end.
