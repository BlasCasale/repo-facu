program tree;

type
  tree = ^node;

  node = record
    element: integer;
    left: tree;
    right: tree;
  end;

procedure add (var t: tree; num: integer);
begin
  if (t = nil) then
    begin
      new(t);
      t^.element:= num;
      t^.left:= nil;
      t^.right:= nil;
    end
  else
    begin
      // de esta manera poniendo en el menor estricto
      // logramos que los valores repetidos del arbol, vayan a la izquierda
      if (num <= t^.element) then
        add(t^.left, num)
      else
        add(t^.right, num);
    end;
end;

procedure inOrder (t: tree);
begin
  if (t <> nil) then
    begin
      roamTree(t^.left);
      writeln(t^.element);
      roamTree(t^.right);
    end;
end;

procedure preOrder (t: tree);
begin
  if (t <> nil) then
    begin
      writeln(t^.element);
      preOrder(t^.left);
      preOrder(t^.right);
    end;
end;

procedure postOrder (t: tree);
begin
  if (t <> nil) then
    begin
      postOrder(t^.left);
      postOrder(t^.right);
      writeln(t^.element);
    end;
end;

function search (t: tree; x: integer): boolean;
begin
  if (t = nil) then
    search:= false
  else
    search:= t^.element = x;

  if (x < t^.element) then
    search:= search(t.^right, x)
  else
    search:= search(t^.left, x);    
end;

var
  t: tree;
  num: integer;
begin
  t:= nil;
  add(t, num);
end.
