object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #24494#20449#23398#20064
  ClientHeight = 462
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel4: TPanel
    Left = 1
    Top = 0
    Width = 1072
    Height = 462
    TabOrder = 1
    object Image2: TImage
      Left = 399
      Top = 82
      Width = 257
      Height = 247
      Stretch = True
    end
    object Button3: TButton
      Left = 471
      Top = 24
      Width = 98
      Height = 33
      Caption = #25195#25551#30331#24405
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 400
    Top = 0
    Width = 676
    Height = 462
    Align = alRight
    Caption = 'Panel2'
    TabOrder = 0
    object CheckListBox1: TCheckListBox
      Left = 1
      Top = 42
      Width = 674
      Height = 419
      Align = alClient
      TabOrder = 0
      OnDblClick = CheckListBox1DblClick
      ExplicitLeft = 80
      ExplicitTop = 184
      ExplicitWidth = 121
      ExplicitHeight = 97
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 674
      Height = 41
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 1
      ExplicitLeft = 6
      ExplicitTop = -5
      object CheckBox1: TCheckBox
        Left = 5
        Top = 18
        Width = 97
        Height = 17
        Caption = #28040#24687#20813#25171#25200
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object Edit1: TEdit
        Left = 160
        Top = 11
        Width = 425
        Height = 24
        TabOrder = 1
        Text = #27599#22825#19979#21320'3'#28857#25552#20132#24037#20316#25253#21578
      end
      object Button2: TButton
        Left = 591
        Top = 10
        Width = 75
        Height = 25
        Caption = #21457#36865
        TabOrder = 2
        OnClick = Button2Click
      end
      object CheckBox3: TCheckBox
        Left = 104
        Top = 18
        Width = 57
        Height = 17
        Caption = #20840#36873
        TabOrder = 3
        OnClick = CheckBox3Click
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 462
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 385
    object Image1: TImage
      Left = 35
      Top = 6
      Width = 105
      Height = 130
      Stretch = True
    end
    object Label1: TLabel
      Left = 184
      Top = 64
      Width = 28
      Height = 16
      Caption = 'Wxid'
    end
    object Label2: TLabel
      Left = 187
      Top = 104
      Width = 30
      Height = 16
      Caption = #26165#31216
    end
    object Label3: TLabel
      Left = 224
      Top = 64
      Width = 37
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 224
      Top = 104
      Width = 37
      Height = 16
      Caption = 'Label3'
    end
    object LabeledEdit1: TLabeledEdit
      Left = 6
      Top = 385
      Width = 171
      Height = 24
      EditLabel.Width = 60
      EditLabel.Height = 16
      EditLabel.Caption = #20462#25913#26165#31216
      TabOrder = 0
      Text = #26165#31216
    end
    object Button1: TButton
      Left = 101
      Top = 411
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 1
      OnClick = Button1Click
    end
    object TimePicker1: TTimePicker
      Left = 245
      Top = 411
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
      Time = 44412.762917349540000000
      TimeFormat = 'h:mm'
    end
    object CheckBox2: TCheckBox
      Left = 272
      Top = 376
      Width = 97
      Height = 17
      Caption = #23450#26102#21457#36865
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 840
    Top = 64
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 480
    Top = 344
  end
  object Timer2: TTimer
    Left = 360
    Top = 360
  end
end
