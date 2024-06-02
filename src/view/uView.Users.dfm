inherited frmUsers: TfrmUsers
  Hint = 'User'#39's Details - Inserting / Updating'
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
            ExplicitWidth = 777
            ExplicitHeight = 161
          end
          object Label1: TLabel
            Left = 104
            Top = 12
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
            Left = 142
            Top = 12
            Width = 32
            Height = 15
            Caption = 'Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 104
            Top = 63
            Width = 30
            Height = 15
            Caption = 'Login'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 564
            Top = 63
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
          object edtID: TEdit
            Left = 104
            Top = 33
            Width = 32
            Height = 23
            TabStop = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtName: TEdit
            Left = 142
            Top = 33
            Width = 530
            Height = 23
            TabOrder = 1
          end
          object edtLogin: TEdit
            Left = 104
            Top = 84
            Width = 454
            Height = 23
            TabOrder = 2
          end
          object edtCreationDate: TDateTimePicker
            Left = 564
            Top = 84
            Width = 108
            Height = 23
            Date = 45442.000000000000000000
            Time = 0.630064456017862500
            Enabled = False
            TabOrder = 3
            TabStop = False
          end
          object GroupBox1: TGroupBox
            Left = 104
            Top = 120
            Width = 568
            Height = 129
            Caption = 'Options'
            DefaultHeaderFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15424594
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = 15424594
            HeaderFont.Height = -12
            HeaderFont.Name = 'Segoe UI'
            HeaderFont.Style = []
            ParentFont = False
            TabOrder = 4
            object cbNewPassword: TCheckBox
              Left = 16
              Top = 22
              Width = 209
              Height = 17
              Caption = 'Ask for new password on login'
              TabOrder = 0
            end
            object cbUsers: TCheckBox
              Left = 280
              Top = 22
              Width = 209
              Height = 17
              Caption = 'Acess to Users'
              TabOrder = 1
            end
            object cbCustomers: TCheckBox
              Left = 280
              Top = 68
              Width = 209
              Height = 17
              Caption = 'Acess to Customers'
              TabOrder = 3
            end
            object cbProducts: TCheckBox
              Left = 280
              Top = 45
              Width = 209
              Height = 17
              Caption = 'Acess to Products'
              TabOrder = 2
            end
            object cbOrders: TCheckBox
              Left = 280
              Top = 91
              Width = 209
              Height = 17
              Caption = 'Acess to Orders'
              Enabled = False
              State = cbGrayed
              TabOrder = 4
            end
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
    object FMemTableName: TStringField
      DisplayWidth = 60
      FieldName = 'Name'
      Size = 80
    end
    object FMemTableLogin: TStringField
      FieldName = 'Login'
      Size = 40
    end
    object FMemTableCreationDate: TDateField
      DisplayLabel = 'Creation Date'
      FieldName = 'CreationDate'
    end
    object FMemTableIsPassTemp: TBooleanField
      FieldName = 'IsPassTemp'
      Visible = False
    end
    object FMemTableHasUserScr: TBooleanField
      FieldName = 'HasUserScr'
      Visible = False
    end
    object FMemTableHasProductScr: TBooleanField
      FieldName = 'HasProductScr'
      Visible = False
    end
    object FMemTableHasCustomerScr: TBooleanField
      FieldName = 'HasCustomerScr'
      Visible = False
    end
    object FMemTableHasOrderScr: TBooleanField
      FieldName = 'HasOrderScr'
      Visible = False
    end
  end
end
