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
          object Label1: TLabel
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
          object Label2: TLabel
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
          object Label3: TLabel
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
          object Label4: TLabel
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
          object Label5: TLabel
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
          object Label6: TLabel
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
          object Label7: TLabel
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
          object Label8: TLabel
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
          object Label9: TLabel
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
          object Label10: TLabel
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
          object Label11: TLabel
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
          object Label12: TLabel
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
          object dtpBirthday: TDateTimePicker
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
            TabOrder = 6
          end
          object edtStreet: TEdit
            Left = 199
            Top = 154
            Width = 416
            Height = 23
            TabOrder = 7
          end
          object edtHouseNo: TEdit
            Left = 621
            Top = 154
            Width = 106
            Height = 23
            TabOrder = 8
          end
          object edtNeighbourhood: TEdit
            Left = 50
            Top = 204
            Width = 222
            Height = 23
            TabOrder = 9
          end
          object edtCity: TEdit
            Left = 278
            Top = 204
            Width = 222
            Height = 23
            TabOrder = 10
          end
          object edtState: TEdit
            Left = 507
            Top = 204
            Width = 222
            Height = 23
            TabOrder = 11
          end
          object btnSearch: TButton
            Left = 137
            Top = 154
            Width = 56
            Height = 23
            Cursor = crHandPoint
            Caption = 'Search'
            TabOrder = 12
          end
        end
      end
    end
  end
  inherited FMemTable: TFDMemTable
    object FMemTableID: TIntegerField
      FieldName = 'ID'
    end
    object FMemTableFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object FMemTableLastName: TStringField
      FieldName = 'LastName'
    end
    object FMemTableEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object FMemTableDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
    end
    object FMemTableZipCode: TIntegerField
      FieldName = 'ZipCode'
    end
    object FMemTableStreet: TStringField
      FieldName = 'Street'
      Size = 50
    end
    object FMemTableNeighbourhood: TStringField
      FieldName = 'Neighbourhood'
      Size = 30
    end
    object FMemTableHouseNo: TIntegerField
      FieldName = 'HouseNo'
    end
    object FMemTableState: TStringField
      FieldName = 'State'
      Size = 2
    end
    object FMemTableCity: TStringField
      FieldName = 'City'
      Size = 30
    end
  end
end
