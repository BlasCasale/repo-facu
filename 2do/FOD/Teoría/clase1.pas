program clase1;

type
  employeObj = record
    name: string;
    age: integer;
    salary: real;
  end;

  arch_emp = file of employeObj;

procedure roam (var arch: arch_emp); // se pasa por referencia para que el buffer pueda acceder e ir recopilando el archivo
var
  e: employeObj; // se usa para leer en el archivo
begin
  reset(arch);
  while (not eof(arch)) do
    begin
      read(arch, e);
      write(e.name);
      write(e.age);
      write(e.salary);
    end;
  close(arch);
end;

procedure update (var arch: arch_emp);
var
  e: employeObj;
begin
  reset(arch);
  
  while (not eof(arch)) do
    begin
      read(arch, e);
      e.salary:= e.salary * 1.1;
      seek(e, filepos(e) - 1);
      write(arch, e);
    end;
  
  close(arch);
end;

var
  arch: arch_emp;
  e: employeObj;
begin
  // para inicializar un archivo se hace un assign(n_logico,n_fisico)
  assign(arch,'clase1.txt');

  rewrite(arch); // creo el archivo en memoria

  read(e.name);
  read(e.age);

  while (e.age <> 0) do
    begin
      write(arch, e); // se escribe en el archivo el nuevo empleado
      read(e.age);
      if (e.age <> 0) then
        read(e.name);
        read(e.salary);
    end;

  update(arch);

  roam(arch);
  
  close(arch); // cerramos el archivo

  // n_l = nombre_logico (programa) !! n_f = nombre_fisico (en memoria)

  // con Rewrite(nombre_logico) => solo escritura (creacion)

  // con Reset(nombre_logico) => solo lectura (apertura)

  // con Close(nombre_logico) => cierre del archivo => se coloca al final del archivo un EOF

  // read(n_l, variable)

  // write(n_l, variable)

  // estas operaciones leen o escriben sobre los buffer relacionados a los archivos

  // no trabajan sobre la memoria secundaria

  // eof(n_l) (funcion)

  // filesize(n_l) (funcion):int => retorna la cantidad de registros

  // filepos(n_l) (funcion):int => posicion dentro del archivo

  // seek(n_l, posicion) (procedimiento) => ir a una posicion del archivo, la posicion se cuenta desde el comienzo
end.
