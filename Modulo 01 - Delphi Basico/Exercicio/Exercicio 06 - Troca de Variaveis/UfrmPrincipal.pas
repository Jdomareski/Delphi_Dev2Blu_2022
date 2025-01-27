unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtVariavelA: TEdit;
    edtVariavelB: TEdit;
    lblTituloInicial: TLabel;
    lblTituloFinal: TLabel;
    lblAInicial: TLabel;
    lblBInicial: TLabel;
    lblAFinal: TLabel;
    lblBFinal: TLabel;
    btlProcessar: TButton;
    procedure btlProcessarClick(Sender: TObject);
  private
    function TestarValores: Boolean;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btlProcessarClick(Sender: TObject);
  var
    xVarA, xVarB, xVarAuxiliar : Double;
  begin
    if TestarValores then
      begin  
        xVarA := StrToFloat(edtVariavelA.Text);
        xVarB := StrToFloat(edtVariavelB.Text);

        lblTituloInicial.Visible := True;
        
        lblAinicial.Caption := Format('A = %f' ,[xVarA]);
        lblAinicial.visible := True;

        lblBinicial.Caption := Format('B = %f' ,[xVarB]);
        lblBinicial.visible := True;
        
        xVarAuxiliar := xVarA;
        xVarA := xVarB;
        xVarB := xVarAuxiliar;

        lblTituloFinal.Visible := True;
        
        lblAfinal.Caption := Format('A = %f' ,[xVarA]);;
        lblAfinal.visible := True;

        lblBfinal.Caption := Format('B = %f' ,[xVarB]);
        lblBfinal.visible := True;
        
      end;
  end;

function TfrmPrincipal.TestarValores: Boolean;
  var
  xVarA : Double;
  xVarb : Double;
  begin
    result := False;
    try
      xVarA := StrToFloat(edtVariavelA.Text);
      xVarB := StrToFloat(edtVariavelB.Text);
      Result := True;
    except
      ShowMessage('Erro na inser��o de valores!')
    end;
  end;

end.
