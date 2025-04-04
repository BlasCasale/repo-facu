program ejer1;

{
Una empresa posee un archivo con informaci�n de los ingresos percibidos por diferentes empleados en concepto de comisi�n,
de cada uno de ellos se conoce: c�digo de empleado, nombre y monto de la comisi�n. La informaci�n del archivo se encuentra
ordenada por c�digo de empleado y cada empleado puede aparecer m�s de una vez en el archivo de comisiones.

Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En consecuencia, deber� generar un
nuevo archivo en el cual, cada empleado aparezca una �nica vez con el valor total de sus comisiones.

NOTA: No se conoce a priori la cantidad de empleados. Adem�s, el archivo debe ser recorrido una �nica vez.
}

const
     highCode = 9999;

type
    employee = record
             id: integer;
             name: string[50];
             amount: real;
    end;

    archive = file of employee;

procedure readArchive (var a: archive; var e: employee);
begin
     if (not eof(a)) then
        read(a, e)
     else
         e.id:= highCode;
end;

procedure setInfo (var e: employee);
begin
     writeln('ID: ');
     readln(e.id);
     if (e.id <> highCode) then
        begin
             writeln('Nombre: ');
             readln(e.name);
             writeln('Comision: ');
             readln(e.amount);
        end;
end;

procedure addEmployees (var a: archive);
var
   e: employee;
begin
     reset(a);
     seek(a, filesize(a));
     setInfo(e);
     while (e.id <> highCode) do
           begin
                write(a, e);
                setInfo(e);
           end;

     close(a);
end;

procedure resumeArchive (var a, na: archive);
var
   e, toW: employee;
   tot: real;
   act: integer;
   str: string[50];
begin
     reset(a);
     reset(na);
    readArchive(a, e);
    while (e.id <> highCode) do
          begin
               tot:= 0;
               act:= e.id;
               str:= e.name;
               while (e.id <> highCode) and (act = e.id) do
                     begin
                         tot:= e.amount + tot;
                         readArchive(a, e);
                     end;
               toW.id:= act;
               toW.amount:= tot;
               toW.name:= str;
               write(na, toW);
          end;
    close(a);
    close(na);
end;

procedure printArchive (var a: archive);
var
   e: employee;
begin
    reset(a);
    readArchive(a, e);
    while (e.id <> highCode) do
          begin
              writeln('ID: ', e.id);
              writeln('Nombre: ', e.name);
              writeln('Cosimion: ', e.amount:0:2);
              readArchive(a, e);
          end;
end;

var
   a, nA: archive;
   i: integer;
begin
     assign(a, 'detalleEmp.txt');
     assign(nA, 'resumenEmp.txt');

     writeln('1) Agregar comisiones de los empleados.');
     writeln('2) Resumir a un archivo todas las comisiones.');
     writeln('3) Imprimir detalle.');
     writeln('4) Imprimir resumen.');

     readln(i);

     case i of
          1: addEmployees(a);
          2: resumeArchive(a, nA);
          3: printArchive(a);
          4: printArchive(nA);
     end;
end.
