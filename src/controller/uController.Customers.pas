unit uController.Customers;

interface

uses
  FireDAC.Comp.Client,
  uEntity.Customer;

type
  TControllerCustomers = class
  public
    class procedure ShowCustomersForm;
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

class procedure TControllerCustomers.ShowCustomersForm;
begin
  var frmCustomers := TfrmCustomers.Create(Application);
  try
    frmCustomers.ShowModal;
  finally
    frmCustomers.Free;
  end;
end;

end.
