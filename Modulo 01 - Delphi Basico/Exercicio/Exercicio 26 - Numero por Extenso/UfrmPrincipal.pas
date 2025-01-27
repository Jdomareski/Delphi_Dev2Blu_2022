unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TNumeros = (TnUm = 1, TnDois, TnTres, TnQuatro, TnCinco);
  TfrmPrincipal = class(TForm)
    edtDigito: TEdit;
    btnTestar: TButton;
    lblTitulo: TLabel;
    lblResposta: TLabel;
    lblSubTitulo: TLabel;
    procedure btnTestarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnTestarClick(Sender: TObject);
  var
    xNumero: Integer;
  begin
    if TryStrToInt(edtDigito.Text, xNumero) then
      begin
        lblResposta.Caption := 'O n�mero digitado foi ';
        case TNumeros(xNumero) of
          TnUm:
            begin
              lblResposta.Caption := lblResposta.Caption + 'um.';
            end;
          TnDois:
            begin
              lblResposta.Caption := lblResposta.Caption + 'dois.';
            end;
          TnTres:
            begin
              lblResposta.Caption := lblResposta.Caption + 'tr�s';
            end;
          TnQuatro:
            begin
              lblResposta.Caption := lblResposta.Caption + 'quatro.';
            end;
          TnCinco:
            begin
              lblResposta.Caption := lblResposta.Caption + 'cinco.';
            end
          else
            begin         
              lblResposta.Caption := 'N�mero Inv�lido, fora do limite.';
            end;
        end;
        lblResposta.Visible := True;
      end
    else
      begin
        lblResposta.Visible := False;
        ShowMessage('Por favor, insira um n�mero v�lido no campo.');
      end;
  end;
end.
