unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    mmPositivo: TMemo;
    mmMaior80: TMemo;
    mm40: TMemo;
    mmMenor25: TMemo;
    mmZero: TMemo;
    edtDigito: TEdit;
    btnTestar: TButton;
    lblTitulo: TLabel;
    lblPositivo: TLabel;
    mmNegativo: TMemo;
    lblMaior801: TLabel;
    lbl40: TLabel;
    lblMenor25: TLabel;
    lblZero: TLabel;
    lblNegativo: TLabel;
    lblNegativoTotal: TLabel;
    lblZeroTotal: TLabel;
    lblMenor25Total: TLabel;
    lbl40Total: TLabel;
    lblMaior80Total: TLabel;
    lblPositivoTotal: TLabel;
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
    xNumero: Double;
  begin
    if TryStrToFloat(edtDigito.Text, xNumero) then
      begin
        if xNumero > 0 then
          begin
            mmPositivo.Lines.add(xNumero.ToString);
            lblPositivoTotal.Caption := Format('Total: %d', [mmPositivo.Lines.Count]);
            if xNumero > 80 then
              begin
                mmMaior80.Lines.add(xNumero.ToString);
                lblMaior80Total.Caption := Format('Total: %d', [mmMaior80.Lines.Count]);
              end
            else if xNumero = 40 then
              begin
                mm40.Lines.add(xNumero.ToString);
                lbl40Total.Caption := Format('Total: %d', [mm40.Lines.Count]);
              end
            else if xNumero < 25 then
              begin
                mmMenor25.Lines.add(xNumero.ToString);
                lblMenor25Total.Caption := Format('Total: %d', [mmMenor25.Lines.Count]);
              end;
          end
        else if xNumero < 0 then
          begin
            mmNegativo.Lines.add(xNumero.ToString);
            lblNegativoTotal.Caption := Format('Total: %d', [mmNegativo.Lines.Count]);
            mmMenor25.Lines.add(xNumero.ToString);
            lblMenor25Total.Caption := Format('Total: %d', [mmMenor25.Lines.Count]);
          end
        else
          begin
            mmZero.Lines.add(xNumero.ToString);
            lblZeroTotal.Caption := Format('Total: %d', [mmZero.Lines.Count]);
          end;
      end
    else
      begin
        ShowMessage('Por favor, insira um n�mero no campo.')
      end;
  end;
end.
