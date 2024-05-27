object frmBaseRegistration: TfrmBaseRegistration
  Left = 0
  Top = 0
  Caption = 'frmBaseRegistration'
  ClientHeight = 441
  ClientWidth = 844
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 860
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 65
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      844
      65)
    object btInsert: TButton
      Left = 4
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Insert'
      ImageAlignment = iaCenter
      ImageIndex = 0
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btInsertClick
    end
    object btEdit: TButton
      Left = 136
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Edit'
      ImageAlignment = iaCenter
      ImageIndex = 3
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btEditClick
    end
    object btCancel: TButton
      Left = 268
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Cancel'
      ImageAlignment = iaCenter
      ImageIndex = 1
      Images = dmImages.imgNav
      TabOrder = 4
      OnClick = btCancelClick
    end
    object btSave: TButton
      Left = 202
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Save'
      ImageAlignment = iaCenter
      ImageIndex = 4
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btSaveClick
    end
    object btRefresh: TButton
      Left = 334
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Refresh'
      ImageAlignment = iaCenter
      ImageIndex = 5
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btRefreshClick
    end
    object btDelete: TButton
      Left = 70
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Delete'
      ImageAlignment = iaCenter
      ImageIndex = 2
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btDeleteClick
    end
    object btLast: TButton
      Left = 780
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Last'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 7
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btLastClick
    end
    object btSucc: TButton
      Left = 714
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Next'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 7
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btSuccClick
    end
    object btPred: TButton
      Left = 648
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Previous'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 8
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btPredClick
    end
    object btFirst: TButton
      Left = 582
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'First'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 6
      Images = dmImages.imgNav
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btFirstClick
    end
  end
  object pages: TPageControl
    Left = 0
    Top = 65
    Width = 844
    Height = 376
    ActivePage = tsEdit
    Align = alClient
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object tsList: TTabSheet
      Caption = 'List'
      object gdData: TDBGrid
        Left = 0
        Top = 0
        Width = 836
        Height = 346
        Align = alClient
        BorderStyle = bsNone
        DataSource = FDataSource
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack, dgThumbTracking]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tsEdit: TTabSheet
      Caption = 'Edit'
      ImageIndex = 1
      object pnlEdit: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 346
        Align = alClient
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          836
          346)
        object pnlTitle: TPanel
          Left = 29
          Top = 16
          Width = 777
          Height = 49
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 0
          object rectTitle: TShape
            Left = 0
            Top = 0
            Width = 777
            Height = 49
            Align = alClient
            Brush.Color = 5515522
            Shape = stRoundRect
            ExplicitLeft = 376
            ExplicitTop = 8
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object lblTitle: TLabel
            Left = 0
            Top = 0
            Width = 777
            Height = 49
            Align = alClient
            Alignment = taCenter
            Caption = 'lblTitle - Hint'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 117
            ExplicitHeight = 25
          end
        end
        object pnlData: TPanel
          Left = 29
          Top = 78
          Width = 777
          Height = 259
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          TabOrder = 1
          object rectData: TShape
            Left = 0
            Top = 0
            Width = 777
            Height = 259
            Align = alClient
            Brush.Color = 8145973
            ExplicitLeft = -1
            ExplicitWidth = 713
            ExplicitHeight = 251
          end
        end
      end
    end
  end
  object FMemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 780
    Top = 99
  end
  object FDataSource: TDataSource
    DataSet = FMemTable
    Left = 780
    Top = 155
  end
end
