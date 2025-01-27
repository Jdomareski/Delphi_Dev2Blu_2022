unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    edtCelcius: TEdit;
    btnConverter: TButton;
    mmHistorico: TMemo;
    edtFahrenheit: TEdit;
    procedure btnConverterClick(Sender: TObject);
  private
    Function TestarValores: Boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnConverterClick(Sender: TObject);
  var
    xCelcius, xFahrenheit: Double;
  begin
    if TestarValores then
      begin
        xCelcius := StrToFloat(edtCelcius.Text);
        xFahrenheit := (9 * xCelcius + 160) / 5;
        edtFahrenheit.Text := xFahrenheit.ToString;

        mmHistorico.Lines.Add(Format('%f�C � equivalente a %f�F', [xCelcius,  xFahrenheit]));
      end;
  end;

function TfrmPrincipal.TestarValores: Boolean;
  var
    xCelcius: Double;
  begin
  Result := False;
    try
      xCelcius := StrToFloat(edtCelcius.Text);
      Result := True;
    except
      ShowMessage('Erro ao informar o Valor!');
    end;
  end;

end.
