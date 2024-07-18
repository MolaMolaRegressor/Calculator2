object MainFm: TMainFm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' 2'
  ClientHeight = 303
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object lblOutput: TLabel
    Left = 8
    Top = 39
    Width = 11
    Height = 28
    Caption = '0'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblHistory: TLabel
    Left = 8
    Top = 16
    Width = 4
    Height = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnEqual: TButton
    Left = 178
    Top = 254
    Width = 70
    Height = 40
    Caption = '='
    TabOrder = 0
    OnClick = btnEqualClick
  end
  object btn1: TButton
    Left = 5
    Top = 82
    Width = 49
    Height = 50
    Caption = '1'
    TabOrder = 1
    OnClick = btn9Click
  end
  object btn4: TButton
    Left = 5
    Top = 138
    Width = 49
    Height = 50
    Caption = '4'
    TabOrder = 2
    OnClick = btn9Click
  end
  object btn2: TButton
    Left = 60
    Top = 82
    Width = 49
    Height = 50
    Caption = '2'
    TabOrder = 3
    OnClick = btn9Click
  end
  object btn5: TButton
    Left = 60
    Top = 138
    Width = 49
    Height = 50
    Caption = '5'
    TabOrder = 4
    OnClick = btn9Click
  end
  object btn3: TButton
    Left = 115
    Top = 82
    Width = 49
    Height = 50
    Caption = '3'
    TabOrder = 5
    OnClick = btn9Click
  end
  object btn6: TButton
    Left = 115
    Top = 138
    Width = 49
    Height = 50
    Caption = '6'
    TabOrder = 6
    OnClick = btn9Click
  end
  object btn9: TButton
    Left = 115
    Top = 194
    Width = 49
    Height = 49
    Caption = '9'
    TabOrder = 7
    OnClick = btn9Click
  end
  object btn7: TButton
    Left = 5
    Top = 194
    Width = 49
    Height = 50
    Caption = '7'
    TabOrder = 8
    OnClick = btn9Click
  end
  object btn8: TButton
    Left = 60
    Top = 194
    Width = 49
    Height = 50
    Caption = '8'
    TabOrder = 9
    OnClick = btn9Click
  end
  object btnMultiply: TButton
    Tag = 4
    Left = 214
    Top = 207
    Width = 32
    Height = 42
    Caption = '*'
    TabOrder = 10
    OnClick = ButtonActClick
  end
  object btnDivide: TButton
    Tag = 3
    Left = 178
    Top = 207
    Width = 32
    Height = 42
    Caption = '/'
    TabOrder = 11
    OnClick = ButtonActClick
  end
  object btnMinus: TButton
    Tag = 2
    Left = 216
    Top = 160
    Width = 32
    Height = 41
    Caption = '-'
    TabOrder = 12
    OnClick = ButtonActClick
  end
  object btnPlus: TButton
    Tag = 1
    Left = 178
    Top = 160
    Width = 32
    Height = 41
    Caption = '+'
    TabOrder = 13
    OnClick = ButtonActClick
  end
  object btn0: TButton
    Left = 5
    Top = 250
    Width = 159
    Height = 44
    Caption = '0'
    TabOrder = 14
    OnClick = btn9Click
  end
  object btnC: TButton
    Left = 216
    Top = 82
    Width = 32
    Height = 32
    Caption = 'C'
    TabOrder = 15
    OnClick = btnCClick
  end
  object btnCe: TButton
    Tag = 2
    Left = 178
    Top = 82
    Width = 32
    Height = 32
    Caption = 'CE'
    TabOrder = 16
  end
  object btnDot: TButton
    Left = 178
    Top = 120
    Width = 32
    Height = 34
    Caption = ','
    TabOrder = 17
    OnClick = btnDotClick
  end
  object btnBackspace: TButton
    Left = 216
    Top = 120
    Width = 32
    Height = 34
    Caption = 'BS'
    TabOrder = 18
  end
end
