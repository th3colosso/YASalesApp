inherited frmCustomers: TfrmCustomers
  Hint = 'Informa'#231#245'es do Cliente'
  BorderStyle = bsSizeable
  Caption = 'Clientes'
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
            ExplicitLeft = 0
            ExplicitTop = -7
            ExplicitWidth = 777
            ExplicitHeight = 259
          end
          object lblId: TLabel
            Left = 50
            Top = 32
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
          object lblFirstName: TLabel
            Left = 97
            Top = 32
            Width = 81
            Height = 15
            Caption = 'Primeiro Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblLastName: TLabel
            Left = 345
            Top = 32
            Width = 72
            Height = 15
            Caption = #218'ltimo Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblDateOfBirth: TLabel
            Left = 621
            Top = 32
            Width = 107
            Height = 15
            Caption = 'Data de Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblEmail: TLabel
            Left = 50
            Top = 82
            Width = 29
            Height = 15
            Caption = 'Email'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblCreationDate: TLabel
            Left = 621
            Top = 82
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
          object lblZipCode: TLabel
            Left = 50
            Top = 133
            Width = 21
            Height = 15
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblStreet: TLabel
            Left = 199
            Top = 133
            Width = 20
            Height = 15
            Caption = 'Rua'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblHouseNo: TLabel
            Left = 621
            Top = 133
            Width = 44
            Height = 15
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblNeighbourhood: TLabel
            Left = 50
            Top = 183
            Width = 31
            Height = 15
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblCity: TLabel
            Left = 278
            Top = 183
            Width = 37
            Height = 15
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblState: TLabel
            Left = 507
            Top = 183
            Width = 35
            Height = 15
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtID: TEdit
            Left = 50
            Top = 53
            Width = 41
            Height = 23
            ReadOnly = True
            TabOrder = 0
          end
          object edtFirstName: TEdit
            Left = 97
            Top = 53
            Width = 242
            Height = 23
            TabOrder = 1
          end
          object edtLastName: TEdit
            Left = 345
            Top = 53
            Width = 270
            Height = 23
            TabOrder = 2
          end
          object dtpCreationDate: TDateTimePicker
            Left = 621
            Top = 103
            Width = 106
            Height = 23
            Date = 45446.000000000000000000
            Time = 0.891918090281251400
            Enabled = False
            TabOrder = 3
          end
          object dtpDateOfBirth: TDateTimePicker
            Left = 621
            Top = 53
            Width = 106
            Height = 23
            Date = 45446.000000000000000000
            Time = 0.891918090281251400
            TabOrder = 4
          end
          object edtEmail: TEdit
            Left = 50
            Top = 103
            Width = 565
            Height = 23
            TabOrder = 5
          end
          object edtZipCode: TEdit
            Left = 50
            Top = 154
            Width = 81
            Height = 23
            NumbersOnly = True
            TabOrder = 6
          end
          object edtStreet: TEdit
            Left = 199
            Top = 154
            Width = 416
            Height = 23
            TabOrder = 8
          end
          object edtHouseNo: TEdit
            Left = 621
            Top = 154
            Width = 106
            Height = 23
            TabOrder = 9
          end
          object edtNeighbourhood: TEdit
            Left = 50
            Top = 204
            Width = 222
            Height = 23
            TabOrder = 10
          end
          object edtCity: TEdit
            Left = 278
            Top = 204
            Width = 222
            Height = 23
            TabOrder = 11
          end
          object edtState: TEdit
            Left = 507
            Top = 204
            Width = 222
            Height = 23
            TabOrder = 12
          end
          object btnSearch: TButton
            Left = 137
            Top = 154
            Width = 56
            Height = 23
            Cursor = crHandPoint
            Caption = 'Buscar'
            TabOrder = 7
            OnClick = btnSearchClick
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
        Name = 'FirstName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LastName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DateOfBirth'
        DataType = ftDate
      end
      item
        Name = 'ZipCode'
        DataType = ftInteger
      end
      item
        Name = 'Street'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Neighbourhood'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'HouseNo'
        DataType = ftInteger
      end
      item
        Name = 'State'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CreationDate'
        DataType = ftDate
      end>
    StoreDefs = True
    object FMemTableID: TIntegerField
      FieldName = 'ID'
    end
    object FMemTableFirstName: TStringField
      DisplayLabel = 'Primeiro Nome'
      FieldName = 'FirstName'
      Size = 50
    end
    object FMemTableLastName: TStringField
      DisplayLabel = #218'ltimo Nome'
      DisplayWidth = 50
      FieldName = 'LastName'
      Size = 50
    end
    object FMemTableEmail: TStringField
      FieldName = 'Email'
      Visible = False
      Size = 100
    end
    object FMemTableDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
      Visible = False
    end
    object FMemTableZipCode: TIntegerField
      FieldName = 'ZipCode'
      Visible = False
    end
    object FMemTableStreet: TStringField
      FieldName = 'Street'
      Visible = False
      Size = 50
    end
    object FMemTableNeighbourhood: TStringField
      FieldName = 'Neighbourhood'
      Visible = False
      Size = 30
    end
    object FMemTableHouseNo: TIntegerField
      FieldName = 'HouseNo'
      Visible = False
    end
    object FMemTableState: TStringField
      FieldName = 'State'
      Visible = False
      Size = 30
    end
    object FMemTableCity: TStringField
      FieldName = 'City'
      Visible = False
      Size = 30
    end
    object FMemTableCreationDate: TDateField
      DisplayLabel = 'Data de Cria'#231#227'o'
      DisplayWidth = 15
      FieldName = 'CreationDate'
    end
  end
end
