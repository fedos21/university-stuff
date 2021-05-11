object MainForm: TMainForm
  Left = 387
  Top = 229
  HelpContext = 50
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = #1060#1091#1088#1100#1077'-'#1072#1085#1072#1083#1080#1079' '#1080' '#1089#1080#1085#1090#1077#1079
  ClientHeight = 228
  ClientWidth = 792
  Color = clSkyBlue
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000010101000000000002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000007777777777777777777777777770000F88
    88888888888888888888888887000F88FFFFFFFFFFFFFFFFFFFFFFF887000F87
    00000000000000000000000F87000F8700200200200200200200200F87000F87
    02222222222222222222220F87000F8700200200200200200200200F87000F87
    00200200200200200200200F87000F8702222222222222222222220F87000F87
    0FFF020020020FFF0200200F87000F870020F2002002F020F200200F87000F87
    02222F22222F22222F22220F87000F8700200F00200F00200F00200F87000F87
    002002F020F2002002F0200F87000F870222222FFF222222222FFF0F87000F87
    00200200200200200200200F87000F8700200200200200200200200F87000F87
    02222222222222222222220F87000F8700200200200200200200200F87000F87
    00200200200200200200200F87000F8700000000000000000000000F87000F88
    77777777777777777777777887000F88888888888888888888888888870000FF
    FFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFC00000078000
    0003000000010000000100000001000000010000000100000001000000010000
    0001000000010000000100000001000000010000000100000001000000010000
    000100000001000000010000000100000001000000010000000180000003C000
    0007FFFFFFFFFFFFFFFFFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    00000000000000888888888888000F000000000000800F020020020020800F02
    2222222220800F0F00200FFF20800F02F020F200F0800F02F222F22220800F02
    0FFF020020800F020020020020800F022222222220800F000000000000800FFF
    FFFFFFFFFF0000000000000000000000000000000000FFFF0000800100000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000080010000FFFF0000}
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 544
    Top = 28
    Width = 162
    Height = 16
    Caption = #1056#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 36
    Width = 120
    Height = 13
    Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1072#1103' '#1095#1072#1089#1090#1086#1090#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Newsign: TGroupBox
    Left = 0
    Top = 28
    Width = 369
    Height = 197
    Caption = #1057#1080#1075#1085#1072#1083' ('#1094#1077#1087#1100')'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 5
    object Label2: TLabel
      Left = 128
      Top = 9
      Width = 70
      Height = 15
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 128
      Top = 26
      Width = 95
      Height = 15
      Caption = #1056#1072#1079#1084#1077#1088' '#1084#1072#1089#1089#1080#1074#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 128
      Top = 38
      Width = 45
      Height = 15
      Caption = #1076#1072#1085#1085#1099#1093':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object LPFPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      UseDockManager = False
      TabOrder = 15
      object Label16: TLabel
        Left = 8
        Top = 8
        Width = 122
        Height = 15
        Caption = #1063#1072#1089#1090#1086#1090#1072' '#1089#1088#1077#1079#1072' (0..0.5)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 8
        Top = 56
        Width = 114
        Height = 15
        Caption = #1053#1072#1082#1083#1086#1085' '#1060#1063#1061', '#1088#1072#1076'/'#1043#1094
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label19: TLabel
        Left = 8
        Top = 32
        Width = 109
        Height = 15
        Caption = #1063#1080#1089#1083#1086' '#1086#1090#1089#1095#1077#1090#1086#1074' '#1048#1061':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eLPFcf: TEdit
        Left = 152
        Top = 8
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
      object eLPFpn: TEdit
        Left = 152
        Top = 56
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnKeyPress = eTreugWidthKeyPress
      end
      object eLengthLPF: TEdit
        Left = 152
        Top = 32
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = eTreugWidthKeyPress
      end
    end
    object SinusPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      TabOrder = 10
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 134
        Height = 15
        Caption = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1072#1103' '#1095#1072#1089#1090#1086#1090#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 32
        Width = 61
        Height = 15
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 56
        Width = 130
        Height = 15
        Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1092#1072#1079#1072', '#1075#1088#1072#1076'.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eSinusF: TEdit
        Left = 152
        Top = 8
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
      object eSinusAmpl: TEdit
        Left = 152
        Top = 32
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = eTreugWidthKeyPress
      end
      object eSinusPhase: TEdit
        Left = 152
        Top = 56
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = eTreugWidthKeyPress
      end
    end
    object KolocolPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      UseDockManager = False
      TabOrder = 12
      object Label8: TLabel
        Left = 8
        Top = 8
        Width = 25
        Height = 15
        Caption = #1057#1050#1054
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 32
        Width = 61
        Height = 15
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 8
        Top = 56
        Width = 138
        Height = 15
        Caption = #1063#1080#1089#1083#1086' '#1086#1090#1089#1095#1077#1090#1086#1074' '#1089#1080#1075#1085#1072#1083#1072':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eKolocolSKO: TEdit
        Left = 152
        Top = 8
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
      object eKolocolAmpl: TEdit
        Left = 152
        Top = 32
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = eTreugWidthKeyPress
      end
      object eKolocolWidth: TEdit
        Left = 152
        Top = 56
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = eTreugWidthKeyPress
      end
    end
    object EmptyPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      TabOrder = 16
      object Label18: TLabel
        Left = 8
        Top = 8
        Width = 109
        Height = 15
        Caption = #1063#1080#1089#1083#1086' '#1086#1090#1089#1095#1077#1090#1086#1074' '#1048#1061':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eLengthPR: TEdit
        Left = 152
        Top = 8
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
    end
    object ImportPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      TabOrder = 17
      object Label14: TLabel
        Left = 8
        Top = 8
        Width = 68
        Height = 15
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eImportFname: TEdit
        Left = 3
        Top = 24
        Width = 227
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
      object Button2: TButton
        Left = 80
        Top = 56
        Width = 75
        Height = 25
        Caption = #1054#1073#1079#1086#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object PryamougPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      TabOrder = 13
      object Label10: TLabel
        Left = 8
        Top = 8
        Width = 138
        Height = 15
        Caption = #1063#1080#1089#1083#1086' '#1086#1090#1089#1095#1077#1090#1086#1074' '#1089#1080#1075#1085#1072#1083#1072':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 8
        Top = 32
        Width = 61
        Height = 15
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object ePryamougWidth: TEdit
        Left = 152
        Top = 8
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
      object ePryamougAmpl: TEdit
        Left = 152
        Top = 32
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = eTreugWidthKeyPress
      end
    end
    object TreugPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      UseDockManager = False
      TabOrder = 14
      object Label12: TLabel
        Left = 8
        Top = 8
        Width = 138
        Height = 15
        Caption = #1063#1080#1089#1083#1086' '#1086#1090#1089#1095#1077#1090#1086#1074' '#1089#1080#1075#1085#1072#1083#1072':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 32
        Width = 61
        Height = 15
        Caption = #1040#1084#1087#1083#1080#1090#1091#1076#1072
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eTreugWidth: TEdit
        Left = 152
        Top = 8
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eTreugWidthKeyPress
      end
      object eTreugAmpl: TEdit
        Left = 152
        Top = 32
        Width = 73
        Height = 23
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = eTreugWidthKeyPress
      end
    end
    object rbSinus: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = #1057#1080#1085#1091#1089
      Checked = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = rbSinusClick
    end
    object rbKolocol: TRadioButton
      Left = 8
      Top = 32
      Width = 113
      Height = 17
      Caption = #1050#1086#1083#1086#1082#1086#1083
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = rbKolocolClick
    end
    object rbPryamoug: TRadioButton
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      Caption = #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = rbPryamougClick
    end
    object rbTreug: TRadioButton
      Left = 8
      Top = 64
      Width = 113
      Height = 17
      Caption = #1058#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = rbTreugClick
    end
    object rbLPF: TRadioButton
      Left = 8
      Top = 80
      Width = 113
      Height = 17
      Caption = #1060#1053#1063
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = rbLPFClick
    end
    object rbDiff: TRadioButton
      Left = 8
      Top = 96
      Width = 113
      Height = 17
      Caption = #1044#1080#1092#1092#1077#1088#1077#1085#1094#1080#1072#1090#1086#1088
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = rbDiffClick
    end
    object rbExport: TRadioButton
      Left = 8
      Top = 144
      Width = 113
      Height = 17
      Caption = #1069#1082#1089#1087#1086#1088#1090
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = rbExportClick
    end
    object rbHilbert: TRadioButton
      Left = 8
      Top = 112
      Width = 113
      Height = 17
      Caption = #1055#1088'. '#1043#1080#1083#1100#1073#1077#1088#1090#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = rbHilbertClick
    end
    object News: TButton
      Left = 8
      Top = 168
      Width = 353
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100'!'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = NewsClick
    end
    object DlinPreobr: TComboBox
      Left = 280
      Top = 27
      Width = 81
      Height = 23
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 15
      ParentFont = False
      TabOrder = 0
      Text = '256'
      OnChange = DlinPreobrChange
      Items.Strings = (
        '8'
        '16'
        '32'
        '64'
        '128'
        '256'
        '512'
        '1024'
        '2048'
        '4096'
        '8192')
    end
    object rbImport: TRadioButton
      Left = 8
      Top = 128
      Width = 113
      Height = 17
      Caption = #1048#1084#1087#1086#1088#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = rbImportClick
    end
    object cbSimm: TCheckBox
      Left = 128
      Top = 146
      Width = 185
      Height = 17
      Hint = '... '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' '#1085#1091#1083#1103' '#1086#1089#1080' X'
      Caption = #1057#1080#1084#1084#1077#1090#1088#1080#1095#1085#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
    end
    object ExportPar: TPanel
      Left = 128
      Top = 56
      Width = 233
      Height = 89
      Color = clSkyBlue
      TabOrder = 19
      object Label21: TLabel
        Left = 8
        Top = 8
        Width = 70
        Height = 16
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object eExportFname: TEdit
        Left = 3
        Top = 24
        Width = 227
        Height = 24
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = eExportFnameKeyPress
      end
      object Button1: TButton
        Left = 80
        Top = 56
        Width = 75
        Height = 25
        Caption = #1054#1073#1079#1086#1088
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object Preobr: TGroupBox
    Left = 376
    Top = 28
    Width = 161
    Height = 197
    Caption = #1054#1087#1077#1088#1072#1094#1080#1080':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 6
    TabStop = True
    object ButBPF: TButton
      Left = 8
      Top = 24
      Width = 70
      Height = 25
      Hint = #1041#1099#1089#1090#1088#1086#1077' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077' '#1060#1091#1088#1100#1077
      Caption = #1041#1055#1060
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ButBPFClick
    end
    object ButOBPF: TButton
      Left = 80
      Top = 24
      Width = 70
      Height = 25
      Hint = #1054#1073#1088#1072#1090#1085#1086#1077' '#1073#1099#1089#1090#1088#1086#1077' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077' '#1060#1091#1088#1100#1077
      Caption = #1054#1041#1055#1060
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButOBPFClick
    end
    object ButSwertka: TButton
      Left = 80
      Top = 108
      Width = 70
      Height = 25
      Caption = #1057#1074#1077#1088#1090#1082#1072
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = ButSwertkaClick
    end
    object ButKorrelazia: TButton
      Left = 8
      Top = 108
      Width = 70
      Height = 25
      Caption = #1050#1086#1088#1088#1077#1083#1103#1094#1080#1103
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = ButKorrelaziaClick
    end
    object ButSlozh: TButton
      Left = 80
      Top = 52
      Width = 33
      Height = 25
      Caption = '+'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ButSlozhClick
    end
    object ButUmnozh: TButton
      Left = 8
      Top = 52
      Width = 70
      Height = 25
      Caption = #1059#1084#1085#1086#1078#1077#1085#1080#1077
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ButUmnozhClick
    end
    object ButZerk: TButton
      Left = 80
      Top = 80
      Width = 70
      Height = 25
      Caption = #1047#1077#1088#1082#1072#1083#1086
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = ButZerkClick
    end
    object ButSin: TButton
      Left = 8
      Top = 136
      Width = 70
      Height = 25
      Hint = #1050#1086#1084#1087#1083#1077#1082#1089#1085#1086#1077' '#1089#1086#1087#1088#1103#1078#1077#1085#1080#1077
      Caption = 'Sin'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = ButSinClick
    end
    object ButSdvig: TButton
      Left = 8
      Top = 80
      Width = 70
      Height = 25
      Caption = #1057#1076#1074#1080#1075
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = ButSdvigClick
    end
    object butCos: TButton
      Left = 80
      Top = 136
      Width = 70
      Height = 25
      Caption = 'Cos'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = mExportClick
    end
    object butDelSelected: TButton
      Left = 8
      Top = 168
      Width = 145
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077'!'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = butDelSelectedClick
    end
    object ButVych: TButton
      Left = 116
      Top = 52
      Width = 33
      Height = 25
      Caption = '-'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 4
      OnClick = ButVychClick
    end
  end
  object btnToLeft: TButton
    Left = 548
    Top = 197
    Width = 45
    Height = 25
    Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081
    Caption = '<--'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnToLeftClick
  end
  object btnToRight: TButton
    Left = 744
    Top = 197
    Width = 41
    Height = 25
    Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1081'!'
    Caption = '-->'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnToRightClick
  end
  object SignListBox: TCheckListBox
    Left = 544
    Top = 44
    Width = 241
    Height = 153
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 15
    ParentFont = False
    TabOrder = 0
    OnClick = SignListBoxClick
    OnKeyDown = SignListBoxKeyDown
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 30
    ButtonHeight = 23
    Caption = 'ToolBar1'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 4
    object sbClearFRK: TSpeedButton
      Left = 0
      Top = 2
      Width = 23
      Height = 23
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1088#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00080808080808
        0808080808080808080808080000000000000000000000080808080800FFFFFF
        FFFFFFFFFFFF00080808080800FFFFFFFFFFFFFFFFFF00080808080800FFFFFF
        FFFFFFFFFFFF00080808080800FFFFFFFFFFFFFFFFFF00080808080800FFFFFF
        FFFFFFFFFFFF00080808080800FFFFFFFFFFFFFFFFFF00080808080800FFFFFF
        FFFFFFFFFFFF00080808080800FFFFFFFFFFFFFFFFFF00080808080800FFFFFF
        FFFFFF00000000080808080800FFFFFFFFFFFF00FF0008080808080800FFFFFF
        FFFFFF0000080808080808080000000000000000080808080808080808080808
        0808080808080808080808080808080808080808080808080808}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = mClearFRKClick
    end
    object sbOpenFRK: TSpeedButton
      Left = 23
      Top = 2
      Width = 23
      Height = 23
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
        000000000000000000000000000000000000000000000000000000000000C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC000000000000000808000808000808000808000
        8080008080008080008080008080000000C0DCC0C0DCC0C0DCC0C0DCC0000000
        00FFFF0000000080800080800080800080800080800080800080800080800080
        80000000C0DCC0C0DCC0C0DCC0000000FFFFFF00FFFF00000000808000808000
        8080008080008080008080008080008080008080000000C0DCC0C0DCC0000000
        00FFFFFFFFFF00FFFF0000000080800080800080800080800080800080800080
        80008080008080000000C0DCC0000000FFFFFF00FFFFFFFFFF00FFFF00000000
        0000000000000000000000000000000000000000000000000000C0DCC0000000
        00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00
        FFFFFFFFFF00FFFFFFFFFF000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
        00FFFFFFFFFF00FFFF000000000000000000000000000000000000000000C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000000000000000C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000000000000000C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0000000000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0000000C0DCC0C0DCC0C0DCC0000000C0DCC0000000C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC00000000000000000
        00C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = mOpenFRKClick
    end
    object sbSaveFRK: TSpeedButton
      Left = 46
      Top = 2
      Width = 23
      Height = 23
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00080808080808
        0808080808080808080808080000000000000000000000000008080003030000
        0000000007070003000808000303000000000000070700030008080003030000
        0000000007070003000808000303000000000000000000030008080003030303
        0303030303030303000808000303000000000000000003030008080003000707
        0707070707070003000808000300070707070707070700030008080003000707
        0707070707070003000808000300070707070707070700030008080003000707
        0707070707070000000808000300070707070707070700070008080000000000
        0000000000000000000808080808080808080808080808080808}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = mSaveFRKClick
    end
    object sbExport: TSpeedButton
      Left = 69
      Top = 2
      Width = 23
      Height = 23
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' '#1090#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        F000F0000000000FF000F0FFFFFFFF0FF000F0FFFFFFFF0FFA5FF0FF4444FF0F
        F000F0FFFFFFFF0FF000F0FF4444FF0FF000F0FFFFFFFF0FF000F0FF444F000F
        F000F0FFFFFF080FF000F0FFFFFF00FFF000F00000000FFFF000FFFFFFFFFFFF
        F000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = mExportClick
    end
    object sbImport: TSpeedButton
      Left = 92
      Top = 2
      Width = 23
      Height = 23
      Hint = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1090#1077#1082#1089#1090#1086#1074#1086#1075#1086' '#1092#1072#1081#1083#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = mImportClick
    end
  end
  object btDelCurr: TBitBtn
    Left = 592
    Top = 197
    Width = 153
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081'!'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object MainMenu1: TMainMenu
    Left = 228
    Top = 4
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object mSaveFRK: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086'...'
        Enabled = False
        ShortCut = 16467
        OnClick = mSaveFRKClick
      end
      object mOpenFRK: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086'...'
        ShortCut = 16463
        OnClick = mOpenFRKClick
      end
      object mClearFRK: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1088#1072#1073#1086#1095#1077#1077' '#1087#1088#1086#1089#1090#1088#1072#1085#1089#1090#1074#1086'...'
        ShortCut = 16462
        OnClick = mClearFRKClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mExport: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1080#1075#1085#1072#1083#1072'...'
        Enabled = False
        ShortCut = 16453
        OnClick = mExportClick
      end
      object mImport: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090'...'
        ShortCut = 16457
        OnClick = mImportClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mQuit: TMenuItem
        Caption = #1042'&'#1099#1093#1086#1076
        OnClick = mQuitClick
      end
    end
    object Help2: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      object Contents1: TMenuItem
        Caption = '&'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077'...'
        OnClick = Contents1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
        OnClick = AboutClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt|MAT-'#1092#1072#1081#1083#1099' Matlab (*.mat)|*.mat'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 256
    Top = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 4
  end
end
