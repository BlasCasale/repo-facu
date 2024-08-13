program ejer8cap1;
const
  ans = 3;
var
  letter: char;
  i, counter: integer;
begin
  counter:= 0;
  { revisar este for }
  for i:= 1 to ans do
  begin
    writeln('Ingrese una letra: ');
    read(letter);
    if ((letter = 'a') or (letter = 'e') or (letter = 'i') or (letter = 'o') or (letter = 'u')) then
      counter:= counter + 1;
  end;
  if (counter = ans) then
    write('Todas son vocales')
  else
    write('Al menos una no es vocal');
end.
