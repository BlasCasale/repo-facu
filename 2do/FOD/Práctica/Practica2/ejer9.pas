program ejer9;
const
  highValue = 9999;
type

  client = record
    id: integer;
    year: integer;
    month: integer;
    amount: real;
  end;

procedure readText (var a: text; var c: client);
begin
  if (not eof(a)) then
    readln(a, c.id, c.year, c.month, c.amount)
  else
    c.id:= highValue;
end;
{
  Se cuenta con un archivo que posee información de las ventas que realiza una empresa a 
  los  diferentes  clientes.  Se  necesita  obtener  un  reporte  con  las  ventas  organizadas  por 
  cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total 
  mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el 
  cliente. Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido 
  por la empresa.
  El formato del archivo maestro está dado por: cliente (cod cliente, nombre y apellido), año, 
  mes, día y monto de la venta. El orden del archivo está dado por: cod cliente, año y mes. 
  Nota:  tenga  en  cuenta  que  puede  haber  meses  en  los  que  los  clientes  no  realizaron 
  compras. No es necesario que informe tales meses en el reporte.
}
var
  c: client;
  a: text;
  id, year, month: integer;
  totalAmount, yearAmount, monthAmount: real;
begin
  assign(a, 'ventaEmpresa.txt');
  reset(a);

  readText(a, c);

  totalAmount:= 0;

  while (c.id <> highValue) do
    begin
      id:= c.id;
      
      while ((c.id <> highValue) and (id = c.id)) do
        begin
          year:= c.year;
          yearAmount:= 0;

          while ((c.id <> highValue) and (id = c.id) and (year = c.year)) do
            begin
              month:= c.month;
              monthAmount:= 0;

              while ((c.id <> highValue) and (id = c.id) and (year = c.year) and (month = c.month)) do
                begin
                  monthAmount:= c.amount + monthAmount;
                  readText(a, c);
                end;

              writeln('ID ', id, ' gasto en el mes ', month, ' ', monthAmount:0:2);
              
              yearAmount:= yearAmount + monthAmount;
            end;

          writeln('ID ', id, ' gasto en el ano ', year, ' ', yearAmount:0:2);

          totalAmount:= yearAmount + totalAmount;
        end;
    end;

  writeln('la empresa vendio un total de ', totalAmount:0:2);

  close(a);
end.
