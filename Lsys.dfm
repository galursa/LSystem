object Form1: TForm1
  Left = 276
  Top = 90
  Width = 409
  Height = 495
  Caption = 'Lsystem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 240
    Top = 72
    Width = 77
    Height = 13
    Caption = 'Wielkosc kroku:'
  end
  object Label2: TLabel
    Left = 32
    Top = 280
    Width = 48
    Height = 13
    Caption = 'Produkcje'
  end
  object Label3: TLabel
    Left = 32
    Top = 144
    Width = 46
    Height = 13
    Caption = 'Aksjomat:'
  end
  object Label4: TLabel
    Left = 32
    Top = 184
    Width = 41
    Height = 13
    Caption = 'Regu'#322'y: '
  end
  object Label5: TLabel
    Left = 32
    Top = 96
    Width = 26
    Height = 13
    Caption = 'Obr'#243't'
  end
  object NrPrzepis: TLabel
    Left = 176
    Top = 384
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label6: TLabel
    Left = 88
    Top = 384
    Width = 70
    Height = 13
    Caption = 'Nr przepisania:'
  end
  object Label7: TLabel
    Left = 32
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Czynnik'
  end
  object Label8: TLabel
    Left = 120
    Top = 64
    Width = 5
    Height = 13
    Caption = '/'
  end
  object Label9: TLabel
    Left = 232
    Top = 160
    Width = 99
    Height = 13
    Caption = 'Symbole dodatkowe:'
  end
  object Label10: TLabel
    Left = 232
    Top = 176
    Width = 7
    Height = 13
    Caption = 'X'
  end
  object Label11: TLabel
    Left = 232
    Top = 200
    Width = 7
    Height = 13
    Caption = 'Y'
  end
  object Label12: TLabel
    Left = 232
    Top = 224
    Width = 8
    Height = 13
    Caption = 'G'
  end
  object Label13: TLabel
    Left = 232
    Top = 248
    Width = 8
    Height = 13
    Caption = 'H'
  end
  object Button3: TButton
    Left = 288
    Top = 328
    Width = 89
    Height = 33
    Caption = 'Przepisanie'
    TabOrder = 0
    OnClick = Button3Click
  end
  object prod: TRichEdit
    Left = 88
    Top = 280
    Width = 193
    Height = 89
    Lines.Strings = (
      ''
      ''
      ''
      ''
      '')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 88
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 88
    Top = 144
    Width = 129
    Height = 21
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 88
    Top = 176
    Width = 129
    Height = 89
    TabOrder = 4
  end
  object Button4: TButton
    Left = 288
    Top = 368
    Width = 89
    Height = 33
    Caption = 'Pokaz obraz'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 288
    Top = 280
    Width = 89
    Height = 41
    Caption = 'Czysc produkcje'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Edit3: TEdit
    Left = 88
    Top = 64
    Width = 25
    Height = 21
    TabOrder = 7
    Text = '1'
  end
  object Edit4: TEdit
    Left = 128
    Top = 64
    Width = 25
    Height = 21
    TabOrder = 8
    Text = '2'
  end
  object Edit5: TEdit
    Left = 256
    Top = 176
    Width = 97
    Height = 21
    TabOrder = 9
  end
  object Edit6: TEdit
    Left = 256
    Top = 200
    Width = 97
    Height = 21
    TabOrder = 10
  end
  object Edit7: TEdit
    Left = 256
    Top = 224
    Width = 97
    Height = 21
    TabOrder = 11
  end
  object Edit8: TEdit
    Left = 256
    Top = 248
    Width = 97
    Height = 21
    TabOrder = 12
  end
  object Edit9: TEdit
    Left = 240
    Top = 96
    Width = 65
    Height = 21
    TabOrder = 13
    Text = '100'
  end
  object MainMenu1: TMainMenu
    Left = 368
    object Plik1: TMenuItem
      Caption = 'Plik'
      object Nowy1: TMenuItem
        Caption = 'Nowy'
        OnClick = Nowy1Click
      end
      object Otworz1: TMenuItem
        Caption = 'Otworz'
        OnClick = Otworz1Click
      end
      object Zapisz1: TMenuItem
        Caption = 'Zapisz'
        OnClick = Zapisz1Click
      end
    end
    object Edycja1: TMenuItem
      Caption = 'Edycja'
      object Kopiuj1: TMenuItem
        Caption = 'Wytnij'
      end
      object Wklej1: TMenuItem
        Caption = 'Kopiuj'
      end
      object Wklej2: TMenuItem
        Caption = 'Wklej'
      end
    end
    object Pomoc1: TMenuItem
      Caption = 'Pomoc'
      object Oprogramie1: TMenuItem
        Caption = 'O programie'
        OnClick = Oprogramie1Click
      end
      object Pomoc2: TMenuItem
        Caption = 'Pomoc'
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.ls|*.ls'
    Left = 368
    Top = 32
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'ls'
    Filter = '*.ls|*.ls'
    Left = 368
    Top = 64
  end
end
