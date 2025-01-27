unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtNumero01: TEdit;
    edtNumero02: TEdit;
    btnTestar: TButton;
    lblNumero01: TLabel;
    lblNumero02: TLabel;
    lblSinal: TLabel;
    lblResposta: TLabel;
    procedure btnTestarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnTestarClick(Sender: TObject);
  var
    xNumero01, xNumero02: Double;
  begin
    if TryStrToFloat(edtNumero01.Text, xNumero01) and TryStrToFloat(edtNumero02.Text, xNumero02) then
      begin
        lblNumero01.Caption := edtNumero01.Text;
        lblNumero02.Caption := edtNumero02.Text;
        if xNumero01 = xNumero02 then
          begin
            lblSinal.Caption := '=';
            lblResposta.Caption := 'Igual';
          end
        else
          begin
            lblResposta.Caption := 'Diferente';
            if xNumero01 > xNumero02 then
              begin
                lblSinal.Caption := '>';
              end
            else
              begin
                lblSinal.Caption := '<';
              end;
          end;
        lblNumero01.Visible := True;
        lblNumero02.Visible := True;
        lblSinal.Visible := True;
        lblResposta.Visible := True;
      end
    else
      begin
        lblNumero01.Visible := False;
        lblNumero02.Visible := False;
        lblSinal.Visible := False;
        lblResposta.Visible := False;
        ShowMessage('Erro na inser��o de N�meros!');
      end;
  end;
end.
