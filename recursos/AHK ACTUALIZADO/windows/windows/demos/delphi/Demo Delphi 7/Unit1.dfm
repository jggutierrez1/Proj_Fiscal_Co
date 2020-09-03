object Form1: TForm1
  Left = 223
  Top = 161
  Width = 499
  Height = 398
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 197
    Top = 119
    Width = 82
    Height = 32
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 70
    Top = 203
    Width = 126
    Height = 25
    Caption = 'Abrir Puerto COM1 '
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Button1: TButton
    Left = 243
    Top = 202
    Width = 141
    Height = 25
    Caption = 'Imprimir un nombre'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 205
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Reporte X'
    TabOrder = 2
    OnClick = Button2Click
  end
end
