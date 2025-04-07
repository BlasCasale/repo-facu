program ejer5;
const
  highValue = 9999;
type

{
  Suponga que trabaja en una oficina donde está montada una  LAN (red local). La misma fue 
  construida  sobre  una  topología  de  red  que  conecta  5  máquinas  entre  sí  y  todas  las 
  máquinas  se  conectan  con  un  servidor  central.  Semanalmente  cada  máquina  genera un 
  archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por 
  cuánto  tiempo  estuvo  abierta.  Cada  archivo  detalle  contiene  los  siguientes  campos: 
  cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos 
  detalle  y  genere  un  archivo  maestro  con  los  siguientes  datos:  cod_usuario,  fecha, 
  tiempo_total_de_sesiones_abiertas. 
  Notas: 
  ●  Cada archivo detalle está ordenado por cod_usuario y fecha. 
  ●  Un  usuario  puede  iniciar  más de una sesión el mismo día en la misma máquina, o 
  inclusive, en diferentes máquinas.  
  ●  El archivo maestro debe crearse en la siguiente ubicación física:  /var/log.
}

  user = record
    id: integer;
    date: string[11];
    time: integer;
  end;

  archive = file of user;

procedure readArchive (var a: text; var u: user);
begin
  if (not eof(a)) then
    readln(a, u.id, u.time, u.date)
  else
    u.id:= highValue;  
end;

procedure getMin (var d1, d2, d3, d4, d5: text; var r1, r2, r3, r4, r5: user; var min: user);
begin
  if ((r1.id <= r2.id) and (r1.id <= r3.id) and (r1.id <= r4.id) and (r1.id <= r5.id)) then
    begin
      min:= r1;
      readArchive(d1, r1);
    end
  else
    begin
      if ((r2.id <= r3.id) and (r2.id <= r4.id) and (r2.id <= r5.id)) then
        begin
          min:= r2;
          readArchive(d2, r2);
        end
      else
        begin
          if ((r3.id <= r4.id) and (r3.id <= r5.id)) then
            begin
              min:= r3;
              readArchive(d3, r3);
            end
          else 
            begin
              if (r4.id <= r5.id) then
                begin
                  min:= r4;
                  readArchive(d4, r4);
                end
              else
                begin
                  min:= r5;
                  readArchive(d5, r5);
                end;
            end;
        end;
    end;
end;

var
  r1, r2, r3, r4, r5, min, u: user;
  d1, d2, d3, d4, d5: text;
  a: archive;
  counter, id: integer;
  date: string[11];
begin
  assign(d1, 'detalle1.txt');
  assign(d2, 'detalle2.txt');
  assign(d3, 'detalle3.txt');
  assign(d4, 'detalle4.txt');
  assign(d5, 'detalle5.txt');
  assign(a, 'resumenHoras.txt');

  reset(d1);
  reset(d2);
  reset(d3);
  reset(d4);
  reset(d5);
  rewrite(a);

  readArchive(d1, r1);
  readArchive(d2, r2);
  readArchive(d3, r3);
  readArchive(d4, r4);
  readArchive(d5, r5);

  getMin(d1, d2, d3, d4, d5, r1, r2, r3, r4, r5, min);

  while (min.id <> highValue) do
    begin
      id:= min.id;
      while (min.id = id) do
        begin
          counter:= 0;
          date:= min.date;

          while ((min.id = id) and (min.date = date)) do
            begin
              counter:= counter + min.time;
              getMin(d1, d2, d3, d4, d5, r1, r2, r3, r4, r5, min);
            end;

          u.id:= id;
          u.date:= date;
          u.time:= counter;
          write(a, u);
        end;
    end;

  seek(a, 0);

  while (not eof(a)) do
    begin
      read(a, u);
      writeln('id ', u.id, ' horas ', u.time, ' fecha ', u.date);
    end;

  close(d1);
  close(d2);
  close(d3);
  close(d4);
  close(d5);
  close(a);
end.
