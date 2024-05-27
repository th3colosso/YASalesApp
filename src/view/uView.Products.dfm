inherited frmProducts: TfrmProducts
  Hint = 'Product'#39's Details - Inserting / Updating'
  Caption = 'Products Registration'
  TextHeight = 15
  inherited pages: TPageControl
    inherited tsEdit: TTabSheet
      inherited pnlEdit: TPanel
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
            Left = 108
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
            Left = 42
            Top = 59
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
            Left = 204
            Top = 59
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
            Left = 324
            Top = 59
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
            Top = 109
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
          object edtID: TEdit
            Left = 42
            Top = 32
            Width = 60
            Height = 23
            ReadOnly = True
            TabOrder = 0
          end
          object edtName: TEdit
            Left = 108
            Top = 32
            Width = 626
            Height = 23
            TabOrder = 1
          end
          object mmDescription: TMemo
            Left = 324
            Top = 80
            Width = 409
            Height = 161
            MaxLength = 500
            TabOrder = 2
          end
          object edtCreationDate: TDateTimePicker
            Left = 204
            Top = 80
            Width = 114
            Height = 23
            Date = 45438.000000000000000000
            Time = 0.658164826389111100
            Enabled = False
            ParseInput = True
            TabOrder = 3
          end
          object edtPrice: TEdit
            Left = 42
            Top = 80
            Width = 156
            Height = 23
            TabOrder = 4
          end
          object btLoadImg: TButton
            Left = 81
            Top = 108
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
            Top = 134
            Width = 276
            Height = 107
            BevelOuter = bvNone
            TabOrder = 6
            object rectImg: TShape
              Left = 0
              Top = 0
              Width = 276
              Height = 107
              Align = alClient
              Brush.Style = bsClear
              Pen.Style = psDash
              ExplicitLeft = 56
              ExplicitTop = 24
              ExplicitWidth = 65
              ExplicitHeight = 65
            end
            object img: TImage
              AlignWithMargins = True
              Left = 0
              Top = -4
              Width = 276
              Height = 111
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              Center = True
              Proportional = True
              Stretch = True
            end
          end
        end
      end
    end
  end
  inherited FMemTable: TFDMemTable
    StoreDefs = True
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
