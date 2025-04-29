program ejer3;
const
  highValue = 9999;
type

  logObj = record
    id: integer;
    date: string[10];
    time: integer;
  end;

  archive = file of logObj;

  list = ^node;

  logList = record
    date: string[10];
    time: integer;
  end;

  node = record
    data: logList;
    next: list;
  end;

  listUsers = ^nodeUsers;

  nodeUsers = record
    id: integer;
    data: list;
    next: listUsers;
  end;

procedure readArchive (var a: archive; var l: log);
begin
  if (not eof(a)) then
    read(a, l)
  else
    l.id:= highValue;
end;

procedure chargeLog (var l: logList; date: string; time: integer);
var
  newNode, prev, act: logList;
begin
  if (l = nil) then
    begin
      new(newNode);
      newNode^.data.date:= date;
      newNode^.data.time:= time;
      newNode^.next:= nil;
    end
  else
    begin
      act:= l;
      while ((act <> nil) and (act^.date < date)) do
        begin
          prev:= act;
          act:= act^.next;
        end;

      if (act = l) then
        begin
          if (act^.data.date = date) then
            act^.data.time:= act^.data.time + time
          else
            begin
              new(newNode);
              newNode^.data.date:= date;
              newNode^.data.time:= time;
              newNode^.next:= act;
              l:= newNode;
            end;
        end
      else
        begin
          if (act^.data.date = date) then
            act^.data.time:= act^.data.time + time
          else
            begin
              new(newNode);
              newNode^.data.date:= date;
              newNode^.data.time:= time;
              prev^.next:= newNode;
              newNode^.next:= act;
            end;
        end;
    end;
end;

procedure chargeUser (var l: listUsers; log: logObj);
var
  newNode, prev, act: listUsers;
begin
  if (l = nil) then
    begin
      new(newNode);
      newNode^.id:= log.id;
      newNode^.data:= nil;
      chargeLog(l^.data, log.date, log.time);
      newNode^.next:= nil;
      l:= newNode;
    end
  else
    begin
      act:= l;
      while ((act <> nil) and (act^.id < log.id)) do
        begin
          prev:= act;
          act:= act^.next;
        end;
      
      if (act = l) then
        begin
          if (log.id < act^.id) then
            begin
              new(newNode);
              newNode^.id:= log.id;
              newNode^.data:= nil;
              new(newNode^.data);
              chargeLog(newNode^.data, date, time);
              newNode^.next:= act;
              l:= newNode;
            end
          else
            chargeLog(act^.data, date, time);
        end
      else
        begin
          if ((act <> nil) and (log.id = act^.id)) then
            chargeLog(act^.data, date, time)
          else
            begin
              new(newNode);
              newNode^.id:= id;
              newNode^.data:= nil;
              chargeLog(newNode^.data, date, time);
              prev^.next:= newNode;
              newNode^.next:= act;
            end;
        end;
    end;
end;

procedure printLog (l: logList);
begin
  if (l <> nil) then
    begin
      writeln(l^.data.date, ' tiene ', l^.data.time, ' minutos trabajados.');
      printLog(l^.next);
    end;
end;

procedure printListUsers (l: listUsers);
begin
  if (l <> nil) then
    begin
      writeln('Usuario ', l^.id);
      printLog(l^.data);
      printListUsers(l^.next);
    end;
end;
{
  Suponga que trabaja en una oficina donde está montada una LAN (red local). La 
  misma fue construida sobre una topología de red que conecta 5 máquinas entre sí y 
  todas  las  máquinas  se  conectan  con  un  servidor  central.  Semanalmente  cada 
  máquina genera un archivo de logs informando las sesiones abiertas por cada usuario 
  en cada terminal y por cuánto tiempo estuvo abierta. Cada archivo detalle contiene 
  los  siguientes  campos:  cod_usuario,  fecha,  tiempo_sesion.  Debe  realizar  un 
  procedimiento que reciba los archivos detalle y genere un archivo maestro con los 
  siguientes datos: cod_usuario, fecha, tiempo_total_de_sesiones_abiertas. 
  Notas: 
  ●  Los archivos detalle no están ordenados por ningún criterio. 
  ●  Un usuario puede iniciar más de una sesión el mismo día en la misma máquina, 
  o inclusive, en diferentes máquinas. 
}
var

begin

end.
