object Form2: TForm2
  Left = 245
  Top = 292
  Width = 211
  Height = 256
  BorderIcons = []
  Caption = 'Form2'
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
    Left = 0
    Top = 8
    Width = 187
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1090#1072#1073#1083#1080#1094#1099
  end
  object Edit1: TEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
end
