program ejer4;
{
  informar el monto total a facturar de cada uno
  modulo para leer la info
  modulo que reciba datos de clientes y retorne lo que gasto
}
const
  clients = 9300;
  priceMinute = 3.40;
  priceMB = 1.35;
type
  client = record
    cellphone: integer;
    minutesSpent: integer;
    megaSpent: integer;
  end;
procedure takeInfo (var clientToUpdate: client);
begin
  writeln('Ingrese su numero de telefono: ');
  readln(clientToUpdate.cellphone);
  writeln('Ingrese los minutos que uso: ');
  readln(clientToUpdate.minutesSpent);
  writeln('Ingrese los megas que uso: ');
  readln(clientToUpdate.megaSpent);
end;
procedure getSpents (clientToCheck: client; var spentOfMB: real; var spentOfMinutes: real);
begin
  spentOfMB:= clientToCheck.megaSpent * priceMB;
  spentOfMinutes:= clientToCheck.minutesSpent * priceMinute;
end;
var
  spentMB, spentMinutes, totalAmount: real;
  clientData: client;
  i: integer;
begin
  for i:= 1 to clients do
    begin
      totalAmount:= 0;
      takeInfo(clientData);
      getSpents(clientData, spentMB, spentMinutes);
      totalAmount:= spentMB + spentMinutes;
      writeln('El total de gastos del cliente fue  de $', totalAmount);
    end;
end.
