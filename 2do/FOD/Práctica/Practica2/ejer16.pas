program ejer16;
const
  highValue = 9999;
type

  weekly = record
    id: integer;
    price: real;
    total: integer;
    sold: integer;
    date: string[11];
    name: string[20];
    desc: string[40];
  end;

  archive = file of weekly;

  report = record
    id: integer;
    sold: integer;
    date: string[11];
  end;

procedure readText (var a: text; var r: report);
begin
  if (not eof(a)) then
    readln(a, r.id, r.sold, r.date)
  else
    r.id:= highValue;
end;

procedure getMin (var d1, d2, d3: text; var r1, r2, r3, min: report);
begin
  if (((r1.id <= r2.id) and (r1.date <= d2.date)) and ((r1.id <= r3.id) and (r1.id <= r3.date))) then
    begin
      min:= r1;
      readText(d1, r1);
    end
  else if ((r2.id <= r3.id) and (r2.date <= r3.date)) then
    begin
      min:= r2;
      readText(d2, r2);
    end
  else
    begin
      min:= r3;
      readText(d3, r3);
    end;
end;

procedure readWeekly (var a: archive; var w: weekly);
begin
  if (not eof(a)) then
    readln(a, w)
  else
    w.id:= highValue;
end;

{
  La editorial X, autora de diversos semanarios, posee un archivo maestro con la información 
  correspondiente  a  las  diferentes  emisiones de   los mismos. De cada emisión se registra: 
  fecha, código de semanario, nombre del semanario, descripción, precio, total de ejemplares 
  y total de ejemplares vendidos. 
  Mensualmente se reciben 100 archivos detalles con las ventas de los semanarios en todo el 
  país. La información que poseen los detalles es la siguiente: fecha, código de semanario y 
  cantidad  de  ejemplares  vendidos.  Realice  las  declaraciones  necesarias,  la  llamada  al 
  procedimiento y el procedimiento que recibe el archivo maestro y los 100 detalles y realice la 
  actualización  del  archivo  maestro  en  función  de  las  ventas  registradas.  Además  deberá 
  informar fecha y semanario que tuvo más ventas y la misma información del semanario con 
  menos ventas. 
  Nota: Todos los archivos están ordenados por fecha y código de semanario. No se realizan 
  ventas de semanarios si no hay ejemplares para hacerlo
}
var
  d1, d2, d3: text;
  r1, r2, r3, min: report;
  more, less: integer;
  a: archive;
  w: weekly;
begin
  assign(a, 'semanarios.txt');
  assign(d1, 'venta1.txt');
  assign(d2, 'venta2.txt');
  assign(d3, 'venta3.txt');

  reset(a);
  reset(d1);
  reset(d2);
  reset(d3);
end.
