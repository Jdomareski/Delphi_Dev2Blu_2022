unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg;

type
  TFuncao = (tpFor, tpWhile, tpRepeat);
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    edtNumerador: TEdit;
    edtDenominador: TEdit;
    btnExecutar: TButton;
    rdgComandos: TRadioGroup;
    Image1: TImage;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PCompare(var Maior, Menor: int64);
    procedure PFor;
    procedure PWhile;
    procedure PRepeat;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
implementation

{$R *.dfm}

procedure TfrmPrincipal.PCompare(var Maior, Menor: int64);
  begin
    if Maior > Menor then
      begin
        Maior := StrToInt(edtNumerador.text);
        Menor := StrToInt(edtDenominador.text);
      end
    else
      begin
        Maior := StrToInt(edtDenominador.text);
        Menor := StrToInt(edtNumerador.text);
    end;
  end;

procedure TfrmPrincipal.PFor;
  var
    Soma: Int64;
    I: Int64;
    Maior: int64;
    Menor: int64;
  begin
    Maior := StrToInt64(edtNumerador.text);
    Menor := StrToInt64(edtDenominador.text);
    Self.PCompare(Maior , Menor);
    Soma := 0;
    for I := Menor to Maior do
      begin
        if I mod 2 = 0 then
          Soma := Soma + I;
      end;
    ShowMessage('A soma de todos os valores pares entre ' + Menor.ToString +
                ' e ' + Maior.ToString + ' � igual a ' + Soma.ToString)
  end;

procedure TfrmPrincipal.PWhile;
  var
    Soma: Int64;
    I: Int64;Maior: int64;
    Menor: int64;
    reducao: int64;
  begin
    Maior := StrToInt64(edtNumerador.text);
    Menor := StrToInt64(edtDenominador.text);
    Self.PCompare(Maior , Menor);
    Reducao := Maior;
    Soma := 0;
    I := 0;
    while Reducao > Menor do
      begin
        Reducao := Reducao - Menor;
        I := I + 1;
      end;
    if Maior mod Menor = 0 then
      ShowMessage('Retirando ' + Menor.ToString +
                  ' real por dia, ao final de ' + I.ToString +
                  ' dias, o caixa ficar� zerado.')
    else
      ShowMessage('Retirando ' + Menor.ToString +
                  ' real por dia, ao final de ' + (I+((Menor / Maior)-int(Menor / Maior))).ToString +
                  ' dias, o caixa ficar� zerado.');
  end;

procedure TfrmPrincipal.PRepeat;
  var
    Soma: Int64;
    I: Int64;Maior: int64;
    Menor: int64;
  begin
    Maior := StrToInt64(edtNumerador.text);
    Menor := StrToInt64(edtDenominador.text);
    Self.PCompare(Maior , Menor);
    Soma := 0;
    I := 0;
    repeat
      Soma := Soma + Menor;
      I := I + 1;
    until Soma >= Maior;

    ShowMessage('Economizando ' + Menor.ToString +
                ' reais por dia, ao final de ' + I.ToString +
                ' dias, conseguir�s o montante de ' + Maior.ToString +
                ' reais.');
  end;

{procedure Compare(var Numerador, Denominador : Int64);
  begin
    if Numerador > Denominador then
      begin
        Maior := Numerador;
        Menor := Denominador;
      end
    else
      begin
        Maior := Denominador;
        Menor := Numerador;
    end;
  end;
procedure BFor;
  var
    Soma: Int64;
    I: Int64;
  begin
    Soma := 0;
    for I := Menor to Maior do
      begin
        if I mod 2 = 0 then
          Soma := Soma + I;
      end;
    ShowMessage('A soma de todos os valores pares entre ' + Menor.ToString +
                ' e ' + Maior.ToString + ' � igual a ' + Soma.ToString)
  end;

procedure BWhile;
  var
    Soma: Int64;
    I: Int64;
  begin
    Soma := 0;
    I := 0;
    while Maior > 0 do
      begin
        Maior := Maior - Menor;
        I := I + 1;
      end;
    ShowMessage('Retirando ' + Menor.ToString +
                ' real por dia, ao final de ' + I.ToString +
                ' dias, o caixa ficar� zerado.');
  end;

procedure BRepeat;
  var
    Soma: Int64;
    I: Int64;
  begin
    Soma := 0;
    I := 0;
    repeat
      Soma := Soma + Menor;
      I := I + 1;
    until Soma >= Maior;

    ShowMessage('Economizando ' + Menor.ToString +
                ' reais por dia, ao final de ' + I.ToString +
                ' dias, conseguir�s o montante de ' + Maior.ToString +
                ' reais.');
  end;}

procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
  begin
    try
      case TFuncao (rdgComandos.ItemIndex) of
        tpFor:
          begin
            Self.PFor;
          end;

        tpWhile:
          begin
            Self.PWhile;
          end;

        tpRepeat:
          begin
            Self.PRepeat;
          end;

        else
          ShowMessage('Erro! Por favor selecione uma das op��es de itera��o.');
      end;
    except
      ShowMessage('Erro!');
    end;
  end;

end.
