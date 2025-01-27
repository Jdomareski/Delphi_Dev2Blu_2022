program Project9;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  xCelsius: Integer;
  xFahrenheit: Double;
  xResp: String;

begin
  try
    repeat
      Write('Digite a temperatura em Celsius: ');
      Readln(xCelsius);

      xFahrenheit := 9 * xCelsius / 5 + 32;

      WriteLn('Equivalente em Fahrenheit: ' + FloatToStr(xFahrenheit) + '�F');

      Write('Deseja repetir? (S/N) ');
      Readln(xResp);

    until (xResp = 'n');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
