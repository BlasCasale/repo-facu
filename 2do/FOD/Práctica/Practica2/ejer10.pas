program ejer10;
const
  highValue = 9999;
type

  survey = record
    prov: integer;
    locality: integer;
    table: integer;
    votes: integer;
  end;

procedure readText (var a: text; var s: survey);
begin
  if (not eof(a)) then
    readln(a, s.prov, s.locality, s.table, s.votes)
  else
    s.prov:= highValue;
end;
{
  Se  necesita  contabilizar  los  votos  de  las  diferentes  mesas  electorales  registradas  por  
  provincia y localidad. Para ello, se posee un archivo con la siguiente información: código de 
  provincia,  código  de  localidad,  número  de  mesa  y  cantidad  de  votos  en  dicha  mesa. 
  Presentar en pantalla un listado como se muestra a continuación: 
  Código de Provincia 
  Código de Localidad                Total de Votos 
  ................................                  ...................... 
  ................................                  ...................... 
  Total de Votos Provincia: ____ 
  Código de Provincia 
  Código de Localidad                Total de Votos 
  ................................                  ...................... 
  Total de Votos Provincia: ___ 
  .................................................................... 
  Total General de Votos: ___ 
  NOTA: La información está ordenada por código de provincia y código de localidad.
}
var
  a: text;
  s: survey;
  prov, locality, votesProv, votesLocality, total: integer;
begin
  assign(a, 'votosProvincias.txt');
  reset(a);
  readText(a, s);

  total:= 0;

  while (s.prov <> highValue) do
    begin
      prov:= s.prov;
      votesProv:= 0;
      writeln('Provincia ', s.prov);
      while (s.prov = prov) do
        begin
          locality:= s.locality;
          votesLocality:= 0;
          writeln('Localidad ', s.locality);
          while ((s.prov = prov) and (s.locality = locality)) do
            begin
              votesLocality:= votesLocality + s.votes;
              readText(a, s);
            end;
          writeln('Votos totales por localidad ', votesLocality);
          votesProv:= votesProv + votesLocality;
        end;
      writeln('Votos de la provincia ', votesProv);
      total:= total + votesProv;
    end;

  writeln('Totalidad de votos ', total);

  close(a);
end.
