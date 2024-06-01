object frmHome: TfrmHome
  Left = 0
  Top = 0
  AlphaBlendValue = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'YASales App'
  ClientHeight = 141
  ClientWidth = 559
  Color = clBtnFace
  Constraints.MaxHeight = 180
  Constraints.MaxWidth = 575
  Constraints.MinHeight = 180
  Constraints.MinWidth = 575
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 141
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnProducts: TButton
      Left = 148
      Top = 6
      Width = 129
      Height = 129
      Cursor = crHandPoint
      Caption = 'Products'
      Constraints.MaxHeight = 180
      ImageAlignment = iaTop
      ImageIndex = 1
      ImageMargins.Top = 20
      Images = dmImages.imgHome
      TabOrder = 0
      OnClick = btnProductsClick
    end
    object btnCustomers: TButton
      Left = 283
      Top = 6
      Width = 129
      Height = 129
      Cursor = crHandPoint
      Caption = 'Customers'
      Constraints.MaxHeight = 180
      ImageAlignment = iaTop
      ImageIndex = 0
      ImageMargins.Top = 20
      Images = dmImages.imgHome
      TabOrder = 1
      OnClick = btnCustomersClick
    end
    object btnSales: TButton
      Left = 418
      Top = 6
      Width = 129
      Height = 129
      Cursor = crHandPoint
      Caption = 'Sales'
      Constraints.MaxHeight = 180
      Enabled = False
      ImageAlignment = iaTop
      ImageIndex = 2
      ImageMargins.Top = 20
      Images = dmImages.imgHome
      TabOrder = 2
    end
    object btnUsers: TButton
      Left = 13
      Top = 6
      Width = 129
      Height = 129
      Cursor = crHandPoint
      Caption = 'Users'
      Constraints.MaxHeight = 180
      ImageAlignment = iaTop
      ImageIndex = 3
      ImageMargins.Top = 20
      Images = dmImages.imgHome
      TabOrder = 3
      OnClick = btnUsersClick
    end
  end
end
