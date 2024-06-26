unit uModel.Products;

interface

uses
  uModel.Base,
  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Comp.Client,
  System.SysUtils,
  uEntity.Product,
  System.Classes;

type
  TModelProducts = class(TModelBase)
  private
    function ExecSelectAndCopy(const ASQL: string; var ADest: TFDMemTable): Boolean;
  public
    function Load(var AMemTable: TFDMemTable): Boolean;
    function Save(const AProduct: TEntityProduct): Boolean;
    function Delete(const AId: Integer): Boolean;
  end;

implementation

{ TModelProducts }

function TModelProducts.Delete(const AId: Integer): Boolean;
begin
  try
    Result := DeleteByID('PRODUCTS', AId);
  except
    on E: Exception do
    begin
      Result := False;
      Log(Self, E);
    end;
  end;
end;

function TModelProducts.ExecSelectAndCopy(const ASQL: string; var ADest: TFDMemTable): Boolean;
begin
  try
    FQry.Open(ASQL);
    ADest.EmptyDataSet;
    ADest.CopyDataSet(FQry);
    Result := True;
    FQry.Close;
  except
    on E: Exception do
    begin
      Result := False;
      Log(Self, E);
    end;
  end;
end;

function TModelProducts.Save(const AProduct: TEntityProduct): Boolean;
begin
  try
    if AProduct.ID > 0 then
    begin
      FQry.SQL.Text := 'UPDATE PRODUCTS SET NAME = :NAME, PRICE = :PRICE, IMAGE = :IMAGE, DESCRIPTION = :DESCRIPTION WHERE ID = :ID';
      FQry.ParamByName('NAME').AsString := AProduct.Name;
      FQry.ParamByName('PRICE').AsFloat := AProduct.Price;
      FQry.ParamByName('IMAGE').LoadFromStream(AProduct.Image, ftBlob, 0);
      FQry.ParamByName('DESCRIPTION').AsString := AProduct.Description;
      FQry.ParamByName('ID').AsInteger := AProduct.ID;
      FQry.ExecSQL;
    end
    else
    begin
      FQry.SQL.Text := 'INSERT INTO PRODUCTS (NAME, PRICE, IMAGE, DESCRIPTION) VALUES (:NAME, :PRICE, :IMAGE, :DESCRIPTION)';
      FQry.ParamByName('NAME').AsString := AProduct.Name;
      FQry.ParamByName('PRICE').AsFloat := AProduct.Price;
      FQry.ParamByName('IMAGE').LoadFromStream(AProduct.Image, ftBlob, 0);
      FQry.ParamByName('DESCRIPTION').AsString := AProduct.Description;
      FQry.ExecSQL;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      Log(Self, E);
    end;
  end;
end;

function TModelProducts.Load(var AMemTable: TFDMemTable): Boolean;
begin
  FSQL := 'SELECT * FROM PRODUCTS';
  Result := ExecSelectAndCopy(FSQL, AMemTable);
end;

end.
