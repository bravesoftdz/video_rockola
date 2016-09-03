object Form4: TForm4
  Left = 295
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rockolin'
  ClientHeight = 384
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    686
    384)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 128
    Width = 353
    Height = 58
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 96
    Top = 64
    Width = 175
    Height = 23
    Caption = 'Desea Configurar?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 401
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = 'ACTUALIZANDO BASE DE DATOS...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 8
    Top = 80
    Width = 30
    Height = 13
    Caption = 'Video:'
    Visible = False
  end
  object Label5: TLabel
    Left = 120
    Top = 80
    Width = 24
    Height = 13
    Caption = 'Mp3:'
    Visible = False
  end
  object Label6: TLabel
    Left = 232
    Top = 80
    Width = 43
    Height = 13
    Caption = 'Karaoke:'
    Visible = False
  end
  object Label7: TLabel
    Left = 280
    Top = 8
    Width = 52
    Height = 19
    Anchors = [akTop, akRight, akBottom]
    Caption = 'Video:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object flb3: TFileListBox
    Left = 272
    Top = 192
    Width = 129
    Height = 137
    TabStop = False
    BevelOuter = bvNone
    ExtendedSelect = False
    ItemHeight = 16
    Mask = '*.mpg;*.wmv'
    TabOrder = 7
    Visible = False
  end
  object flb2: TFileListBox
    Left = 136
    Top = 192
    Width = 129
    Height = 137
    TabStop = False
    BevelOuter = bvNone
    ExtendedSelect = False
    ItemHeight = 16
    Mask = '*.mp3'
    TabOrder = 6
    Visible = False
  end
  object flb1: TFileListBox
    Left = 0
    Top = 192
    Width = 129
    Height = 137
    TabStop = False
    BevelOuter = bvNone
    ExtendedSelect = False
    ItemHeight = 16
    Mask = '*.mpg;*.wmv'
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 8
    Top = 336
    Width = 89
    Height = 25
    Caption = 'Cargar Sistema'
    TabOrder = 12
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 8
    Visible = False
    OnClick = Button2Click
  end
  object dbchekcortesia: TDBCheckBox
    Left = 280
    Top = 40
    Width = 97
    Height = 35
    TabStop = False
    Anchors = [akTop, akRight, akBottom]
    Caption = 'Cortesia'
    DataField = 'Cortesia'
    DataSource = dm1.dslist
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
    Visible = False
  end
  object Button3: TButton
    Left = 72
    Top = 224
    Width = 75
    Height = 25
    Caption = '&Si'
    TabOrder = 0
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 208
    Top = 224
    Width = 75
    Height = 25
    Caption = '&No'
    TabOrder = 1
    Visible = False
    OnClick = Button4Click
  end
  object DBLookupListBox1: TDBGrid
    Left = 461
    Top = 0
    Width = 225
    Height = 384
    Align = alRight
    BorderStyle = bsNone
    Color = clBlack
    Ctl3D = True
    DataSource = dm1.dslist
    FixedColor = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clAqua
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpFixed
    Font.Style = []
    Options = [dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Pitch = fpVariable
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'Name'
        Width = 209
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 171
    Width = 441
    Height = 26
    Smooth = True
    TabOrder = 5
    Visible = False
  end
  object Button5: TButton
    Left = 120
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 9
    Visible = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 232
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Actualizar'
    TabOrder = 10
    Visible = False
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 368
    Top = 8
    Width = 75
    Height = 60
    Anchors = [akTop, akRight, akBottom]
    Caption = 'Cambiar'
    TabOrder = 11
    TabStop = False
    Visible = False
    OnClick = Button7Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 8
    Top = 200
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 184
    Top = 32
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 32
    object Acercade1: TMenuItem
      Caption = 'Acerca de...'
      ShortCut = 16449
      Visible = False
      OnClick = Acercade1Click
    end
  end
end
