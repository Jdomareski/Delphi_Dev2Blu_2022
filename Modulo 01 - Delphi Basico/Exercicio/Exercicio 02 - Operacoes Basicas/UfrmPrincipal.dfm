﻿object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Opera'#231#245'es B'#225'sicas'
  ClientHeight = 281
  ClientWidth = 418
  Color = 11843064
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    418
    281)
  PixelsPerInch = 96
  TextHeight = 13
  object lblSaudação: TLabel
    Left = 112
    Top = 24
    Width = 196
    Height = 23
    Caption = 'Ol'#225', seja bem vindo!'
    Color = 14740149
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblTitulo: TLabel
    Left = 64
    Top = 53
    Width = 288
    Height = 23
    Caption = 'Sistema de Opera'#231#245'es B'#225'sicas'
    Color = 14740149
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblSoma: TLabel
    Left = 101
    Top = 123
    Width = 14
    Height = 23
    Caption = '+'
    Color = 14740149
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblIgual: TLabel
    Left = 217
    Top = 128
    Width = 14
    Height = 23
    Caption = '='
    Color = 14740149
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblResultado: TLabel
    Left = 280
    Top = 128
    Width = 82
    Height = 23
    Align = alCustom
    Alignment = taCenter
    Caption = 'Resultado'
    Color = 14740149
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object edtNumerador: TEdit
    Left = 48
    Top = 96
    Width = 129
    Height = 21
    Alignment = taCenter
    TabOrder = 0
    Text = 'Numerador'
  end
  object edtDenominador: TEdit
    Left = 48
    Top = 162
    Width = 129
    Height = 21
    Alignment = taCenter
    TabOrder = 1
    Text = 'Denominador'
  end
  object btnCalcular: TButton
    Left = 48
    Top = 195
    Width = 129
    Height = 25
    Caption = 'Calcular!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCalcularClick
  end
  object cobEquacao: TComboBox
    Left = 48
    Top = 127
    Width = 129
    Height = 22
    Style = csOwnerDrawFixed
    Anchors = [akTop, akBottom]
    Color = 11776979
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Items.Strings = (
      '+'
      '-'
      '*'
      '/'
      'div'
      'mod')
  end
end
