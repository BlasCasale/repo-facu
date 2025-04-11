program copy;
const
  highValue = 9999;
type
  province = record
    id: integer;
    population: integer;
    consumedHerb: integer;
    name: string[20];
  end;

  archive = file of province;

procedure readText (var a: text; var p: province);
begin
  if (not eof(a)) then
    readln(a, p.id, p.population, p.consumedHerb, p.name)
  else
    p.id:= highValue;
end;

procedure readArchive (var a: archive; var p: province);
begin
  if (not eof(a)) then
    read(a, p)
  else
    p.id:= highValue;
end;

var
  p: province;
  a: text;
  b: archive;
begin
  assign(a, 'provinciasYerba.dat');
  assign(b, 'provinciasYerba.txt');

  reset(a);
  rewrite(b);

  readText(a, p);

  while (p.id <> highValue) do
    begin
      write(b, p);
      readText(a, p);
    end;

  seek(b, 0);
  readArchive(b, p);

  while (p.id <> highValue) do
    begin
      writeln(p.id, ' ', p.population, ' ', p.consumedHerb, ' ', p.name);
      readArchive(b, p);
    end;

  close(a);
  close(b);
end.
