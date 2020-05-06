program lab3_dop3;

var
  x, stx, lnt, a, b, h: real;
  i, fakt, z: integer;

Begin
  Writeln('По условию возможен ввод х только в случае 1 < x < 2. Вводите числа, которые соответствуют промежутку.');
  Write('Введите начальное значение х:');
  Readln(a);
  while (a <= 1) or (a >= 2) do // loop A
  begin
    Writeln('Несоответсвие условию!');
    Writeln('Введите еще раз начальное значение х:');
    Readln(a);
  end;
  Write('Введите конечное значение х:');
  Readln(b);
  while (b <= 1) or (b >= 2) do // loop B
  begin
    Writeln('Несоответсвие условию!');
    write('Введите еще раз конечное значение х:');
    Readln(b);
  end;
  Write('Введите шаг h:');
  Readln(h);
  x := a;
  stx := x - 1;
  fakt := 1;
  lnt := 0;
  i := 1;
  z := 1;
  while stx / fakt >= 0.001 do   // loop C
  begin
    lnt := lnt + z * stx / fakt;
    inc(i);
    stx := stx * (x - 1);
    fakt := i;
    z := z * (-1);
  end;
  Writeln('Значение ln(', x:6:4, ')= ', lnt:6:4);
  x := x + h;
  if (a < b) and (h > 0) then
    while x < (b - h / 10) do    // loop D
    begin
      stx := x - 1; { x в степени }
      fakt := 1; { значение знаменателя }
      lnt := 0; { первый элемент в разложении }
      i := 1; { счётчик }
      z := 1; { знак элемента }
      while stx / fakt >= 0.001 do // loop I
      begin
        lnt := lnt + z * stx / fakt;
        inc(i);
        stx := stx * (x - 1);
        fakt := i;
        z := z * (-1); { смена знака }
      end;
      Writeln('Значение ln(', x:6:4, ')= ', lnt:6:4);
      x := x + h;
    end
  else if (a > b) and (h < 0) then
    while x > (b - h / 10) do  // loop E
    begin
      stx := x - 1; { x в степени }
      fakt := 1; { значение знаменателя }
      lnt := 0; { первый элемент в разложении }
      i := 1; { счётчик }
      z := 1; { знак элемента }
      while stx / fakt >= 0.001 do  // loop F
      begin
        lnt := lnt + z * stx / i;
        inc(i);
        stx := stx * (x - 1);
        fakt := i;
        z := z * (-1); { смена знака }
      end;
      Writeln('Значение ln(', x:6:4, ')= ', lnt:6:4);
      x := x + h;
    end;
  x := b;
  stx := x - 1; { x в степени }
  fakt := 1; { значение знаменателя }
  lnt := 0; { первый элемент в разложении }
  i := 1; { счётчик }
  z := 1; { знак элемента }
  Writeln('Значение ln(', x:6:4, ')= ', lnt:6:4);
  Readln;

end.
