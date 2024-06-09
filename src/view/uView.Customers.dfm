inherited frmCustomers: TfrmCustomers
  Hint = 'Customer'#39's Details - Inserting / Updating'
  Caption = 'Customers - %s'
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
            Width = 57
            Height = 15
            Caption = 'First Name'
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
            Width = 56
            Height = 15
            Caption = 'Last Name'
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
            Width = 66
            Height = 15
            Caption = 'Date of Birth'
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
            Width = 72
            Height = 15
            Caption = 'Creation Date'
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
            Width = 48
            Height = 15
            Caption = 'ZIP Code'
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
            Width = 30
            Height = 15
            Caption = 'Street'
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
            Width = 53
            Height = 15
            Caption = 'House No'
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
            Width = 85
            Height = 15
            Caption = 'Neighbourhood'
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
            Width = 21
            Height = 15
            Caption = 'City'
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
            Width = 26
            Height = 15
            Caption = 'State'
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
            Caption = 'Search'
            TabOrder = 7
            OnClick = btnSearchClick
          end
        end
      end
    end
  end
  inherited FMemTable: TFDMemTable
    StoreDefs = True
    object FMemTableID: TIntegerField
      FieldName = 'ID'
    end
    object FMemTableFirstName: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FirstName'
      Size = 50
    end
    object FMemTableLastName: TStringField
      DisplayLabel = 'Last Name'
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
      DisplayLabel = 'Creation Date'
      DisplayWidth = 15
      FieldName = 'CreationDate'
    end
  end
end
