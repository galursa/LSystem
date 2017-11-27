object Form2: TForm2
  Left = 471
  Top = 136
  AutoScroll = False
  Caption = 'Obraz'
  ClientHeight = 228
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 192
    Width = 65
    Height = 25
    Caption = 'Obr'#243't'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button2: TButton
    Left = 240
    Top = 192
    Width = 57
    Height = 25
    Caption = 'Odswiez'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 192
    Width = 49
    Height = 21
    TabOrder = 2
    Text = '0'
  end
end
