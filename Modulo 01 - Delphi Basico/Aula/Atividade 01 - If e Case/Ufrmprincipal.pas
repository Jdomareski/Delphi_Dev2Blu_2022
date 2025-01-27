unit Ufrmprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    lblIfCase: TLabel;
    btnIf: TButton;
    btnCase: TButton;
    edtText: TEdit;
    rdgNivel: TRadioGroup;
    procedure btnCaseClick(Sender: TObject);
    procedure btnIfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function xNomeTeste(texto: String): Boolean;

  begin
    if trim(texto) = 'Anderson' then
      begin
        Result := True;
      end
    else if trim(texto) = '' then
      begin
        ShowMessage('Erro! Por favor, preencha o campo do Nome.');
        Result := False
      end
    else
      begin
        ShowMessage('Desculpe, ' + trim(texto) + ' est� ausente.');
        Result := False
      end;
  end;

procedure TfrmPrincipal.btnCaseClick(Sender: TObject);
  begin
    if xNomeTeste(edtText.Text) then
      begin
        case rdgNivel.ItemIndex of

        0:
          begin
            ShowMessage('Eu, ' + trim(edtText.Text) + ' sou do n�vel estagi�rio.')
          end;

        1:
          begin
            ShowMessage('Eu, ' + trim(edtText.Text) + ' sou do n�vel J�nior.')
          end;

        2:
          begin
            ShowMessage('Eu, ' + trim(edtText.Text) + ' sou do n�vel Pleno.')
          end;

        3:
          begin
            ShowMessage('Eu, ' + trim(edtText.Text) + ' sou do n�vel S�nior.')
          end;

        else
          ShowMessage('Por favor, selecione um N�vel')

        end;
      end;

      if xNomeTeste(edtText.Text) and (rdgNivel.ItemIndex <> -1) then
        begin
          ShowMessage('Eu, ' + trim(edtText.Text) + ' sou do n�vel ' + rdgNivel.Items[rdgNivel.ItemIndex]);
        end
      else
        begin
          ShowMessage('Por favor, selecione um N�vel')
        end;
  end;

procedure TfrmPrincipal.btnIfClick(Sender: TObject);
  begin
    if xNomeTeste(edtText.Text) then
      begin
        ShowMessage('Sou eu. Presente!')
      end
  end;

end.
