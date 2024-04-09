program ejer2ad;
const
  cut = -1;
  max = 10;
  min = -1;
  eval = 5;
  promMore = 6.5;
  approved = 4;
var
  id, i, ingreParTot, recurParTot, ingreTot, recurTot, alumAproTod, alumMasProm, alumCero, idMaxOne, idMaxTwo, idLessOne, idLessTwo, maxTenOneId, maxTenOneCounter, maxTenTwoId, maxTenTwoCounter, maxZeroOneId, maxZeroOneCounter, maxZeroTwoId, maxZeroTwoCounter, counterTen, counterZero: integer;
  note, perI, perR, asis, asisProm, sum: real;
  typeAlum: char;
  booleanAsis: boolean;
begin
  ingreTot:= 0;
  recurTot:= 0;
  ingreParTot:= 0;
  recurParTot:= 0;
  alumAproTod:= 0;
  alumMasProm:= 0;
  maxZeroTwoCounter:= 0;
  maxZeroOneCounter:= 0;
  maxTenOneCounter:= 0;
  maxTenTwoCounter:= 0;
  alumCero:= 0;
  write('Ingrese el legajo del alumno: ');
  readln(id);
  while (id <> cut) do
    begin
      writeln('Legajo: ', id);
      counterTen:= 0;
      counterZero:= 0;
      asis:= 0;
      sum:= 0;
      writeln('Ingrese el tipo de estudiante, si es ingresante (I) o si es recursante (R): ');
      readln(typeAlum);
      while ((typeAlum <> 'I') and (typeAlum <> 'R')) do
        begin
          writeln('Ingrese I o R.');
          readln(typeAlum);
        end;

      if (typeAlum = 'I') then
        ingreTot:= ingreTot + 1;
      else
        recurTot:= recurTot +1;

      writeln('Condicion: ', typeAlum);

      for i:= 1 to eval do
        begin
          writeln('Ingrese la nota del parcial del alumno (-1 para ausente): ');
          readln(note);
          while ((note > max) or (note < min)) do
            begin
              writeln('Ingrese una nota válida del -1 (ausente) hasta el 10: ');
              readln(note);
            end;
          if (note > approved) then
            begin
              asis:= asis + 1;
              if (note = max)
                counterTen:= counterTen + 1;
            end
          else if (note = 0) then
            counterZero:= counterZero + 1;
          sum:= sum + note;
          write('Nota: ', note);
        end;
      
      if (counterZero > 0) then
        alumCero:= alumCero +1;

      asisProm:= asis /eval;
      
      if (asisProm >= 75) then
        if (typeAlum = 'I') then
          ingreParTot:= ingreParTot +1
        else
          recurParTot:= recurParTot +1;

      if (counterZero > maxZeroOneCounter) then
        begin
          maxZeroTwoCounter:= maxZeroOneCounter;
          maxZeroTwoId:= maxZeroOneId;
          maxZeroOneCounter:= counterZero;
          maxZeroOneId:= id;
        end
      else if (counterZero > maxZeroTwoCounter) then
        begin
          maxZeroTwoCounter:= counterZero;
          maxZeroTwoId:= id;
        end;
        
      if (counterTen > maxTenOneCounter) then
        begin
          maxTenTwoCounter:= maxTenOneCounter;
          maxTenTwoId:= maxTenOneId;
          maxTenOneCounter:= counterTen;
          maxTenOneId:= id;
        end
      else if (counterTen > maxTenTwoCounter) then
        begin
          maxTenTwoCounter:= counterTen;
          maxTenOneId:= id;
        end;

      if (counterZero > 0) then
        alumCero:= alumCero + 1;

      if ((sum / eval) >= 6.5) then
        alumMasProm:= alumMasProm + 1;

      if (asis = eval) then
        alumAproTod:= alumAproTod +1;
    end;

    perI:= (ingreParTot * 100) / ingreTot;
    perR:= (recurParTot * 100) / recurTot;

    writeln('Ingresantes que rinden ', ingreTot);
    writeln('Porcentaje de ingresantes que rinden ', perI:0:2);
    writeln('Porcentaje de recursantes que rinden ', perR:0:2);
    writeln('Los alumnos que aprobaron todos los examenes fueron ', alumAproTod);
end.
