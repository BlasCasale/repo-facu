program ejer2;
const
  cut = 1122;
type

  codeSure = 1..6;

  str30 = string[30];

  infoObj = record
    dni: integer;
    lastName: str30;
    name: str30;
    amount: real;
  end;

  listI = ^nodeI;

  nodeI = record
    element: infoObj;
    next: listI;
  end;

  vecPrices = array [codeSure] of real;

  clientObj = record
    id: integer;
    code: codeSure;
    dni: integer;
    lastName: str30;
    name: str30;
    amount: real;
  end;

  list = ^node;

  node = record
    element: clientObj;
    next: list;
  end;


procedure chargeVec (var v: vecPrices); 
begin
  v[1]:= 32.4;
  v[2]:= 35.3;
  v[3]:= 39.2;
  v[4]:= 41.1;
  v[5]:= 43.9;
  v[6]:= 45.6;
end;

// lista ordenada de clientes ascendente
procedure addNodeMain (var l: list; client: clientObj);
var
  newNode, prev, current: list;
begin
  new(newNode);
  newNode^.element:= client;
  newNode^.next:= nil;
  current:= l;

  if (l = nil) then
    l:= newNode
  else
    begin
      while ((current <> nil) and (current^.element.id < newNode^.element.id)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
        if (current = l) then
          begin
            newNode^.next:= current;
            l:= newNode;
          end
        else
          begin
            prev^.next:= newNode;
            newNode^.next:= current;
          end;
    end;
end;

// lista ordenada para informar ascendente
procedure addNodeSecondarie (var l: listI; client: clientObj; v: vecPrices);
var
  newNode, prev, current: listI;
  info: infoObj;
begin
  info.dni:= client.dni;
  info.lastName:= client.lastName;
  info.name:= client.name;
  info.amount:= client.amount + v[client.code];
  new(newNode);
  newNode^.element:= info;
  newNode^.next:= nil;
  current:= l;

  if (l = nil) then
    l:= newNode
  else
    begin
      while ((current <> nil) and (current^.element.dni < newNode^.element.dni)) do
        begin
          prev:= current;
          current:= current^.next;
        end;
        if (current = l) then
          begin
            newNode^.next:= current;
            l:= newNode;
          end
        else
          begin
            prev^.next:= newNode;
            newNode^.next:= current;
          end;
    end;
end;

procedure deleteNode (var l: list; id: integer);
var
  prev, current: list;
begin
  current:= l;
  while ((current <> nil) and (current^.element.id <> id) and (current^.element.id < id)) do
    begin
      prev:= current;
      current:= current^.next;
    end;
  
  if (current <> nil) then
    begin
      if (current = l) then
        l:= l^.next
      else
        prev^.next:= current^.next;
      dispose(current);
    end;
end;

function decomposeDni (dni: integer): boolean;
var
  aux, counter: integer;
begin
  counter:= 0;
  while (dni <> 0) do
    begin
      aux:= dni mod 10;
      if ((aux mod 9 = 0) and (aux <> 0)) then
        counter:= counter + 1;
      dni:= dni div 10; 
    end;
  decomposeDni:= counter >= 2;
end;

procedure takeInfo (var client: clientObj);
begin
  write('Ingrese el id del cliente: ');
  read(client.id);
  writeln('Ingrese el dni del cliente: ');
  readln(client.dni);
  writeln('Ingrese el apellido del cliente: ');
  readln(client.lastName);
  writeln('Ingrese el nombre del cliente: ');
  readln(client.name);
  writeln('Ingrese el monto basico a pagar: ');
  readln(client.amount);
  writeln('Ingrese el codigo de la poliza (1 al 6): ');
  readln(client.code);
end;

procedure roamList (l: listI);
var
  info: infoObj;
begin
  while (l <> nil) do
    begin
      info:= l^.element;
      writeln('DNI: ', info.dni);
      writeln('Apellido: ', info.lastName);
      writeln('Nombre: ', info.name);
      writeln('Monto: ', info.amount:0:2);
      l:= l^.next;
    end;
end;

  {
    cliente: id, dni, lastName, name, code (1..6), basicAmount
    repeat until (1122 = id (corte))
    se dispone de tabla que tiene montos adicionales segun el seguro contratado
    informar:
    1) informar para c/cliente dni, apellido, nombre y monto completo (b + a)
    2) informar nombre y apellido de clientes con un dni con al menos 2 digitos 9
    3) realizar un modulo que reciba un id, lo busque (seguro existe) y lo elimine
  }
var
  prices: vecPrices;
  client: clientObj;
  info: infoObj;
  listC: list;
  listInfo: listI;
  counter: integer;
begin
  listC:= nil;
  listInfo:= nil;
  chargeVec(prices);
  counter:= 0;

  repeat
    takeInfo(client);
    addNodeMain(listC, client);
    addNodeSecondarie(listInfo, client, prices);
    if (decomposeDni(client.dni)) then
      counter:= counter + 1;
  until client.id = cut;
  
  roamList(listInfo);

  writeln('Cantidad de dni con 9: ', counter);
  deleteNode(listC, 21);
end.
