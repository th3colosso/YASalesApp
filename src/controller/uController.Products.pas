unit uController.Products;

interface

uses
  FireDAC.Comp.Client,
  uEntity.Product;

type
  TControllerProducts = class
  public
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class function Save(const AProduct: TEntityProduct): Boolean;
    class function Delete(const AId: Integer): Boolean;
    class procedure ShowProductsForm;
  end;

implementation

uses
  VCl.Forms,
  uModel.Products,
  uModel.Connection,
  uView.Products;

{ TControllerProducts }

class function TControllerProducts.Delete(const AId: Integer): Boolean;
begin
  var ProductsModel := TModelProducts.Create(dmConnection.Conn);
  try
    Result := ProductsModel.Delete(AId);
  finally
    ProductsModel.Free;
  end;
end;

class function TControllerProducts.Load(var AMemTable: TFDMemTable): Boolean;
begin
  var ProductsModel := TModelProducts.Create(dmConnection.Conn);
  try
    Result := ProductsModel.Load(AMemTable);
  finally
    ProductsModel.Free;
  end;
end;

class function TControllerProducts.Save(const AProduct: TEntityProduct): Boolean;
begin
  var ProductsModel := TModelProducts.Create(dmConnection.Conn);
  try
    Result := ProductsModel.Save(AProduct);
  finally
    ProductsModel.Free;
  end;
end;

class procedure TControllerProducts.ShowProductsForm;
begin
  var Form := TfrmProducts.Create(Application);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
