program nombrePrograma;
const
  pilots= 6;
  maxInitial= 5000;
  minInitial= 0;
var
  name, firstPilot, secondPilot, lastPilot, secondLastPilot: string[60];
  i, time, firstTime, secondTime, lastTime, secondLastTime: integer;
begin
  firstTime:= maxInitial;
  secondTime:= maxInitial;
  secondLastTime:= minInitial;
  for i:= 1 to pilots do
    begin
      write('Ingrese el nombre del piloto: ');
      readln(name);
      write('Ingrese el tiempo que tardo en completar el piloto la carrera: ');
      readln(time);
      if ((firstTime = secondTime) and (lastTime = secondLastTime)) then
        begin
          firstTime:= time;
          lastTime:= time;
          firstPilot:= name;
          lastPilot:= name;
        end
      else
        begin
          if (time < secondTime) then
            begin
              if (time > firstTime) then
                begin
                  secondTime:= firstTime;
                  secondPilot:= firstPilot;
                  firstPilot:= name;
                  firstTime:= time;
                end
              else
                begin
                  secondPilot:= name;
                  secondTime:= time;
                end;
            end;
          if (time > secondLastTime) then
            begin
              if (time > lastTime) then
                begin
                  secondLastPilot:= lastPilot;
                  secondLastTime:= lastTime;
                  lastTime:= time;
                  lastPilot:= name;
                end
              else
                begin
                  secondLastTime:= time;
                  secondLastPilot:= name;
                end;
            end;
        end;
      end;
  write('El primer piloto es ', firstPilot, ', el segundo piloto es ', secondPilot, ', el anteultimo piloto es ', secondLastPilot, ' y el ultimo es ', lastPilot);
end.
