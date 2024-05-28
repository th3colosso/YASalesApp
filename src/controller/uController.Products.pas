unit uController.Products;

interface

uses
  FireDAC.Comp.Client,
  uEntity.Product;

type
  TControllerProducts = class
  public
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class function Save(var AProduct: TEntityProduct): Boolean;
    class function Delete(AId: Integer): Boolean;
    class procedure ShowRegistrationForm;
  end;

implementation

uses
  VCl.Forms,
  uModel.Products,
  uModel.Connection,
  uView.Products;

{ TControllerProducts }

class function TControllerProducts.Delete(AId: Integer): Boolean;
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

class function TControllerProducts.Save(var AProduct: TEntityProduct): Boolean;
begin
  var ProductsModel := TModelProducts.Create(dmConnection.Conn);
  try
    Result := ProductsModel.Save(AProduct);
  finally
    ProductsModel.Free;
  end;
end;

class procedure TControllerProducts.ShowRegistrationForm;
begin
  var Form := TfrmProducts.Create(Application);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
