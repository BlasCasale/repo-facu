program ejer1;
{
  Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
  incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
  archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
  se ingrese el número 30000, que no debe incorporarse al archivo
}
const
  cut = 30000;
type
  archive = file of integer;

procedure addNum (var a: archive; i: integer);
begin
  reset(a);
  seek(a, filesize(a));
  write(a, i);
  close(a);
end;

var
  i: integer;
  arch: archive;
  name: string;
begin
  writeln('Ingrese el nombre del archivo: ');
  readln(name);
  assign(arch, name);

  writeln('Ingrese un numero: ');
  readln(i);

  rewrite(arch);
  close(arch);

  while (i <> cut) do
    begin
      addNum(arch, i);
      writeln('Ingrese un numero: ');
      readln(i);
    end;

end.
