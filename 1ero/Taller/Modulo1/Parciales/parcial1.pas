program parcial;
const
  cut = 0;
type
  days = 1..31;

  packageObj = record
    id: integer;
    day: days;
    weight: real;
    pc: integer;
  end;

  packShort = record
    id: integer;
    day: days;
    weight: real;
  end;

  tree = ^node;

  list = ^nodeList;

  nodeList = record
    element: packShort;
    next: list;
  end;
  
  dataTree = ^dataObj;

  dataObj = record
    pc: integer;
    element: list;
  end;
  
  node = record
    element: dataObj;
    sl: tree;
    sr: tree;
  end;

  maxAndMin = record
    weight: real;
    id: integer;
  end;

  {
    el correo argetino necesita procesar los envios entregados durante el mes de julio de 2024. de cada envio se conoce
    clientId, day, cp, weigth
    a) implementar un modulo que lea envios, genere y retorne un arbol binario de busquedas ordenado por codigo postal, donde para
    cada codigo postal se almacenan en una lista todos los nodos (clientId, day y weight) correspondientes. La lectura finaliza 
    con clientId = 0. se sugiere utilziar el modulo leerEnvio.
    b) implementar un modulo que reciba la estructura generada en a) y un codigo postal, y retorne todos los envios de dicho codigo postal
    c) realizar un modulo recursivo que reciba la estructura que retorne el inciso b) y retorne los id correspondiente de los pedidos
    con mas peso y menos peso

    nota: implementar en el pp, que invoque los incisos a, b y c
  }

procedure addNode (var l: list; ps: packShort);
var
  newNode: list;
begin
  new(newNode);
  newNode^.element:= ps;
  newNode^.next:= l;
  l:= newNode;
end;

procedure filterCP (t: tree; pc: integer; var l: list);

procedure createList (var l: list; li: list);
var
  newNode: list;
begin
  if (li <> nil) then
    begin
      new(newNode);
      newNode^.element:= li^.element;
      newNode^.next:= l;
      l:= newNode;
      createList(l, li^.next);
    end;
end;

begin
  if (t <> nil) then
    begin
      if ((t^.sl <> nil) and (t^.element.pc > pc)) then
        filterCP(t^.sl, pc, l)
      else if ((t^.sr <> nil) and (t^.element.pc < pc)) then
        filterCP(t^.sr, pc, l)
      else if (t^.element.pc =  pc) then 
        createList(l, t^.element.element);
    end;
end;

procedure readPackage (var p: packageObj);
begin
  p.id:= random(1000);
  if (p.id <> cut) then
    begin
      p.pc:= random(2500) + 1000;
      p.day:= random(31) + 1;
      p.weight:= random(20000) / (random(10) + 1);
    end;
end;

procedure addTree (var t: tree; p: packageObj);
var
  ps: packShort;
begin
  ps.id:= p.id;
  ps.day:= p.day;
  ps.weight:= p.weight;
  if (t = nil) then
    begin
      new(t);
      t^.element.pc:= p.pc;
      t^.element.element:= nil;
      addNode(t^.element.element, ps);
      t^.sl:= nil;
      t^.sr:= nil;
    end
  else 
    begin
      if (t^.element.pc > p.pc) then
        addTree(t^.sl, p)
      else if (t^.element.pc < p.pc) then
        addTree(t^.sr, p)
      else  
        addNode(t^.element.element, ps)
    end;
end;

procedure createTree (var t: tree);
var
  p: packageObj;
begin
  readPackage(p);
  while (p.id <> cut) do
    begin
      addTree(t, p);
      readPackage(p);
    end;
end;

procedure findLowerAndMax (l: list; var min, max: maxAndMin);
begin
  if (l <> nil) then
    begin
      if (l^.element.weight >= max.weight) then
        begin
          max.weight:= l^.element.weight;
          max.id:= l^.element.id;
        end;
      if (l^.element.weight <= min.weight) then
        begin
          min.weight:= l^.element.weight;
          min.id:= l^.element.id;
        end;
      l:= l^.next;
      findLowerAndMax(l, min, max);
    end;
end;

procedure printTree (t: tree);
begin
  if (t <> nil) then
    begin
      if (t^.sl <> nil) then
        printTree(t^.sl);
      writeln('pc: ', t^.element.pc);
      if (t^.sr <> nil) then
        printTree(t^.sr);
    end;
end;

procedure printList (l: list);
begin
  if (l <> nil) then
    begin
      writeln('weight: ', l^.element.weight:0:2);
      l:= l^.next;
      printList(l);
    end;
end;

var
  t: tree;
  l: list;
  min, max: maxAndMin;
  pc: integer;
begin
  randomize;
  t:= nil;
  l:= nil;
  min.weight:= 3500;
  max.weight:= -1;
  min.id:= 0;
  min.id:= 0;
  pc:= 1080;

  writeln('Primero');

  createTree(t);

  printTree(t);

  writeln('Llegue');

  filterCP(t, pc, l);

  writeln('paseeee');
  printList(l);

  findLowerAndMax(l, min, max);
  
  if ((min.id <> 0) and (max.id <> 0)) then
    writeln('min: ', min.id, ', max: ', max.id);
end.
