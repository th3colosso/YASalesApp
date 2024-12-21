inherited frmProducts: TfrmProducts
  Hint = 'Informa'#231#245'es do Produto'
  Caption = 'Produtos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlButtons: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited pages: TPageControl
    inherited tsEdit: TTabSheet
      inherited pnlEdit: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited pnlTitle: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited lblTitle: TLabel
            Width = 777
            Height = 49
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited pnlData: TPanel
          StyleElements = [seFont, seClient, seBorder]
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
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblName: TLabel
            Left = 81
            Top = 11
            Width = 33
            Height = 15
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblPrice: TLabel
            Left = 535
            Top = 11
            Width = 30
            Height = 15
            Caption = 'Pre'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblCreationDate: TLabel
            Left = 632
            Top = 11
            Width = 83
            Height = 15
            Caption = 'Data de Cria'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblDescription: TLabel
            Left = 312
            Top = 61
            Width = 51
            Height = 15
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblImage: TLabel
            Left = 42
            Top = 61
            Width = 44
            Height = 15
            Caption = 'Imagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
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
            Font.Color = 15424594
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
            TabStop = False
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
          object dtpCreationDate: TDateTimePicker
            Left = 632
            Top = 32
            Width = 101
            Height = 23
            Date = 45438.000000000000000000
            Time = 0.658164826389111100
            Enabled = False
            ParseInput = True
            TabOrder = 3
            TabStop = False
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
            Left = 93
            Top = 60
            Width = 48
            Height = 20
            Cursor = crHandPoint
            Caption = 'Carregar'
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
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'Description'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'Image'
        DataType = ftBlob
      end
      item
        Name = 'CreationDate'
        DataType = ftDate
      end>
    StoreDefs = True
    Left = 700
    object FMemTableID: TIntegerField
      DisplayWidth = 5
      FieldName = 'ID'
    end
    object FMemTableName: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 40
      FieldName = 'Name'
      Size = 100
    end
    object FMemTablePrice: TFloatField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 10
      FieldName = 'Price'
      DisplayFormat = '##0.00'
    end
    object FMemTableDescription: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 60
      FieldName = 'Description'
      Size = 500
    end
    object FMemTableImage: TBlobField
      DisplayLabel = 'Imagem'
      FieldName = 'Image'
      Visible = False
    end
    object FMemTableCreationDate: TDateField
      DisplayLabel = 'Data de Cria'#231#227'o'
      DisplayWidth = 15
      FieldName = 'CreationDate'
    end
  end
end
