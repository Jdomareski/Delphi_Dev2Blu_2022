unit UMetodos;

interface

uses
  System.SysUtils, Vcl.Dialogs;

type
  TTipoFuncionario = (tpMenor3 = 1, tpEntre3e10, tpEntre10e20, tpOutros);
  TFuncionario = record
    Nome: String;
    Salario: Currency;
    Tipo: TTipoFuncionario;
  end;

var
  xListaFuncionarios: array of TFuncionario;

procedure AumentarLista;
procedure CadastrarFuncionario;
function CalcularAumento(const aSalario: Currency; aTipo: TTipoFuncionario): Currency;
function ListarTotal: String;

implementation

procedure AumentarLista;
  begin
    SetLength(xListaFuncionarios, Length(xListaFuncionarios) + 1);

  end;

procedure CadastrarFuncionario;
  var
    xFuncionario: TFuncionario;
    xSalarioMinimo: Currency;
    xVezes: Integer;
  begin
    xVezes := 1;
    while not TryStrToCurr(InputBox('Adicionando um funcion�rio ','Qual o valor do sal�rio m�nimo vingente?',''), xSalarioMinimo) do
      ShowMessage('Erro na inser��o do Sal�rio M�nimo, tente novamente.');
    Repeat
      xFuncionario.Nome := InputBox('Adicionando um funcion�rio ',Format('Qual o Nome do %d Funcion�rio? ', [xVezes]),'<Desconhecido>');
      while not TryStrToCurr(InputBox('Adicionando um funcion�rio ',Format('Qual o Sal�rio do %d Funcion�rio? ', [xVezes]), '0'), xFuncionario.Salario) do
        ShowMessage('Erro na inser��o do Sal�rio, tente novamente.');
      if xFuncionario.Salario < (xSalarioMinimo * 3) then
        begin
          xFuncionario.Tipo := tpMenor3;
        end
      else if xFuncionario.Salario >= (xSalarioMinimo * 10)then
        begin
          xFuncionario.Tipo := tpEntre3e10;
        end
      else if (xFuncionario.Salario >= (xSalarioMinimo * 20))then
        begin
          xFuncionario.Tipo := tpEntre10e20;
        end
      else
        begin
          xFuncionario.Tipo := tpOutros;
        end;

      if not (xFuncionario.Nome = '') or (xFuncionario.Salario = 0) then
        begin
          AumentarLista;
          xListaFuncionarios[Length(xListaFuncionarios) - 1] := xFuncionario;
        end
      else
        break;
    Until (xFuncionario.Nome = '') or (xFuncionario.Salario = 0);
  end;

function CalcularAumento(const aSalario: Currency; aTipo: TTipoFuncionario): Currency;
  begin
    case TTipoFuncionario(aTipo) of
      tpMenor3:
        begin
          Result := aSalario * 1.5;
        end;
      tpEntre3e10:
        begin
          Result := aSalario * 1.2;
        end;
      tpEntre10e20:
        begin
          Result := aSalario * 1.15;
        end;
      tpOutros:
        begin
          Result := aSalario * 1.1;
        end;
    end;
  end;

function ListarTotal: String;
  var
    I: integer;
  begin
    for I := 1 to Length(xListaFuncionarios) do
      Result:= Format('%s - De %n para %n',
      [xListaFuncionarios[I].Nome,
      xListaFuncionarios[I].Salario,
      CalcularAumento(xListaFuncionarios[I].Salario, xListaFuncionarios[I].Tipo)]);
  end;
end.
