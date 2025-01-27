unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtNumerador: TEdit;
    lblSauda��o: TLabel;
    lblTitulo: TLabel;
    lblSoma: TLabel;
    edtDenominador: TEdit;
    lblIgual: TLabel;
    lblResultado: TLabel;
    btnSomar: TButton;
    procedure btnSomarClick(Sender: TObject);
  private
    function Somar(aNumerador, aDenominador: String): String;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.Somar(aNumerador, aDenominador: String): string;
  var
    xsoma: Double;
  begin
    xsoma := StrToFloat(aNumerador) + StrToFloat(aDenominador);
    result := xSoma.ToString;
  end;

procedure TfrmPrincipal.btnSomarClick(Sender: TObject);
  begin
    try
      lblResultado.Caption := Somar(edtNumerador.Text, edtDenominador.Text);
    except
      lblResultado.Caption   := 'Indique somente n�meros Reais!';
    end;
    lblResultado.Visible   := True;
  end;

end.
