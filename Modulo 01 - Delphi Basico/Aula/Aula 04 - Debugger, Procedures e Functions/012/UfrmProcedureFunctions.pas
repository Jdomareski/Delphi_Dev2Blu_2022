unit UfrmProcedureFunctions;

  interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DateUtils;

  type
    TfrmProcedureFunctions = class(TForm)
      btnProcedure: TButton;
      btnFunction: TButton;
    btnParametrosReferencia: TButton;
    btnParametrosConstantes: TButton;
    btnArrayAberto: TButton;
    btnArrayVariante: TButton;
    btnFormat: TButton;
    btnDataFormatada: TButton;
    btnSobrecarga: TButton;
    btnDefault: TButton;
    btnForward: TButton;
    procedure btnProcedureClick(Sender: TObject);
    procedure btnFunctionClick(Sender: TObject);
    procedure btnParametrosReferenciaClick(Sender: TObject);
    procedure btnParametrosConstantesClick(Sender: TObject);
    procedure btnArrayAbertoClick(Sender: TObject);
    procedure btnArrayVarianteClick(Sender: TObject);
    procedure btnFormatClick(Sender: TObject);
    procedure btnDataFormatadaClick(Sender: TObject);
    procedure btnSobrecargaClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    frmProcedureFunctions: TfrmProcedureFunctions;

  implementation

  {$R *.dfm}

  ///// PROCEDURES E FUNCTIONS /////

  // Isso � uma procedure

  procedure OlaMundo;
    begin
      ShowMessage('Ol� Mundo!');
    end;

  // Isso � uma fun��o

  function RetornarNomeSobrenome: String;
    begin
      //Result := 'Anderson Corr�a';
      RetornarNomeSobrenome := 'Anderson Corr�a';
    end;

  // Procedure por Parametros de Refer�ncia
  procedure DoubleTheValue(var Value: Integer);
    begin
      Value := Value * 2;
    end;

  // Parametros Constantes
  function DoubleTheValue2 (const Value: integer): Integer;
    begin
      //Value := Value * 2; Compiler Error
      Result := Value;
    end;

  // Parametros Default
  procedure NewMessage(aMsg: String; aCaption: String = 'Message';
                       aSeparador: String = SLineBreak);
    var
      xMensagem: String;
    begin
      xMensagem := aCaption;
      xMensagem := xMensagem + ': ';
      xMensagem := xMensagem + aMsg;
      xMensagem := xMensagem + aSeparador;

      ShowMessage(xMensagem);
    end;

  // Parametros com Array Aberto
  function Sum(const A: Array of Integer): Integer;
    var
      I: Integer;

    begin
      Result := 0;

      for I := Low (A) to High (A) do
        Result := Result + A[I];
    end;

  // Sobregarga de Fun��es
  function Min(A, B: Integer): Integer; overload;
    begin
      Result := A;
      if B > A then
        Result := B;
    end;

  function Min(A, B: Double): Double; overload;
    begin
      Result := A;
      if B > A then
        Result := B;
    end;

  function Min(A, B: Extended): Extended; overload;
    begin
      Result := A;
      if B > A then
        Result := B;
    end;

  // Declara��o Forward
  procedure Hello; forward;
  procedure DoubleHello; forward;

  procedure Hello;
    begin
      if MessageDlg('Do you want a doble message?', mtConfirmation,
                    [mbYes, mbNo], 0) = mrYes then
        DoubleHello
      else
        ShowMessage('Hello');
    end;

    procedure DoubleHello;
      begin
        Hello;
        Hello;
      end;

  procedure TfrmProcedureFunctions.btnArrayAbertoClick(Sender: TObject);
    var
      xSoma: Integer;

    begin
      xSoma := Sum([1,2,3]);

      ShowMessage(xSoma.ToString);
    end;

  procedure TfrmProcedureFunctions.btnArrayVarianteClick(Sender: TObject);
  var
    xNum1: Integer;
    xNum2: Double;

    begin
      xNum1 := 20;
      xNum2 := 1500.50;

      ShowMessage(Format('Total do caixa � de: %d', [xNum1]));

      ShowMessage(Format('Ol� %s, money: %f', ['Anderson', xNum2]));
    end;

  procedure TfrmProcedureFunctions.btnDataFormatadaClick(Sender: TObject);
    var
    myDate: TDateTime;

    begin

    // Set up out TDateTime variable with a full date and time :
    // 5th of June 2000 at 01:02:03.004 (.004 milli-seconds)
    myDate := EncodeDateTime(2022, 9, 13, 19, 36, 54, 4);

    // Date only - numeric values with no leading zeroes (except year)
    ShowMessage('              d/m/y = ' +
                FormatDateTime('d/m/y', myDate));

    // Date only - numeric values with  leading zeroes
    ShowMessage('           dd/mm/yy = ' +
                FormatDateTime('dd/mm/yy', myDate));

    // Use shot names fot the day, month, and add freeform text ('of')
    ShowMessage('  ddd d of mmm yyyy = ' +
                FormatDateTime('ddd d, mmm yyyy', myDate));

    // use long names fot the fay and month
    ShowMessage('dddd d of mmmm yyyy = ' +
                FormatDateTime('dddd d, mmmm yyyy', myDate));

    // Use the ShortDateFormat settings only
    ShowMessage('               ddddd = ' +
                FormatDateTime('ddddd', myDate));

    // Use the LongDateFormat settings only
    ShowMessage('              dddddd = ' +
                FormatDateTime('dddddd', myDate));

    // Use the ShortDateFormat + LongDateFormat settings
    ShowMessage('                   c = ' +
                FormatDateTime('c', myDate));
    end;

  procedure TfrmProcedureFunctions.btnDefaultClick(Sender: TObject);
    begin
      NewMessage('Something wrong here!');
      NewMessage('The final wave! Fight!!!', 'This is it!');
      NewMessage('where you want', 'This is', ' to be!');
    end;

  procedure TfrmProcedureFunctions.btnFormatClick(Sender: TObject);
    var
    text: String;

    begin
    // Just 1 data item
    ShowMessage(Format('%s', ['Hello']));

    // A mix of literal text and a data item
    ShowMessage(Format('String = %s', ['Hello']));

    // Examples of each oh the data types
    ShowMessage(Format('Decimal             = %d', [-123]));
    ShowMessage(Format('Exponent            = %e', [12345.678]));
    ShowMessage(Format('Fixed               = %f', [12345.678]));
    ShowMessage(Format('General             = %g', [12345.678]));
    ShowMessage(Format('Number              = %n', [12345.678]));
    ShowMessage(Format('Money               = %m', [12345.678]));
    ShowMessage(Format('Pointer             = %p', [addr(text)]));
    ShowMessage(Format('String              = %s', ['Hello']));
    ShowMessage(Format('Unsigned decimal    = %u', [123]));
    ShowMessage(Format('Hexadecimal         = %x', [140]));

    end;

  procedure TfrmProcedureFunctions.btnForwardClick(Sender: TObject);
    begin
      DoubleHello;
    end;

  procedure TfrmProcedureFunctions.btnFunctionClick(Sender: TObject);
    var
        xNomeSobreNome: String;

    begin
      xNomeSobreNome := RetornarNomeSobrenome;
      ShowMessage(xNomeSobreNome);
    end;

  procedure TfrmProcedureFunctions.btnParametrosReferenciaClick(Sender: TObject);
    var
      x: Integer;
    begin
      x := 10;
      DoubleTheValue(x);
      ShowMessage(x.ToString);
    end;

  procedure TfrmProcedureFunctions.btnProcedureClick(Sender: TObject);
    begin
      OlaMundo;
    end;

  procedure TfrmProcedureFunctions.btnSobrecargaClick(Sender: TObject);
    var
      xNum1, xNum2: Integer;
      xNum3, xNum4: Double;
      xNum5, xNum6: Extended;

    begin
      xNum1 := 1; xNum2 := 2;
      xNum3 := 3; xNum4 := 4;
      xNum5 := 5; xNum6 := 6;

      ShowMessage(Min(xNum1, xNum2).ToString);
      ShowMessage(Min(xNum3, xNum4).ToString);
      ShowMessage(Min(xNum5, xNum6).ToString);

    end;

  procedure TfrmProcedureFunctions.btnParametrosConstantesClick(Sender: TObject);
    var
      x: Integer;
    begin
      x := 10;
      DoubleTheValue2(x);
      ShowMessage(x.ToString);
    end;

end.
