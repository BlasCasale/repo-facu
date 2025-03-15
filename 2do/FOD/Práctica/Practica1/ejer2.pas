program ejer2;
{
  Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
  creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y
  el promedio de los números ingresados. El nombre del archivo a procesar debe ser
  proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
  contenido del archivo en pantalla.
}
const
  less = 1500;
type
  archive = file of integer;
var
  num, counter, acc: integer;
  average: real;
  arch: archive;
  name: string;
begin
  counter:= 0;
  acc:= 0;

  write('Ingrese el nombre del archivo a procesar: ');
  readln(name);

  assign(arch, name);

  reset(arch);

  while (not eof(arch)) do
    begin
      read(arch, num);
      acc:= acc + num;
      if (num < less) then
        counter:= counter + 1;
      writeln('Numero leido: ', num);
    end;

  average:= acc / filesize(arch);

  close(arch);
  
  writeln('Promedio de los numeros del archivo: ', average:0:2);
end.
