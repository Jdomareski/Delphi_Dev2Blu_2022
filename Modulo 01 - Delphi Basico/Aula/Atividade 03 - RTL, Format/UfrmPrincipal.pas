unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMes = (opJaneiro, opFevereiro, opMarco, opAbril, opMaio, opJunho,
          opJulho, opAgosto, opSetembro, opOutubro, opNovembro, opDezembro);
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    lblValorString: TLabel;
    edtValor: TEdit;
    btnInteiro: TButton;
    btnPontoFlutuante: TButton;
    btnDataExtenso: TButton;
    bntData: TButton;
    lblResultado: TLabel;
    procedure btnInteiroClick(Sender: TObject);
    procedure btnPontoFlutuanteClick(Sender: TObject);
    procedure bntDataClick(Sender: TObject);
    procedure btnDataExtensoClick(Sender: TObject);
  private
    function IntegerBtn: String;
    function FloatBtn: String;
    function DateBtn: String;
    function ExtendedDateBtn: String;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnInteiroClick(Sender: TObject);
  begin
    self.lblResultado.Caption := IntegerBtn;
  end;

procedure TfrmPrincipal.btnPontoFlutuanteClick(Sender: TObject);
  begin
    self.lblResultado.Caption := FloatBtn;
  end;

procedure TfrmPrincipal.bntDataClick(Sender: TObject);
  begin
    self.lblResultado.Caption := DateBtn;
  end;

procedure TfrmPrincipal.btnDataExtensoClick(Sender: TObject);
  begin
    self.lblResultado.Caption := ExtendedDateBtn;
  end;

function Mes(const xDate: TDateTime): String;
  var
    xDay, xMonth, xYear: Word;
  begin
    DecodeDate(xDate, xYear, xMonth, xDay);

    case TMes(xMonth-1) of

    opJaneiro: Result := 'Janeiro';

    opFevereiro: Result := 'Fevereiro';

    OpMarco: Result := 'Mar�o';

    OpAbril: Result := 'Abril';

    OpMaio: Result := 'Maio';

    OpJunho: Result := 'Junho';

    OpJulho: Result := 'Julho';

    OpAgosto: Result := 'Agosto';

    OpSetembro: Result := 'Setembro';

    OpOutubro: Result := 'Outubro';

    OpNovembro: Result := 'Novembro';

    OpDezembro: Result := 'Dezembro';

    end;

  end;

function TfrmPrincipal.IntegerBtn: String;
  var
    xInt: integer;
  begin
    try
      begin
        xInt := StrToIntDef(self.edtValor.Text, 0);
        Result := format('%d', [xInt + 10]);
      end
    except ShowMessage('Erro');
    end;
  end;

function Tfrmprincipal.FloatBtn: string;
  var
    xFloat: Single;
  begin
    try
      begin
        xFloat := StrToFloatDef(self.edtValor.Text, 0);
        Result := format('%f', [xFloat + 10.50]);
      end
    except ShowMessage('Erro');
    end;
  end;

function Tfrmprincipal.DateBtn: string;
  var
    xDate: TDateTime;
    xDay, xMonth, xYear: Word;
  begin
    try
      begin
        if self.edtValor.Text = '' then xDate := now()
        else xDate := StrToDate(self.edtValor.Text)+2;


        DecodeDate(xDate, xYear, xMonth, xDay);
        Result := FormatDateTime('dd/mm/yy', xDate);
      end
    except ShowMessage('Erro');
    end;
  end;

function Tfrmprincipal.ExtendedDateBtn: string;
  var
    xDate: TDateTime;
    xDay, xMonth, xYear: Word;
  begin
    try
      begin
        if self.edtValor.Text = '' then xDate := now()
        else xDate := StrToDate(self.edtValor.Text);

        DecodeDate(xDate, xYear, xMonth, xDay);
        {Result := 'Hoje � dia ' + xDay.ToString + ' de ' +
                  Mes(xDate) + ' de ' +
                  xYear.ToString;}
        Result := Format('Hoje � dia %d de %s de %d',
                  [xDay, Mes(xDate), xYear]);
      end

    except ShowMessage('Erro')
    end;
  end;
end.
