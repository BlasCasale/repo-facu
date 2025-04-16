program ejer13;

type

  log = record
    id: integer;
    username: string[20];
    name: string[20];
    lastname: string[20];
    mails: integer;
  end;

  mail = record
    id: integer;
    receiver: string[30];
    body: string;
  end;

procedure readLog (var a: text; var l: log);
begin
  if (not eof(a)) then
    readln(a, l.id, l.username, l.name, l.lastname, l.mails)
  else
    l.id:= highValue;
end;

procedure readMail (var a: text; var m: mail);
begin
  if (not eof(a)) then
    readln(a, m.id, m.receiver, m.body)
  else
    m.id:= highValue;
end;

{
  Suponga que usted es administrador de un servidor de correo electrónico. En los logs del 
  mismo (información guardada acerca de los movimientos que ocurren en el server) que se 
  encuentra  en  la  siguiente  ruta:  /var/log/logmail.dat  se  guarda  la  siguiente  información: 
  nro_usuario,  nombreUsuario,  nombre,  apellido,  cantidadMailEnviados.  Diariamente  el 
  servidor  de  correo  genera  un  archivo  con  la  siguiente  información:  nro_usuario, 
  cuentaDestino, cuerpoMensaje. Este archivo representa todos los correos enviados por los 
  usuarios  en  un  día  determinado.  Ambos  archivos  están  ordenados  por  nro_usuario  y se 
  sabe que un usuario puede enviar cero, uno o más mails por día. 
  a.  Realice el procedimiento necesario para actualizar la información del log en un 
  día particular. Defina las estructuras de datos que utilice su procedimiento. 
  b.  Genere un archivo de texto que contenga el siguiente informe dado un archivo 
  detalle de un día determinado: 
  nro_usuarioX..............cantidadMensajesEnviados 
  .............   
  nro_usuarioX+n...........cantidadMensajesEnviados 
  Nota: tener en cuenta que en el listado deberán aparecer todos los usuarios que 
  existen  en  el  sistema.  Considere  la  implementación  de  esta  opción  de  las 
  siguientes maneras: 
  i- Como un procedimiento separado del punto a). 
  ii- En el mismo procedimiento de actualización del punto a). Qué cambios 
  se requieren en el procedimiento del punto a) para realizar el informe en 
  el mismo recorrido?
}

var
  logs, mails, report: text;
  m: mail;
  l: log;
  count, i: integer;
begin
  assign(logs, 'logsMail.txt');
  assign(mails, 'mailsUsuarios.txt');
  assign(report, 'resporteMails.txt');

  reset(mails);
  reset(logs);
  rewrite(report);

  readMail(mails, m);
  readLog(logs, l);

  i:= 0;

  while (m.id <> highValue) do
    begin
      counts:= 0;
      i:= 1;
      while (m.id <> l.id) do
        readLog(logs, l);

      while (m.id = l.id) do
        begin
          readMail(mails, m);
          count:= count + 1;
        end;

      writeln(report, 'Numero de usuario ', i, ' envio ', count, ' mails.');
    end;

  close(mails);
  close(logs);
  close(report);
end.
