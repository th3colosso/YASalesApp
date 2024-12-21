unit uController.Customers;

interface

uses
  FireDAC.Comp.Client,
  uEntity.Customer,
  Vcl.Controls;

type
  TControllerCustomers = class
  public
    class procedure ShowCustomersForm(AParent: TWinControl);
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class function Save(const ACustomer: TEntityCustomer): Boolean;
    class function Delete(const AId: Integer): Boolean;
  end;

implementation

uses
  Vcl.Forms,
  uView.Customers,
  UModel.Customers,
  uModel.Connection;

{ TControllerCustomers }

class function TControllerCustomers.Delete(const AId: Integer): Boolean;
begin
  var CustomersModel := TModelCustomers.Create(dmConnection.Conn);
  try
    Result := CustomersModel.Delete(AId);
  finally
    CustomersModel.Free;
  end;
end;

class function TControllerCustomers.Load(var AMemTable: TFDMemTable): Boolean;
begin
  var CustomersModel := TModelCustomers.Create(dmConnection.Conn);
  try
    Result := CustomersModel.Load(AMemTable);
  finally
    CustomersModel.Free;
  end;
end;

class function TControllerCustomers.Save(const ACustomer: TEntityCustomer): Boolean;
begin
  var CustomersModel := TModelCustomers.Create(dmConnection.Conn);
  try
    Result := CustomersModel.Save(ACustomer);
  finally
    CustomersModel.Free;
  end;
end;

class procedure TControllerCustomers.ShowCustomersForm(AParent: TWinControl);
begin
  var frmCustomers := TfrmCustomers.Create(Application.MainForm);
  try
    frmCustomers.Parent := AParent;
    frmCustomers.Show;
  except
    frmCustomers.Free;
  end;
end;

end.
