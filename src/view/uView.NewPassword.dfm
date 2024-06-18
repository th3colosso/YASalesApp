object frmNewPassword: TfrmNewPassword
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmPassword'
  ClientHeight = 240
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 240
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnlTitle: TPanel
      Left = 1
      Top = 1
      Width = 310
      Height = 56
      Align = alTop
      Caption = 'Password Update Required'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlData: TPanel
      Left = 1
      Top = 57
      Width = 310
      Height = 182
      Align = alClient
      TabOrder = 1
      object lblNewPassword: TLabel
        Left = 32
        Top = 11
        Width = 77
        Height = 15
        Caption = 'New password'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblConfirm: TLabel
        Left = 32
        Top = 64
        Width = 122
        Height = 15
        Caption = 'Confirm new password'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtPassword: TEdit
        Left = 32
        Top = 32
        Width = 241
        Height = 23
        TabOrder = 0
      end
      object edtPasswordCopy: TEdit
        Left = 32
        Top = 85
        Width = 241
        Height = 23
        TabOrder = 1
      end
      object btnSave: TButton
        Left = 32
        Top = 127
        Width = 100
        Height = 40
        Cursor = crHandPoint
        Caption = 'Save'
        TabOrder = 2
        OnClick = btnSaveClick
      end
      object btnCancel: TButton
        Left = 173
        Top = 127
        Width = 100
        Height = 40
        Cursor = crHandPoint
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
  end
end
