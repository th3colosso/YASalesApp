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
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 5
    end
    object btLast: TButton
      Left = 780
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Refresh'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 7
      Images = dmImages.imgNav
      TabOrder = 6
    end
    object btSucc: TButton
      Left = 714
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Refresh'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 7
      Images = dmImages.imgNav
      TabOrder = 7
    end
    object btPred: TButton
      Left = 648
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Refresh'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 8
      Images = dmImages.imgNav
      TabOrder = 8
    end
    object btFirst: TButton
      Left = 582
      Top = 3
      Width = 60
      Height = 60
      Cursor = crHandPoint
      Hint = 'Refresh'
      Anchors = [akTop, akRight]
      ImageAlignment = iaCenter
      ImageIndex = 6
      Images = dmImages.imgNav
      TabOrder = 9
    end
  end
  object pages: TPageControl
    Left = 0
    Top = 65
    Width = 844
    Height = 376
    ActivePage = tsList
    Align = alClient
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    ExplicitHeight = 375
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
