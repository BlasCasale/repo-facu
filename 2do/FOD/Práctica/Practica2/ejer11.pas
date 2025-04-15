program ejer11;
const
  highValue = 9999;
type

  employee = record
    id: integer;
    deparment: integer;
    division: integer;
    category: integer;
    hours: integer;
  end;

  vector = array [1..15] of real;

procedure chargeVec (var a: text; var v: vector);
var
  i: integer;
begin
  for i:= 1 to 15 do
    readln(a, v[i]);
end;

procedure readText (var a: text; var e: employee);
begin
  if (not eof(a)) then
    readln(a, e.id, e.deparment, e.division, e.category, e.hours)
  else
    e.id:= highValue;
end;

{
  Se tiene información en un archivo de las horas extras realizadas por los empleados de una 
  empresa en un mes. Para cada empleado se tiene la siguiente información: departamento, 
  división,  número  de  empleado,  categoría  y  cantidad  de  horas  extras  realizadas  por  el 
  empleado.  Se  sabe  que  el  archivo  se  encuentra  ordenado  por  departamento,  luego  por 
  división  y,  por  último,  por  número  de  empleado.  Presentar  en  pantalla  un  listado  con  el 
  siguiente formato: 
              Departamento 
              División 
    Número de Empleado    Total de Hs.   Importe a cobrar 
     ......                                ..........               .........    
     ......                                ..........               .........    
  Total de horas división:  ____ 
  Monto total por división: ____ 
                                                      
  División  
       ................. 
  Total horas departamento: ____ 
  Monto total departamento: ____ 
  Para obtener el valor de la hora se debe cargar un arreglo desde un archivo de texto al 
  iniciar el programa con el valor de la hora extra para cada categoría. La categoría varía 
  de 1 a 15. En el archivo de texto debe haber una línea para cada categoría con el número 
  de categoría y el valor de la hora, pero el arreglo debe ser de valores de horas, con la 
  posición del valor coincidente con el número de categoría
}
var
  v: vector;
  a, vec: text;
  hoursDep, deparment, hoursDiv, division, id: integer;
  totalDep, totalDiv, amount: real;
  e: employee;
begin
  assign(a, 'horasEmpleados.txt');
  assign(vec, 'pagaPorHora.txt');
  reset(a);
  reset(vec);
  chargeVec(vec, v);

  readText(a, e);

  while (e.id <> highValue) do
    begin
      deparment:= e.deparment;
      hoursDep:= 0;
      totalDep:= 0;
      while ((e.id <> highValue) and (e.deparment = deparment)) do
        begin
          division:= e.division;
          hoursDiv:= 0;
          totalDiv:= 0;
          while ((e.id <> highValue) and (e.deparment = deparment) and (e.division = division)) do
            begin
              amount:= v[e.category] * e.hours;
              hoursDiv:= hoursDiv + e.hours;
              totalDiv:= totalDiv + amount;
              writeln('ID ', e.id, ' trabajo ', e.hours, ' y cobrara $', amount:0:2);
              readText(a, e);
            end;
          writeln('Division ', division, ' trabajo ', hoursDiv, ' horas en total');
          hoursDep:= hoursDep + hoursDiv;
          totalDep:= totalDep + totalDiv;
        end;
      writeln('Departamento ', deparment, ' trabajo ', hoursDep, ' horas en total y cobro ', totalDep:0:2);
    end;

  close(a);
  close(vec);
end.
