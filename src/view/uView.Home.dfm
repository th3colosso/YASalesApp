object frmHome: TfrmHome
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'YASales'
  ClientHeight = 141
  ClientWidth = 434
  Color = clBtnFace
  Constraints.MaxHeight = 180
  Constraints.MaxWidth = 450
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
    Width = 434
    Height = 141
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnProducts: TButton
      Left = 17
      Top = 6
      Width = 129
      Height = 129
      Cursor = crHandPoint
      Caption = 'Products'
      Constraints.MaxHeight = 180
      ImageAlignment = iaTop
      ImageIndex = 0
      ImageMargins.Top = 20
      Images = dmImages.imgList
      TabOrder = 0
      OnClick = btnProductsClick
    end
    object btnCustomers: TButton
      Left = 152
      Top = 6
      Width = 129
      Height = 129
      Cursor = crHandPoint
      Caption = 'Customers'
      Constraints.MaxHeight = 180
      ImageAlignment = iaTop
      ImageIndex = 1
      ImageMargins.Top = 20
      Images = dmImages.imgList
      TabOrder = 1
      OnClick = btnCustomersClick
    end
    object btnSales: TButton
      Left = 287
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
      Images = dmImages.imgList
      TabOrder = 2
    end
  end
end
