program list;
  {
    la lista es una coleccion de nodos
    cada nodo contiene un elemento y una direccion de memoria dinamica que indica donde se encuentra el siguiente nodo de la lista
    toda lista tiene un nodo inicial (puntero inicial de la lista)
    puede que las direcciones de memoria no sean todas continuas
    la lista es una estructura de datos homogenea (unicamente acepta tipos de datos del mismo tipo)
    es dinamica porque cambia su tamaño durante la ejecucion
    es lineal porque se sabe que tiene un nodo que lo antecede y un nodo que lo sigue
    es secuencial porque para acceder a N elemento debo pasar los N elementos anteriores
  }
type
  list = ^node;

  node = record
    element: integer;
    next: list;
  end;

  people = record
    name: string[20];
    dni: integer;
  end;

  listRegister = ^nodeR;

  nodeR = record
    element: people;
    next: listRegister;
  end;
procedure roamList (ll: list);
var
begin
  while (ll <> nil) do
    begin
      write(ll^.element);
      ll:= ll^.next;
    end;
end;
procedure addAtBeginning (var ll: list; num: integer);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= num;
  newNode^.next:= nil;
  if (ll = nil) then
    ll:= newNode
  else
    begin
      newNode.next:= ll;
      ll:= newNode;
    end;
end;
procedure addAtEnd (var ll: list; num: integer);
var
  aux, newNode: list;
begin
  new(newNode);
  newNode^.element:= num;
  newNode^.next:= nil;
  if (ll = nil) then
    ll:= newNode
  else
    begin
      aux:= ll;
      while (aux^.next <> nil) do
        aux:= aux^.next;
      aux^.next:= newNode;
    end;
end;
procedure addAtEnd2 (var ll, last: list; num: integer);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= num;
  newNode^.next:= nil;
  if (ll = nil) then
    begin
      ll:= newNode;
      last:= newNode;
    end
  else
    begin
      last^.next:= newNode;
      last:= newNode;
    end;
end;
var
  linkedList, lastNode: list;
  num: integer;
begin
  linkedList:= nil; {se inicializa la lista}
  lastNode:= linkedList;
  read(num);
  addAtBeginning(linkedList, num);
  addAtEnd(linkedList, num);
end.
