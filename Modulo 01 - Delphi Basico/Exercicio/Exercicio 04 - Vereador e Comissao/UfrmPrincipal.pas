unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtNome: TEdit;
    edtSalario: TEdit;
    edtVendas: TEdit;
    mmTotal: TMemo;
    procedure edtNomeChange(Sender: TObject);
    procedure edtSalarioChange(Sender: TObject);
    procedure edtVendasChange(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.edtNomeChange(Sender: TObject);
  var
    xNome: String;
  begin
    xNome := edtNome.Text;
    if mmTotal.lines.Count = 0 then
      mmTotal.lines.add(Format('Ol� %s, tudo bem?', [xNome]))
    else
      mmTotal.Lines[0] := Format('Ol� %s, tudo bem?', [xNome]);
  end;

procedure TfrmPrincipal.edtSalarioChange(Sender: TObject);
  var
    xSalario: currency;
  begin
    xSalario := StrToFloat(edtSalario.Text);
    if mmTotal.lines.Count = 1  then
      mmTotal.lines.add(Format('Vejo aqui que voc� recebe um sal�rio bruto de %m', [xSalario]))
    else if mmTotal.lines.Count = 0  then
      begin
        mmTotal.lines.Add('');
        mmTotal.lines.add(Format('Vejo aqui que voc� recebe um sal�rio bruto de %m', [xSalario]));
      end
    else
      mmTotal.Lines[1] := Format('Vejo aqui que voc� recebe um sal�rio bruto de %m', [xSalario]);
  end;

procedure TfrmPrincipal.edtVendasChange(Sender: TObject);
  var
    xComissao: currency;
    xSalario: currency;
    xTotal: currency;
  begin
    xComissao := StrToFloatDef(edtVendas.Text, 0);
    xSalario := StrToFloatDef(edtSalario.Text, 0);
    xTotal := xSalario + xComissao * 0.15;
    case mmTotal.Lines.Count of

      0:
        begin
          mmTotal.lines.Add('');
          mmTotal.lines.Add('');
          mmTotal.lines.add(Format('Pelas suas vendas totais de %m, seu sal�rio de %m vai receber um aumento, totalizando %m', [xComissao, xSalario, xTotal]));
        end;

      1:
        begin
          mmTotal.lines.Add('');
          mmTotal.lines.add(Format('Pelas suas vendas totais de %m, seu sal�rio de %m vai receber um aumento, totalizando %m', [xComissao, xSalario, xTotal]));
        end;
      else
        mmTotal.Lines[2] := Format('Pelas suas vendas totais de %m, seu sal�rio de %m vai receber um aumento, totalizando %m', [xComissao, xSalario, xTotal]);
    end;
  end;

end.
