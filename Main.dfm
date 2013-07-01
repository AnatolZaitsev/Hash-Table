object FormHashMain: TFormHashMain
  Left = 552
  Top = 162
  Width = 658
  Height = 339
  Caption = 'Hash Table'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelKey: TLabel
    Left = 448
    Top = 24
    Width = 35
    Height = 13
    Caption = #1050#1083#1102#1095':  '
  end
  object LabelItem: TLabel
    Left = 448
    Top = 80
    Width = 57
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077':  '
  end
  object Label1: TLabel
    Left = 376
    Top = 160
    Width = 122
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1083'-'#1074#1086' '#1103#1095#1077#1077#1082':   '
  end
  object ButtonAdd: TButton
    Left = 360
    Top = 16
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = ButtonAddClick
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 16
    Width = 329
    Height = 273
    ColCount = 4
    DefaultColWidth = 80
    FixedCols = 0
    FixedRows = 0
    TabOrder = 1
  end
  object EditItem: TEdit
    Left = 448
    Top = 96
    Width = 177
    Height = 21
    ImeName = 'Russian'
    TabOrder = 2
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
  end
  object ButtonFind: TButton
    Left = 360
    Top = 96
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 3
    OnClick = ButtonFindClick
  end
  object ButtonDelete: TButton
    Left = 360
    Top = 56
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 4
    OnClick = ButtonDeleteClick
  end
  object ButtonRandomize: TButton
    Left = 376
    Top = 208
    Width = 105
    Height = 25
    Caption = #1055#1086#1076#1086#1075#1085#1072#1090#1100' '#1088#1072#1079#1084#1077#1088
    TabOrder = 5
    OnClick = ButtonRandomizeClick
  end
  object EditKey: TEdit
    Left = 448
    Top = 40
    Width = 177
    Height = 21
    ImeName = 'Russian'
    TabOrder = 6
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1082#1083#1102#1095
  end
  object EditSize: TEdit
    Left = 400
    Top = 176
    Width = 57
    Height = 21
    ImeName = 'Russian'
    TabOrder = 7
  end
end
