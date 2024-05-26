unit uController.Products;

interface

uses
  FireDAC.Comp.Client;

type
  TControllerProducts = class
  public
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class procedure ShowRegistrationForm;
  end;

implementation

uses
  VCl.Forms,
  uModel.Products,
  uModel.Connection,
  uView.Products;

{ TControllerProducts }

class function TControllerProducts.Load(var AMemTable: TFDMemTable): Boolean;
begin
  var ProductsModel := TModelProducts.Create(dmConnection.Conn);
  try
    Result := ProductsModel.Load(AMemTable);
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
