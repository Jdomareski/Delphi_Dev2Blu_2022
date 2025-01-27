unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  OpResultado = (OpLucro, opPreju, opEmpate);
  TfrmPrincipal = class(TForm)
    btnCadastrar: TButton;
    mmPreju: TMemo;
    mmEmpate: TMemo;
    lblPreju: TLabel;
    lblEmpate: TLabel;
    mmLucro: TMemo;
    lblLucro: TLabel;
    lblTotalLucro: TLabel;
    lblTotalpreju: TLabel;
    lblTotalEmpate: TLabel;
    lblMedioCusto: TLabel;
    lblValorMedioCusto: TLabel;
    lblValorMedioVenda: TLabel;
    lblMedioVenda: TLabel;
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
    xCusto: Currency;
    xVenda: Currency;
    xFinal: Currency;
    xMedioVenda: Currency;
    xMedioCusto: Currency;
    xLucro : Currency;
    xPreju : Currency;

  begin
    if TryStrToInt(inputbox('Informar', 'Informar quantidade de produtos', '0'), xVezes) then
      begin
        xMedioVenda := 0;
        xMedioCusto := 0;
        xLucro := 0;
        xPreju := 0;
        if xVezes > 0 then
          for I := 1 to xVezes do
            begin
              repeat
               xCusto := StrToFloatDef(inputbox('Informar', Format('Informe o valor de custo do %d� produto: ',[(I)]), '0'), 0);
              until xCusto > 0;

              repeat
                xVenda := StrToFloatDef(inputbox('Informar', Format('Informe o valor de venda do %d� produto: ',[(I)]), '0'), 0);
              until xVenda > 0;

              xFinal := xVenda - xCusto;
              xMedioVenda := xMedioVenda + xVenda;
              xMedioCusto := xMedioCusto + xCusto;
              if xFinal > 0 then
                begin
                  mmLucro.Lines.add(Format('%d� pdt - R$%n / R$%n',
                  [I, xVenda, xCusto]));
                  xLucro := xLucro + xFinal;
                end
              else if xFinal < 0 then
                begin
                  mmPreju.Lines.add(Format('%d� pdt - R$%n / R$%n',
                  [I, xVenda, xCusto]));
                  xPreju := xPreju + xFinal;
                end
              else
                begin
                  mmEmpate.Lines.add(Format('%d� pdt - R$%n / R$%n',
                  [I, xVenda, xCusto]));
                end;

            end;
      end
    else
      raise Exception.Create('Informe apenas valores inteiros!');

    xMedioVenda := xMedioVenda / xVezes;
    xMedioCusto := xMedioCusto / xVezes;

    mmLucro.Visible := True;
    lblLucro.Visible := True;
    lblTotalLucro.Caption := 'Total: ' + CurrToStr(xLucro);
    lblTotalLucro.Visible := True;

    mmPreju.Visible := True;
    lblPreju.Visible := True;
    lblTotalPreju.Caption := 'Total: ' + CurrToStr(xPreju);
    lblTotalPreju.Visible := True;

    mmEmpate.Visible := True;
    lblEmpate.Visible := True;
    lblTotalEmpate.Caption := 'Total: ' + mmEmpate.Lines.Count.ToString;
    lblTotalEmpate.Visible := True;

    lblMedioCusto.Visible := True;
    lblValorMedioCusto.Caption := 'R$ ' + CurrToStr(xMedioCusto);
    lblValorMedioCusto.Visible := True;

    lblMedioVenda.Visible := True;
    lblValorMedioVenda.Caption := 'R$ ' + CurrToStr(xMedioVenda);
    lblValorMedioVenda.Visible := True;

  end;

end.
