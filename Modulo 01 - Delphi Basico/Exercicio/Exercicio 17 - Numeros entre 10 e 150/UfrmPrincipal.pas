unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCadastrar: TButton;
    mmEntre10e150: TMemo;
    mmNaoEntre10e150: TMemo;
    lblEntre10e150: TLabel;
    lblNaoEntre10e150: TLabel;
    mmHistorico: TMemo;
    lblHistorico: TLabel;
    lblTotal: TLabel;
    lblTotalEntre10e150: TLabel;
    lblTotalNaoEntre10e150: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
  private
    {Function NovoCadastro(aVezes: Integer): String;}
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{Function NovoCadastro(aVezes: Integer): String;
  begin

  end;}
procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
  var
    I: Integer;
    xVezes: Integer;
    {xLista: array of double;}
    xNumero: Double;

  begin
    if TryStrToInt(inputbox('Informar', 'Informar quantidade de cadastros', '0'), xVezes) then
      begin
        if xVezes > 0 then
          for I := 0 to xVezes - 1 do
            begin
              if TryStrToFloat(inputbox('Informar',
              Format('Informe seu %d� n�mero', [(I + 1)]),
              '0'), xNumero)  then
                begin
                  {xLista[I] := xNumero;}

                  if (xNumero >= 10) and (xNumero <=150) then
                    begin
                      mmEntre10e150.Lines.add(xNumero.ToString);
                    end
                  else
                    begin
                      mmNaoEntre10e150.Lines.add(xNumero.ToString);
                    end;

                    mmHistorico.Lines.add(xNumero.ToString)
                end
              else
                raise Exception.Create('Informe apenas N�meros!');
            end;
      end
    else
      raise Exception.Create('Informe apenas valores inteiros!');

    mmEntre10e150.Visible := True;
    lblEntre10e150.Visible := True;
    lblTotalEntre10e150.Caption := 'Total: ' + mmEntre10e150.Lines.Count.ToString;
    lblTotalEntre10e150.Visible := True;
    mmNaoEntre10e150.Visible := True;
    lblNaoEntre10e150.Visible := True;
    lblTotalNaoEntre10e150.Caption := 'Total: ' + mmNaoEntre10e150.Lines.Count.ToString;
    lblTotalNaoEntre10e150.Visible := True;
    mmHistorico.Visible := True;
    lblHistorico.Visible := True;
    lblTotal.Caption := 'Total: ' + mmHistorico.Lines.Count.ToString;
    lblTotal.Visible := True;
  end;

end.
