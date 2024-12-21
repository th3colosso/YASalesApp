object frmHome: TfrmHome
  Left = 0
  Top = 0
  AlphaBlendValue = 0
  Caption = 'YASales App'
  ClientHeight = 451
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  VisualManager = frmTabBar
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 140
    Top = 0
    Width = 667
    Height = 451
    Align = alClient
    BevelEdges = [beRight]
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 75
    ExplicitTop = 120
    ExplicitWidth = 772
    object frmTabBar: TFormTabsBar
      Left = 1
      Top = 1
      Width = 665
      Height = 24
      ParentColor = False
      TabOptions.ShowCloseButton = True
      TabMinWidth = 80
      TabMaxWidth = 200
      ShowTabsMenuButton = True
      OnAcceptForm = frmTabBarAcceptForm
      ExplicitWidth = 770
    end
    object pnlForms: TPanel
      Left = 1
      Top = 25
      Width = 665
      Height = 425
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      ExplicitLeft = 128
      ExplicitTop = 160
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
  object svMenu: TSplitView
    Left = 0
    Top = 0
    Width = 140
    Height = 451
    BevelEdges = [beRight]
    BevelOuter = bvRaised
    CloseStyle = svcCompact
    Color = clWhite
    CompactWidth = 35
    OpenedWidth = 140
    ParentShowHint = False
    Placement = svpLeft
    ShowHint = True
    TabOrder = 1
    OnClosing = svMenuClosing
    OnOpening = svMenuOpening
    DesignSize = (
      140
      451)
    object btnMenu: TButton
      Left = 109
      Top = 5
      Width = 27
      Height = 25
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 0
      Images = dmImages.imgMenu
      TabOrder = 0
      OnClick = btnMenuClick
      ExplicitLeft = 4
    end
    object btnUsers: TButton
      Left = 4
      Top = 36
      Width = 132
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usu'#225'rios'
      ImageAlignment = iaRight
      ImageIndex = 1
      Images = dmImages.imgMenu
      TabOrder = 1
      OnClick = btnUsersClick
      ExplicitWidth = 27
    end
    object btnProducts: TButton
      Left = 4
      Top = 67
      Width = 132
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Produtos'
      ImageAlignment = iaRight
      ImageIndex = 2
      Images = dmImages.imgMenu
      TabOrder = 2
      OnClick = btnProductsClick
      ExplicitWidth = 27
    end
    object btnCustomers: TButton
      Left = 4
      Top = 98
      Width = 132
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Clientes'
      ImageAlignment = iaRight
      ImageIndex = 3
      Images = dmImages.imgMenu
      TabOrder = 3
      OnClick = btnCustomersClick
      ExplicitWidth = 27
    end
    object btnSales: TButton
      Left = 4
      Top = 129
      Width = 132
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Vendas'
      Enabled = False
      ImageAlignment = iaRight
      ImageIndex = 4
      Images = dmImages.imgMenu
      TabOrder = 4
      OnClick = btnSalesClick
      ExplicitWidth = 27
    end
  end
end
