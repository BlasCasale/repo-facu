program ejer10;
const
  cut = 0;
type
  list = ^node;

  clientObj = record
    dni: integer;
    waitNum: integer;
  end;

  node = record
    element: clientObj;
    next: list;
  end;
procedure receiveClient (var l, last: list; var long: integer; dni: integer);
var
  client: clientObj;
  newNode: list;
begin
  client.dni:= dni;
  client.waitNum:= long + 1;
  new(newNode);
  newNode^.element:= client;
  newNode^.next:= nil;
  long:= long + 1;
  if (l = nil) then
    begin
      l:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;
procedure customerService (var l: list; var waitNum, dni: integer);
var
  aux: list;
begin
  aux:= l;
  waitNum:= l^.element.waitNum;
  dni:= l^.element.dni;
  l:= l^.next;
  dispose(aux);
end;
procedure takeInfo (var dni: integer);
begin
  writeln('Ingrese el dni del cliente: ');
  readln(dni);
end;
  {
    lista de espera
    cliente: dni y num de espera
    b) receiveClient (dni, l) => num al cliente y la l act
    c) customerService (l) => num, dni y l actualizada (eliminar)
    d) simular atencion al cliente, llegan todos juntos y se atienden de a uno, corta con 0
  }
var
  dni, long, waitNum: integer;
  first, last: list;
begin
  first:= nil;
  last:= nil;
  long:= 0;
  takeInfo(dni);
  while (dni <> cut) do
    begin
      receiveClient(first, last, long, dni);
      takeInfo(dni);
    end;

  while (first <> nil) do
    begin
      customerService(first, waitNum, dni);
      writeln('El cliente con numero de espera ', waitNum, ' y con DNI ', dni, ' tiene el turno actual');
    end;
end.
