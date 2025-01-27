program Records;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
  TRegCliente = Record
    Codigo: Integer;
    Nome: String;
    Idade: byte;
  End;

  TListaCliente = array of TRegCliente;
var
  xContinuar: Integer;
  xCliente: TRegCliente;
  xListaCliente: TListaCliente;

procedure AddCliente (const aRegCliente: TRegCliente);
  begin
    SetLength(xListaCliente, Length(xListaCliente) + 1);
    xListaCliente[Length(xListaCliente)-1] := aRegCliente;
  end;

procedure ListarClientes;
  var
    I:Integer;
    xRegCliente: TRegCliente;
  begin
    WriteLn('Listando...');

    for I := 0 to Length(xListaCliente)-1 do
      begin
        xRegCliente := xListaCliente[I];

        WriteLn('C�digo: ' + xRegCliente.Codigo.ToString);
        WriteLn('Nome: ' + xRegCliente.Nome);
        WriteLn('Idade: ' + xRegCliente.Idade.ToString);
      end;
  end;
begin
  try
    repeat
      Write('Entre com o C�digo do Cliente: ');
      ReadLn(xCliente.Codigo);

      Write('Entre com o Nome do Cliente: ');
      ReadLn(xCliente.Nome);

      Write('Entre com o Idade do Cliente: ');
      ReadLn(xCliente.Idade);

      AddCliente(xCliente);

      Write('Deseja cadastrar mais clientes? (1-Sim / 2-N�o) ');
      Readln(xContinuar);

    until (xContinuar = 2);

    ListarClientes;

    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
