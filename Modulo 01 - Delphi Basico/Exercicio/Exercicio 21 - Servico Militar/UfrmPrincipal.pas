unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TRegPessoa = Record
    Nome : String;
    Sexo : String;
    Saude : String;
    Idade : Integer;
  End;
  TPessoas = array of TRegPessoa;
  TForm1 = class(TForm)
    mmObrigatorio: TMemo;
    lblObrigatorio: TLabel;
    lblDespensado: TLabel;
    mmDispensado: TMemo;
    btnCadastrar: TButton;
    btnListar: TButton;
    lblTotalObrigatorio: TLabel;
    lblTotalDespensado: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    xRegPessoa: TRegPessoa;
    xPessoas: TPessoas;
    Function CadastrarPessoa(aNome, aSexo, aSaude: String; aIdade:Integer): Boolean;
    Procedure AumentarLista;
    Procedure ListarPessoas;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.AumentarLista;
  begin
    SetLength(xPessoas, Length(xPessoas) + 1);
  end;

procedure TForm1.btnCadastrarClick(Sender: TObject);
  Var
    xNome: String;
    xSexo: String;
    xSaude: String;
    xIdade: Integer;
  begin
    xNome := inputbox('Informar','Por favor, informe seu nome: ','<Des.>');
    repeat
      if xSexo <> '' then
        begin
          ShowMessage('Por Favor, use apenas M para Masculino ou F para feminino.');
        end;
      xSexo := UpperCase(Trim(inputbox('Informar','Por favor, informe seu sexo: (M/F) ',' ')));
    until (xSexo = 'M') or (xSexo = 'F');

    while (xSaude <> 'B') and (xSaude <> 'M') and (xSaude <> 'R') do
      begin
        ShowMessage('Por Favor, use apenas B para Bom, M para Mediano ou R para Ruim.');
        xSaude :=  UpperCase(Trim(inputbox('Informar','Por favor, informe seu estado de sa�de: ',' ')));
      end;

    repeat
      TryStrToInt(inputbox('Informar','Por Favor, informe sua idade: ', ' '), xIdade);
    until xIdade > 0;

    if CadastrarPessoa(xNome, xSexo, xSaude, xIdade) then
      begin
        ShowMessage('Registrado com Sucesso!')
      end
    else
      begin
        ShowMessage('Erro!');
      end;
  end;

procedure TForm1.btnListarClick(Sender: TObject);
  begin
    ListarPessoas;
  end;

function TForm1.CadastrarPessoa(aNome, aSexo, aSaude: String;
  aIdade: Integer): Boolean;
  begin
    Result := False;
    try
      AumentarLista;
      xPessoas[Length(xPessoas)-1].Nome := aNome;
      xPessoas[Length(xPessoas)-1].Sexo := aSexo;
      xPessoas[Length(xPessoas)-1].Saude := aSaude;
      xPessoas[Length(xPessoas)-1].Idade := aIdade;
    except
      ShowMessage('Erro na Fun��o');

    end;
    Result := True;
  end;

procedure TForm1.ListarPessoas;
  Var
   I: Integer;
   mm: Integer;
  begin
    for I := 0 to Length(xPessoas)-1 do
      if (xPessoas[I].Sexo = 'M') and (xPessoas[I].Idade >= 18) and (xPessoas[I].Idade <= 45)  then
        begin
          if mmObrigatorio.Lines.Count = 0 then
            begin
              mmObrigatorio.Lines.Add(Format('%s, %s, %s %d anos.',
              [xPessoas[I].Nome, xPessoas[I].Sexo, xPessoas[I].Saude, xPessoas[I].Idade]))
            end
          else
          begin
            for mm := 0 to mmObrigatorio.Lines.Count do

              mmObrigatorio.Lines[I] := (Format('%s, %s, %s %d anos.',
              [xPessoas[I].Nome, xPessoas[I].Sexo, xPessoas[I].Saude, xPessoas[I].Idade]))
          end;
        end
      else
        begin
          if mmDispensado.Lines.Count = 0 then
            begin
              mmDispensado.Lines.Add(Format('%s, %s, %s %d anos.',
              [xPessoas[I].Nome, xPessoas[I].Sexo, xPessoas[I].Saude, xPessoas[I].Idade]))
            end
          else
            begin
              for mm := 0 to mmDispensado.Lines.Count do

                mmDispensado.Lines[I] := (Format('%s, %s, %s %d anos.',
                [xPessoas[I].Nome, xPessoas[I].Sexo, xPessoas[I].Saude, xPessoas[I].Idade]))
            end;
        end;
    lblTotalObrigatorio.Caption := Format('Total: %d pessoa(s).', [mmObrigatorio.Lines.Count]);
    lblTotalDespensado.Caption := Format('Total: %d pessoa(s).', [mmDispensado.Lines.Count]);
  end;


end.
