program ejer11;
const
  long = 199;
  authorToCompare = 'Art Vandelay';
type
  photoObj = record
    title: string;
    author: string;
    likes: integer;
    visits: integer;
    commentaries: integer;
  end;

  vec = array [0..long] of photoObj;

procedure takeInfo (var photo: photoObj);
begin
  write('Ingrese el titulo de la foto: ');
  readln(photo.title);
  write('Ingrese el autor de la foto: ');
  readln(photo.author);
  write('Ingrese la cantidad de Me gusta de la foto: ');
  readln(photo.likes);
  write('Ingrese la cantidad de clicks que recibio la foto: ');
  readln(photo.visits);
  write('Ingrese la cantidad de comentarios que recibio la foto: ');
  readln(photo.commentaries);
end;
procedure getMoreVisits (v: vec; var maxPhoto: string);
var
  max, i: integer;
  actual: photoObj;
begin
  max:= -1;
  for i:= 0 to long do
    begin
      actual:= v[i];
      if (actual.visits >= max) then
        begin
          max:= actual.visits;
          maxPhoto:= actual.title;
        end;
    end;
end;
function getTotalLikes (v: vec): integer;
var
  i, counter: integer;
  actual: photoObj;
begin
  counter:= 0;
  for i:= 0 to long do
    begin
      actual:= v[i];
      if (actual.author = authorToCompare) then
        counter:= counter + actual.likes;
    end;
  getTotalLikes:= counter;
end;
procedure readCommentaries (v: vec);
var
  i: integer;
  actual: photoObj;
begin
  for i:= 0 to long do
    begin
      actual:= v[i];
      write('La foto con titulo ', actual.title, ' tiene ', actual.commentaries, ' comentarios en total.');  
    end;
end;
var
  i, likes: integer;
  maxPhoto: string;
  v: vec;
  photo: photoObj;
begin
  {
    200 fotos publicadas
    cada foto tiene titulo, autor, me gusta, clicks y comentarios
    titulo de la foto mas vista x
    cantidad de likes a las fotos del autor "Art Vandelay" x
    cantidad de comentarios para cada una de las fotos x
  }
  for i:= 0 to long do
    begin
      takeInfo(photo);
      v[i]:= photo;
    end;
  getMoreVisits(v, maxPhoto);
  likes:= getTotalLikes;
  readCommentaries(v);
end.
