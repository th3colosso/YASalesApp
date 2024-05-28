inherited frmProducts: TfrmProducts
  Hint = 'Product'#39's Details - Inserting / Updating'
  Caption = 'Products Registration'
  TextHeight = 15
  inherited pages: TPageControl
    inherited tsEdit: TTabSheet
      inherited pnlEdit: TPanel
        inherited pnlTitle: TPanel
          inherited lblTitle: TLabel
            Width = 777
            Height = 49
          end
        end
        inherited pnlData: TPanel
          inherited rectData: TShape
            ExplicitLeft = 54
            ExplicitTop = 32
            ExplicitWidth = 777
            ExplicitHeight = 259
          end
          object lblID: TLabel
            Left = 42
            Top = 11
            Width = 11
            Height = 15
            Caption = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblName: TLabel
            Left = 81
            Top = 11
            Width = 32
            Height = 15
            Caption = 'Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblPrice: TLabel
            Left = 535
            Top = 11
            Width = 26
            Height = 15
            Caption = 'Price'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblCreationDate: TLabel
            Left = 632
            Top = 11
            Width = 72
            Height = 15
            Caption = 'Creation Date'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblDescription: TLabel
            Left = 312
            Top = 61
            Width = 60
            Height = 15
            Caption = 'Description'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblImage: TLabel
            Left = 42
            Top = 61
            Width = 33
            Height = 15
            Caption = 'Image'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblCharCount: TLabel
            Left = 664
            Top = 63
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'lblCharCount'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtID: TEdit
            Left = 42
            Top = 32
            Width = 33
            Height = 23
            ReadOnly = True
            TabOrder = 0
          end
          object edtName: TEdit
            Left = 81
            Top = 32
            Width = 448
            Height = 23
            TabOrder = 1
          end
          object mmDescription: TMemo
            Left = 312
            Top = 82
            Width = 421
            Height = 159
            BiDiMode = bdLeftToRight
            MaxLength = 500
            ParentBiDiMode = False
            ScrollBars = ssVertical
            TabOrder = 4
            OnChange = mmDescriptionChange
          end
          object edtCreationDate: TDateTimePicker
            Left = 632
            Top = 32
            Width = 101
            Height = 23
            Date = 45438.000000000000000000
            Time = 0.658164826389111100
            Enabled = False
            ParseInput = True
            TabOrder = 3
          end
          object edtPrice: TEdit
            Left = 535
            Top = 32
            Width = 91
            Height = 23
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            TabOrder = 2
          end
          object btLoadImg: TButton
            Left = 81
            Top = 60
            Width = 40
            Height = 20
            Cursor = crHandPoint
            Caption = 'Load'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = btLoadImgClick
          end
          object pnlImage: TPanel
            Left = 42
            Top = 82
            Width = 264
            Height = 159
            BevelOuter = bvNone
            TabOrder = 6
            object rectImg: TShape
              Left = 0
              Top = 0
              Width = 264
              Height = 159
              Align = alClient
              Brush.Style = bsClear
              Pen.Color = 5515522
              Pen.Style = psDot
              ExplicitLeft = 56
              ExplicitTop = 24
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object img: TImage
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 258
              Height = 153
              Align = alClient
              Center = True
              Proportional = True
              Stretch = True
              ExplicitLeft = 0
              ExplicitTop = -4
              ExplicitWidth = 276
              ExplicitHeight = 125
            end
          end
        end
      end
    end
  end
  inherited FMemTable: TFDMemTable
    StoreDefs = True
    Left = 700
    object FMemTableID: TIntegerField
      DisplayWidth = 5
      FieldName = 'ID'
    end
    object FMemTableName: TStringField
      DisplayWidth = 50
      FieldName = 'Name'
      Size = 100
    end
    object FMemTablePrice: TFloatField
      FieldName = 'Price'
      DisplayFormat = '##0.00'
    end
    object FMemTableDescription: TStringField
      DisplayWidth = 80
      FieldName = 'Description'
      Size = 500
    end
    object FMemTableImage: TBlobField
      FieldName = 'Image'
      Visible = False
    end
    object FMemTableCreationDate: TDateField
      FieldName = 'CreationDate'
    end
  end
end
