unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    tsLinha01: TShape;
    tsLinha02: TShape;
    tslinha03: TShape;
    tsLinha04: TShape;
    edtDolar: TEdit;
    mmHistoricoConversor: TMemo;
    lblTituloDolar: TLabel;
    edtCotacao: TEdit;
    edtReal: TEdit;
    edtDepositado: TEdit;
    mmHistoricoRendimento: TMemo;
    lblTituloRendimento: TLabel;
    edtJurosPoupanca: TEdit;
    edtExpectativa: TEdit;
    edtQtdPrestacoes: TEdit;
    mmHistoricoPrestacoes: TMemo;
    lblPrestacoes: TLabel;
    edtValorCompra: TEdit;
    edtValorPrestacao: TEdit;
    edtPrecoCusto: TEdit;
    mmHistoricoAcrescimo: TMemo;
    lblTituloAcrescimo: TLabel;
    edtAcrecimoPercentual: TEdit;
    edtValorAposAcrecimo: TEdit;
    edtCustoFabrica: TEdit;
    mmHistoricoFinal: TMemo;
    lblTituloSomador: TLabel;
    edtPercentualDistribuidor: TEdit;
    edtPercentualImpostos: TEdit;
    Shape1: TShape;
    btnConversor: TButton;
    btnRendimento: TButton;
    btnPrestacoes: TButton;
    btnAcrecimo: TButton;
    btnValorFinal: TButton;
    procedure btnConversorClick(Sender: TObject);
    procedure btnRendimentoClick(Sender: TObject);
    procedure btnPrestacoesClick(Sender: TObject);
    procedure btnAcrecimoClick(Sender: TObject);
    procedure btnValorFinalClick(Sender: TObject);
  private
    Function TestarValor(aCurrency: Currency): Boolean overload;
    Function TestarValor(aDouble: Double): Boolean overload;
    Function TestarValor(aInteger: Integer): Boolean overload;
    Function Conversor: Currency;
    Function Rendimento: Currency;
    Function Prestacoes: Currency;
    Function Acrecimo: Currency;
    Function ValorFinal: Currency;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

function TfrmPrincipal.TestarValor(aCurrency: Currency): Boolean;
  var
    xTeste: String;
  begin
    Result := False;
    try
      xTeste := CurrToStr(aCurrency);
      Result := True;
    except
      ShowMessage('Erro com os Valores informados, tente novamente!');
    end;

  end;

function TfrmPrincipal.TestarValor(aDouble: Double): Boolean;
  var
    xTeste: String;
  begin
    Result := False;
    try
      xTeste := FloatToStr(aDouble);
      Result := True;
    except
      ShowMessage('Erro com os Valores informados, tente novamente!');
    end;
  end;

function TfrmPrincipal.TestarValor(aInteger: Integer): Boolean;
  var
    xTeste: String;
  begin
    Result := False;
    try
      xTeste := IntToStr(aInteger);
      Result := True;
    except
      ShowMessage('Erro com os Valores informados, tente novamente!');
    end;
  end;

function TfrmPrincipal.Conversor: Currency;
  var
    xDolar : Currency;
    xCotacao : Currency;
  begin
    xDolar := StrToCurr(edtDolar.Text);
    xCotacao := StrToCurr(edtCotacao.Text);
    Result := xDolar / xCotacao;
  end;

function TfrmPrincipal.Prestacoes: Currency;
  var
    xQtdPrestacoes : Integer;
    xValor : Currency;
  begin
    xQtdPrestacoes := StrToInt(edtQtdPrestacoes.Text);
    xValor := StrToCurr(edtValorCompra.Text);
    Result := (xValor / xQtdPrestacoes);
  end;

function TfrmPrincipal.Rendimento: Currency;
  var
    xValor : Currency;
    xRendimento : Currency;
  begin
    xValor := StrToCurr(edtDepositado.Text);
    xRendimento := StrToCurr(edtJurosPoupanca.Text);
    Result := (xValor * (1 + xRendimento));
  end;

function TfrmPrincipal.Acrecimo: Currency;
  var
    xValor : Currency;
    xAcrecimo : Double;
  begin
    xValor := StrToCurr(edtPrecoCusto.Text);
    xAcrecimo := StrToFloat(edtAcrecimoPercentual.Text)/100;
    Result := (xValor * (1 + xAcrecimo));
  end;

function TfrmPrincipal.ValorFinal: Currency;
  var
    xValor : Currency;
    xDistribuidor : Double;
    xImpostos : Double;
  begin
    xValor := StrToCurr(edtCustoFabrica.Text);
    xDistribuidor := StrToFloat(edtPercentualDistribuidor.Text)/100;
    xImpostos := StrToFloat(edtPercentualImpostos.Text)/100;
    Result := ((xValor * (1 + xImpostos)) * (1 + xDistribuidor));
  end;

procedure TfrmPrincipal.btnAcrecimoClick(Sender: TObject);
  var
    xCusto : Currency;
    xAumento : Double;
  begin
    //if (TestarValor(StrToCurr(edtDolar.Text))) and (TestarValor(StrToCurr(edtCotacao.Text))) then
      xCusto := StrToCurr(edtPrecoCusto.Text);
      xAumento := StrToCurr(edtAcrecimoPercentual.Text);
      edtValorAposAcrecimo.Text := CurrToStr(Acrecimo);
      //mmHistoricoConversor.Lines.Add(Format('O atual valor do dolar � R$%s, considerando trocar R$%s ir�s receber $%s', [xCotacao, xDolar, Conversor]));
  end;

procedure TfrmPrincipal.btnConversorClick(Sender: TObject);
  var
    xDolar : Currency;
    xCotacao : Currency;
  begin
    //if (TestarValor(StrToCurr(edtDolar.Text))) and (TestarValor(StrToCurr(edtCotacao.Text))) then
      xDolar := StrToCurr(edtDolar.Text);
      xCotacao := StrToCurr(edtCotacao.Text);
      edtReal.Text := CurrToStr(Conversor);
      mmHistoricoConversor.Lines.Add(Format('O valor do dolar � %m, considerando trocar %m ir�s receber %m', [xCotacao, xDolar, Conversor]));
  end;

procedure TfrmPrincipal.btnPrestacoesClick(Sender: TObject);
  var
    xPrestacoes : Integer;
    xValor : Currency;
  begin
    //if (TestarValor(StrToCurr(edtDolar.Text))) and (TestarValor(StrToCurr(edtCotacao.Text))) then
      xPrestacoes := StrToInt(edtQtdPrestacoes.Text);
      xValor := StrToCurr(edtValorCompra.Text);
      edtValorPrestacao.Text := CurrToStr(Prestacoes);
      //mmHistoricoConversor.Lines.Add(Format('O atual valor do dolar � R$%s, considerando trocar R$%s ir�s receber $%s', [xCotacao, xDolar, Conversor]));
  end;

procedure TfrmPrincipal.btnRendimentoClick(Sender: TObject);
  var
    xValor : Currency;
    xJuros : Currency;
  begin
    //if (TestarValor(StrToCurr(edtDolar.Text))) and (TestarValor(StrToCurr(edtCotacao.Text))) then
      xValor := StrToCurr(edtDepositado.Text);
      xJuros := StrToCurr(edtjurosPoupanca.Text);
      edtExpectativa.Text := CurrToStr(Rendimento);
      //mmHistoricoConversor.Lines.Add(Format('O atual valor do dolar � R$%s, considerando trocar R$%s ir�s receber $%s', [xCotacao, xDolar, Conversor]));
  end;

procedure TfrmPrincipal.btnValorFinalClick(Sender: TObject);
  var
    xValor : Currency;
    xDistribuidor : Double;
    xImpostos : Double;
  begin
    //if (TestarValor(StrToCurr(edtDolar.Text))) and (TestarValor(StrToCurr(edtCotacao.Text))) then
    xValor := StrToCurr(edtCustoFabrica.Text);
    xDistribuidor := StrToFloat(edtPercentualDistribuidor.Text)/100;
    xImpostos := StrToFloat(edtPercentualImpostos.Text)/100;
    mmHistoricoFinal.Lines.Add(CurrToStr(ValorFinal));
  end;

end.
