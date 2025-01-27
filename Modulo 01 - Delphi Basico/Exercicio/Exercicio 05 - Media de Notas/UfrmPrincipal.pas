unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtPrimeiraNota: TEdit;
    edtSegundaNota: TEdit;
    edtTerceiraNota: TEdit;
    edtMateria: TEdit;
    btnMedia: TButton;
    mmHistorico: TMemo;
    procedure btnMediaClick(Sender: TObject);
  private
    function CalcularMedia: String;
    procedure LimparHistorico;
    function ValidarNota: Boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.ValidarNota: Boolean;
  begin
  Result := False;
    try
      if (StrToFloat(edtPrimeiraNota.text) <= 10) and
         (StrToFloat(edtPrimeiraNota.text) >= 0) and
         (StrToFloat(edtSegundaNota.text) <= 10) and
         (StrToFloat(edtSegundaNota.text) >= 0) and
         (StrToFloat(edtTerceiraNota.text) <= 10) and
         (StrToFloat(edtTerceiraNota.text) >= 0) then Result := True
      else Result := False;
      mmHistorico.Lines.Add('Erro ao inserir as Notas!');
    except
      mmHistorico.Lines.Add('Erro ao inserir as Notas!');

    end;
  end;

procedure TfrmPrincipal.btnMediaClick(Sender: TObject);
  begin
    if ValidarNota then
      mmHistorico.Lines.Add(CalcularMedia);
  end;

function TfrmPrincipal.CalcularMedia: String;
  begin
    if edtMateria.text = 'Definar Mat�ria (Opcional)' then
      Result := Format('M�dia = %f', [((StrToFloat(edtprimeiraNota.text) +
                                        StrToFloat(edtSegundaNota.text) +
                                        StrToFloat(edtTerceiraNota.text))/3)])
    else
      Result := Format('%s - M�dia = %f', [edtMateria.text, ((StrToFloat(edtprimeiraNota.text) +
                                        StrToFloat(edtSegundaNota.text) +
                                        StrToFloat(edtTerceiraNota.text))/3)])
  end;

procedure TfrmPrincipal.LimparHistorico;
  begin

  end;



end.
