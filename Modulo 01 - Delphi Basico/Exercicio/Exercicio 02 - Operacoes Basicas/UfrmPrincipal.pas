unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOpera��es = (opSomar, opSubtrair, opMultiplicar, opDividir, opDividirInteiro, opResto);
  TfrmPrincipal = class(TForm)
    lblSauda��o: TLabel;
    lblTitulo: TLabel;
    edtNumerador: TEdit;
    edtDenominador: TEdit;
    lblSoma: TLabel;
    btnCalcular: TButton;
    lblIgual: TLabel;
    lblResultado: TLabel;
    cobEquacao: TComboBox;
    procedure btnCalcularClick(Sender: TObject);
  private
    function Somar: String;
    function Subtrair: String;
    function Multiplicar: String;
    function Dividir: String;
    function DividirInteiro: String;
    function Resto: String;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
  var
    xText: String;
  begin
    try
      case TOpera��es(cobEquacao.ItemIndex) of
        opSomar: xText := self.Somar;
        opSubtrair: xText := self.Subtrair;
        opMultiplicar: xText := self.Multiplicar;
        opDividir: xText := self.Dividir;
        opDividirInteiro: xText := self.DividirInteiro;
        opResto: xText := self.Resto;
      end;
      lblResultado.Caption := FormatFloat('0.####', StrToFloat(xText));
      lblResultado.Visible := True;
    except
      lblResultado.Caption := 'Use apenas n�meros Reais!';
      lblResultado.Visible := True;
    end;
  end;

function TfrmPrincipal.Dividir: String;
  var
    xValor: Double;
  begin
    xValor := StrToFloat(edtNumerador.Text) / StrToFloat(edtDenominador.Text);
    Result := xValor.ToString;
  end;

function TfrmPrincipal.DividirInteiro: String;
  var
    xValor: Double;
  begin
    xValor := int((StrToFloat(edtNumerador.Text)) / (StrToFloat(edtDenominador.Text)));
    Result := xValor.ToString;
  end;

function TfrmPrincipal.Multiplicar: String;
  var
    xValor: Double;
  begin
    xValor := StrToFloat(edtNumerador.Text) * StrToFloat(edtDenominador.Text);
    Result := xValor.ToString;
  end;

function TfrmPrincipal.Resto: String;
  var
    xValor: Double;
  begin
    xValor := int((StrToFloat(edtNumerador.Text)) / (StrToFloat(edtDenominador.Text)));
    xValor := StrToFloat(edtNumerador.Text) - xValor * StrToFloat(edtDenominador.Text);
    Result := xValor.ToString;
  end;

function TfrmPrincipal.Somar: String;
  var
    xValor: Double;
  begin
    xValor := StrToFloat(edtNumerador.Text) + StrToFloat(edtDenominador.Text);
    Result := xValor.ToString;
  end;

function TfrmPrincipal.Subtrair: String;
  var
    xValor: Double;
  begin
    xValor := StrToFloat(edtNumerador.Text) - StrToFloat(edtDenominador.Text);
    Result := xValor.ToString;
  end;

end.
