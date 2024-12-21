unit uController.Products;

interface

uses
  FireDAC.Comp.Client,
  uEntity.Product,
  Vcl.Controls;

type
  TControllerProducts = class
  public
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class function Save(const AProduct: TEntityProduct): Boolean;
    class function Delete(const AId: Integer): Boolean;
    class procedure ShowProductsForm(AParent: TWinControl);
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

class procedure TControllerProducts.ShowProductsForm(AParent: TWinControl);
begin
  var Form := TfrmProducts.Create(Application.MainForm);
  try
    Form.Parent := AParent;
    Form.Show;
  except
    Form.Free;
  end;
end;

end.
