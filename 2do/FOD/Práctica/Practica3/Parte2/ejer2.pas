program ejer2;
const
  highValue = 9999;
type

  table = record
    id: integer;
    idTable: integer;
    quantity: integer;
  end;

  archive = file of table;

  list = ^node;

  counter = record
    id: integer;
    quantity: integer;
  end;

  node = record
    data: counter;
    next: list;
  end;

procedure chargeNode (var l: list; t: table);
var
  newNode, prev, act: list;
begin
  if (l = nil) then
    begin
      new(newNode);
      newNode^.data.id:= t.id;
      newNode^.data.quantity:= t.quantity;
      newNode^.next:= nil;
    end
  else
    begin
      act:= l;

      while ((act <> nil) and (act^.data.id < t.id)) do
        begin
          prev:= act;
          act:= act^.next;
        end;
      
        if (act = l) then
          begin
            if (act^.data.id = t.id) then
              act^.data.quantity:= act^.data.quantity + t.quantity
            else
              begin
                new(newNode);
                newNode^.data.id:= t.id;
                newNode^.data.quantity:= t.quantity;
                newNode^.next:= act;
                l:= newNode;
              end;
          end
        else
          begin
            if (act^.data.id = t.id) then
              act^.data.quantity:= act^.data.quantity + t.quantity
            else
              begin
                new(newNode);
                newNode^.data.id:= t.id;
                newNode^.data.quantity:= t.quantity;
                newNode^.next:= act;
                prev^.next:= newNode;
              end;
          end;
    end;
end;

procedure readArchive (var a: archive; var t: table);
begin
  if (not eof(a)) then
    read(a, t)
  else
    t.id:= highValue;
end;

procedure makeList (var a: archive; var l: list);
var
  t: table;
begin
  reset(a);
  readArchive(a, t);
  while (t.id <> highValue) do
    begin
      chargeNode(l, t);
      readArchive(a, t);
    end;
end;

procedure printList (l: list);
begin
  if (l <> nil) then
    begin
      writeln('Codigo de localidad ', l^.data.c.id, ' cantidad de votos ', l^.data.c.quantity);
      printList(l);
    end;
end;

{
  Se necesita contabilizar los votos de las diferentes mesas electorales registradas por  
  localidad  en  la  provincia  de  Buenos  Aires.  Para  ello,  se  posee  un  archivo  con la 
  siguiente información: código de localidad, número de mesa y cantidad de votos en 
  dicha mesa. Presentar en pantalla un listado como se muestra a continuación: 
  Código de Localidad                  Total de Votos 
  ................................                    ...................... 
  ................................                    ...................... 
  Total General de Votos:               .................. 
  NOTAS:  
  ●  La información en el archivo no está ordenada por ningún criterio. 
  ●  Trate de resolver el problema sin modificar el contenido del archivo dado. 
  ●  Puede  utilizar  una  estructura auxiliar, como por ejemplo otro archivo, para 
  llevar el control de las localidades que han sido procesadas.
}
var

begin

end.
