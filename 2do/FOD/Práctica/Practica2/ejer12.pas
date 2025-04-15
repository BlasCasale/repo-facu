program ejer12;
const
  highValue = 9999;
type

  user = record
    id: integer;
    year: integer;
    month: integer;
    day: integer;
    time: integer;
  end;

procedure readText (var a: text; var u: user);
begin
  if (not eof(a)) then
    readln(a, u.id, u.year, u.month, u.day, u.time)
  else
    u.id:= highValue;
end;
{
  La empresa de software ‘X’ posee un servidor web donde se encuentra alojado el sitio web 
  de la organización. En dicho servidor, se almacenan en un archivo todos los accesos que se 
  realizan al sitio. La información que se almacena en el archivo es la siguiente: año, mes, día, 
  idUsuario y tiempo de acceso al sitio de la organización. El archivo se encuentra ordenado 
  por los siguientes criterios: año, mes, día e idUsuario. 
  Se debe realizar un procedimiento que genere un informe en pantalla, para ello se indicará 
  el año calendario sobre el cual debe realizar el informe. El mismo debe respetar el formato 
  mostrado a continuación:  
  
  Año : --- 
        Mes:-- 1 
  día:-- 1 
                     idUsuario 1   Tiempo Total de acceso en el dia 1 mes 1  
                     --------                      
            idUsuario N    Tiempo total de acceso en el dia 1 mes 1  
              Tiempo total acceso dia 1 mes 1     
    ------------- 
    día N 
      idUsuario 1   Tiempo Total de acceso en el dia N mes 1  
                     --------                      
            idUsuario N    Tiempo total de acceso en el dia N mes 1  
              Tiempo total acceso dia N mes 1 
         Total tiempo de acceso mes 1 
         ------        Mes 12 
    día 1 
                     idUsuario 1   Tiempo Total de acceso en el dia 1 mes 12  
                     --------                      
            idUsuario N    Tiempo total de acceso en el dia 1 mes 12  
              Tiempo total acceso dia 1 mes 12    
    ------------- 
    día N 
      idUsuario 1   Tiempo Total de acceso en el dia N mes 12                      
  --------                      
            idUsuario N    Tiempo total de acceso en el dia N mes 12  
              Tiempo total acceso dia N mes 12 
         Total tiempo de acceso mes 12 
   Total tiempo de acceso año 
  
  Se deberá tener en cuenta las siguientes aclaraciones: 
  ●  El año sobre el cual realizará el informe de accesos debe leerse desde el teclado. 
  ●  El año puede no existir en el archivo, en tal caso, debe informarse en pantalla “año 
  no encontrado”. 
  ●  Debe definir las estructuras de datos necesarias.  
  ●  El recorrido del archivo debe realizarse una única vez procesando sólo la información 
  necesaria.
}
var
  a: text;
  u: user;
  hoursMonth, hoursYear, month, yearToSearch: integer;
begin
  assign(a, 'usuariosX.txt');
  reset(a);

  writeln('Ingrese el año a buscar: ');
  readln(yearToSearch);

  readText(a, u);

  while ((u.id <> highValue) and (u.year <> yearToSearch)) do
    readText(a, u);
  
  if (u.year <> yearToSearch) then
    writeln('No se encontro el año buscado.')
  else
    begin
      hoursYear:= 0;
      while ((u.id <> highValue) and (u.year = yearToSearch)) do
        begin
          month:= u.month;
          hoursMonth:= 0;
          while ((u.id <> highValue) and (u.year = yearToSearch) and (u.month = month)) do
            begin
              hoursMonth:= hoursMonth + u.time;
              writeln('El usuario ', u.id, ' estuvo logeado ', (u.time / 60):0:2, ' horas el dia ', u.day, ' del mes ', u.month);
              readText(a, u);
            end;
          hoursYear:= hoursYear + hoursMonth;
          writeln('El mes ', month, ' se estuvo un total de uso de ', (hoursMonth / 60):0:2, ' horas');
        end;
    end;
    
  close(a);
end.
