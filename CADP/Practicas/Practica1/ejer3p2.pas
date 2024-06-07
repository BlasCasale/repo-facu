program nombrePrograma;
const
  ans = 'Zidane Zinedine';
  min = 1;
  max = 10;
  moreEigth= 8;
  seven= 7;
var
  name: string;
  note, appro: integer; 
begin
  appro:= 0;
  repeat
    write('Ingrese el nombre del alumno: ');
    read(name);
    write('Ingrese la nota del alumno: ');
    read(note);
    while ((note < min) or (note > max)) do
      begin
        write('Ingrese una nota valida (del 1 al 10): ');
        read(note);
      end;
    write('El alumno ', name , 'obtuvo la nota de ', note);
  until name = ans
end.
