program lab3;

{$APPTYPE CONSOLE}
{$R *.res}

var
  x, f1, f2, p, Delta, epsilon: real;
  z, k: integer;

begin
writeln('_____________________________________________________________________________________________');
writeln('|x:      |f1(x)           |e=10^(-2)            |e=10^(-3)            |e=10^(-4)            |');
writeln('|        |                |_____________________|_____________________|_____________________|');
writeln('|        |                |f2(x)        |N      |f2(x)        |N      |f2(x)        |N      |');
writeln('|________|________________|_____________|_______|_____________|_______|_____________|_______|');
  x := -0.6;
  for z := 1 to 20 do // loop D
  begin
    f1 := x / 2 + (x * x) / 4 + 1 / 2 * (1 - (x * x)) * ln(1 - x);
    write('|',x:6:2, '  |', f1:11:5,'     |');
    epsilon := 0.01;
    k := 1;
    p := x * x * x;
    Delta := p / (k * (k + 2));
    f2 := 0;
    repeat // loop A
      f2 := f2 + Delta;
      p := p * x;
      k := k + 1;
      Delta := p / (k * (k + 2));
    until abs(Delta) < epsilon;
    write(f2:11:5, '  |', k :5,'  |');
    epsilon := 0.001;
    while abs(Delta) > epsilon do // loop B
    begin
      f2 := f2 + Delta;
      p := p * x;
      k := k + 1;
      Delta := p / (k * (k + 2));
    end;
    write(f2:11:5, '  |', k :5,'  |');
    epsilon := 0.0001;
    while abs(Delta) > epsilon do // loop C
    begin
      f2 := f2 + Delta;
      p := p * x;
      k := k + 1;
      Delta := p / (k * (k + 2));
    end;
    write(f2:11:5, '  |', k :5,'  |');
    writeln;
    x := x + 0.05;
  end;
  writeln('_____________________________________________________________________________________________');
  readln;
end.
