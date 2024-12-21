inherited frmUsers: TfrmUsers
  Hint = 'Informa'#231#245'es do Usu'#225'rio'
  Caption = 'Usu'#225'rios'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlButtons: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited pages: TPageControl
    ActivePage = tsEdit
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
          object Label3: TLabel
            Left = 104
            Top = 63
            Width = 40
            Height = 15
            Caption = 'Usu'#225'rio'
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
          object dtpCreationDate: TDateTimePicker
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
            Caption = 'Op'#231#245'es'
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
              Caption = 'Solicitar troca de senha ao entrar'
              TabOrder = 0
            end
            object cbUsers: TCheckBox
              Left = 280
              Top = 18
              Width = 209
              Height = 17
              Caption = 'Tela de Usu'#225'rios'
              TabOrder = 1
            end
            object cbCustomers: TCheckBox
              Left = 280
              Top = 64
              Width = 209
              Height = 17
              Caption = 'Tela de Clientes'
              TabOrder = 3
            end
            object cbProducts: TCheckBox
              Left = 280
              Top = 41
              Width = 209
              Height = 17
              Caption = 'Tela de Produtos'
              TabOrder = 2
            end
            object cbOrders: TCheckBox
              Left = 280
              Top = 87
              Width = 209
              Height = 17
              Caption = 'Tela de Vendas'
              Enabled = False
              State = cbGrayed
              TabOrder = 4
            end
            object CheckBox1: TCheckBox
              Left = 280
              Top = 109
              Width = 209
              Height = 17
              Caption = 'Tela de Relat'#243'rios'
              Enabled = False
              State = cbGrayed
              TabOrder = 5
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
        Size = 80
      end
      item
        Name = 'Login'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'CreationDate'
        DataType = ftDate
      end
      item
        Name = 'IsPassTemp'
        DataType = ftBoolean
      end
      item
        Name = 'HasUserScr'
        DataType = ftBoolean
      end
      item
        Name = 'HasProductScr'
        DataType = ftBoolean
      end
      item
        Name = 'HasCustomerScr'
        DataType = ftBoolean
      end
      item
        Name = 'HasOrderScr'
        DataType = ftBoolean
      end>
    StoreDefs = True
    object FMemTableID: TIntegerField
      FieldName = 'ID'
    end
    object FMemTableName: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'Name'
      Size = 80
    end
    object FMemTableLogin: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Login'
      Size = 40
    end
    object FMemTableCreationDate: TDateField
      DisplayLabel = 'Data de Cria'#231#227'o'
      DisplayWidth = 15
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
