inherited frmProducts: TfrmProducts
  Caption = 'Products Registration'
  TextHeight = 15
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
        Name = 'CreationDate'
        DataType = ftDate
      end>
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
    object FMemTableCreationDate: TDateField
      FieldName = 'CreationDate'
    end
  end
end
