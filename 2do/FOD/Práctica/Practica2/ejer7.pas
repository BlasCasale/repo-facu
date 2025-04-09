program ejer7;
const
  highValue = 9999;
type
  student = record
    id: integer;
    lastName: string[20];
    name: string[20];
    completed: integer;
    approved: integer;
  end;

  archive = file of student;

  subject = record
    id: integer;
    idSt: integer;
    approved: integer;
    date: string[11];
  end;

  exam = record
    id: integer;
    idSt: integer;
    note: integer;
    date: string[11];
  end;

procedure readSubject (var a: text; var s: subject);
begin
  if (not eof(a)) then
    readln(a, s.idSt, s.id, s.approved, s.date)
  else
    s.idSt:= highValue;
end;

procedure readExam (var a: text; var e: exam);
begin
  if (not eof(a)) then
    readln(a, e.idSt, e.id, e.note, e.date)
  else
    e.idSt:= highValue;
end;

procedure readArchive(var a: archive; var s: student);
begin
  if (not eof(a)) then
    read(a, s)
  else
    s.id:= highValue;
end;

procedure printMaster (var a: archive);
var
  s: student;
begin
  reset(a);
  readArchive(a, s);
  while (s.id <> highValue) do
    begin
      writeln(s.id, ' ', s.approved, ' ', s.completed, ' ', s.name, ' ', s.lastName);
      readArchive(a, s);
    end;

  close(a);
end;
{
  Se  dispone  de  un  archivo  maestro  con  información  de  los  alumnos  de  la  Facultad  de 
  Informática. Cada registro del archivo maestro contiene: código de alumno, apellido, nombre, 
  cantidad  de  cursadas  aprobadas  y  cantidad  de  materias  con  final  aprobado.  El  archivo 
  maestro está ordenado por código de alumno. 
  Además, se tienen dos archivos detalle con información sobre el desempeño académico de 
  los  alumnos:  un  archivo  de  cursadas  y  un  archivo  de  exámenes  finales.  El  archivo  de 
  cursadas contiene información sobre las materias cursadas por los alumnos. Cada registro 
  incluye: código de alumno, código de materia, año de cursada y resultado (solo interesa si la 
  cursada  fue  aprobada  o  desaprobada).  Por  su  parte,  el  archivo  de  exámenes  finales 
  contiene información sobre los exámenes finales rendidos. Cada registro incluye: código de 
  alumno,  código  de  materia,  fecha  del  examen  y nota obtenida. Ambos archivos detalle 
  están ordenados por código de alumno y código de materia, y pueden contener 0, 1 o 
  más registros por alumno en el archivo maestro. Un alumno podría cursar una materia 
  muchas  veces,  así  como  también  podría  rendir  el  final  de  una  materia  en  múltiples 
  ocasiones. 
  Se debe desarrollar un programa que actualice el archivo maestro, ajustando la cantidad 
  de  cursadas  aprobadas  y  la  cantidad  de  materias  con  final  aprobado,  utilizando  la 
  información de los archivos detalle. Las reglas de actualización son las siguientes: 
  ●  Si un alumno aprueba una cursada, se incrementa en uno la cantidad de cursadas 
  aprobadas. 
  ●  Si un alumno aprueba un examen final (nota >= 4), se incrementa en uno la cantidad 
  de materias con final aprobado. 
  Notas: 
  ●  Los archivos deben procesarse en un único recorrido. 
  ●  No  es  necesario  comprobar  que  no  haya inconsistencias en la información de los 
  archivos detalles. Esto es, no puede suceder que un alumno apruebe más de una 
  vez la cursada de una misma materia (a lo sumo la aprueba una vez), algo similar 
  ocurre con los exámenes finales
}
var
  stu: student;
  sub: subject;
  ex: exam;
  m: archive;
  s, e: text;
  counter: integer;
begin
  assign(m, 'alumnos.txt');
  assign(s, 'materias.txt');
  assign(e, 'examenes.txt');

  printMaster(m);

  reset(m);
  reset(s);
  reset(e);

  readArchive(m, stu);
  readSubject(s, sub);
  readExam(e, ex);

  while (stu.id <> highValue) do
    begin
      counter:= 0;
      while (stu.id = sub.idSt) do
        begin
          writeln(sub.approved);
          if (sub.approved = 1) then
            counter:= counter + 1;
          readSubject(s, sub);
        end;
        
      stu.completed:= stu.completed + counter;

      counter:= 0;

      while (stu.id = ex.idSt) do
        begin
          if (ex.note >= 4) then
            counter:= counter + 1;
          readExam(e, ex);
        end;
      stu.approved:= stu.approved + counter;

      seek(m, filepos(m) - 1);

      write(m, stu);
      readArchive(m, stu);
    end;

  close(m);
  close(s);
  close(e);

  printMaster(m);
end.
