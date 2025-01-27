unit UfrmPrincipal;

  interface

  uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

  type
    TAnimal = (tpCachorro, tpPassaro, tpGato, tpPeixe);

  type
    TForm1 = class(TForm)
    lbAnimal: TLabel;
    mmHistorico: TMemo;
    btProcessar: TButton;
    cmbAnimal: TComboBox;
    btLimpar: TButton;
    procedure btProcessarClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    private
      { Private declarations }
      procedure QueAnimalSouEu;
    public
      { Public declarations }
    end;

  var
    Form1: TForm1;

  implementation

  {$R *.dfm}

  procedure TForm1.btProcessarClick(Sender: TObject);
  begin
    {case cmbAnimal.ItemIndex of
    0: // Cachorro
      begin
        //mmHistorico.Lines.Clear;
        mmHistorico.Lines.Add('Sou um cachorro e tenho 4 patas.')
      end;

    1: // P�ssaro
      begin
        //mmHistorico.Lines.Clear;
        mmHistorico.Lines.Add('Sou um p�ssaro e tenho 2 patas.')
      end;

    2: // Gato
      begin
        //mmHistorico.Lines.Clear;
        mmHistorico.Lines.Add('Sou um gato e tenho 4 patas.')
      end;

    3: // Peixe
      begin
        //mmHistorico.Lines.Clear;
        mmHistorico.Lines.Add('Sou um peixe e possuo nadadeiras')
      end;

    else
      begin
        //mmHistorico.Lines.Clear;
        mmHistorico.Lines.Add('N�o foi definido nenhum animal.')
      end;
    end;
  end;
  procedure TForm1.Button1Click(Sender: TObject);
    begin
      mmHistorico.Lines.Clear
    end;}

    QueAnimalSouEu;
  end;

  procedure TForm1.btLimparClick(Sender: TObject);
    begin
      mmHistorico.Lines.Clear;
    end;

  procedure TForm1.QueAnimalSouEu;
    var
    xFrase: String;

    begin
      case TAnimal (cmbAnimal.ItemIndex) of

        tpCachorro: // Cachorro
        begin
          xFrase := 'Sou um cachorro e tenho 4 patas.';
        end;

        tpPassaro: // P�ssaro
        begin
          xFrase := 'Sou um p�ssaro e tenho 2 patas.';
        end;

        tpGato: // Gato
        begin
          xFrase := 'Sou um Gato e tenho 2 patas.';
        end;

        tpPeixe: // Peixe
        begin
          xFrase := 'Sou um peixe e tenho nadadeiras.';
        end;

        else // Sem Defini��o
        begin
          xFrase := 'N�o foi definido nenhum animal.';
        end;
      end;

      mmHistorico.Lines.Add(xFrase);
    end;

end.
