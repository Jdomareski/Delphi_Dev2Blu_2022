unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnCadastrar: TButton;
    mmMulheres: TMemo;
    mmHomens: TMemo;
    lblMulheres: TLabel;
    lblHomens: TLabel;
    mmHistorico: TMemo;
    lblHistorico: TLabel;
    lblTotalHistorico: TLabel;
    lblTotalMulheres: TLabel;
    lblTotalHomens: TLabel;
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

procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
  var
    I: Integer;
    xVezes: Integer;
    xGenero: String;
    xNome: String;
  begin
    if TryStrToInt(inputbox('Informar', 'Informar quantidade de cadastros', '0'), xVezes) then
      begin
        if xVezes > 0 then
          for I := 0 to xVezes - 1 do
            begin
              xNome := inputbox('Informar', Format('Informe o %d� Nome',[(I + 1)]), '<Des>');
              repeat
                xGenero := UpperCase(trim(inputbox('Informar',
                'E informe o g�nero correspondente. (M - Masculino / F - Feminino) ', ' ')));
              until (xGenero = 'M') or (xGenero = 'F');

              if (xGenero = 'M') then
                begin
                  mmHomens.Lines.add(Format('%s - %s',
                  [xNome, xGenero]));
                end
              else
                begin
                  mmMulheres.Lines.add(Format('%s - %s', [xNome, xGenero]));
                end;

                mmHistorico.Lines.add(Format('%s - %s', [xNome, xGenero]));

            end;
      end
    else
      raise Exception.Create('Informe apenas valores inteiros!');

    mmMulheres.Visible := True;
    lblMulheres.Visible := True;
    lblTotalMulheres.Caption := 'Total: ' + mmMulheres.Lines.Count.ToString;
    lblTotalMulheres.Visible := True;

    mmHomens.Visible := True;
    lblHomens.Visible := True;
    lblTotalHomens.Caption := 'Total: ' + mmHomens.Lines.Count.ToString;
    lblTotalHomens.Visible := True;

    mmHistorico.Visible := True;
    lblHistorico.Visible := True;
    lblTotalHistorico.Caption := 'Total: ' + mmHistorico.Lines.Count.ToString;
    lblTotalHistorico.Visible := True;
  end;

end.
