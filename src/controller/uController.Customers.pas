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
    class function Save(ACustomer: TEntityCustomer): Boolean;
    class function Delete(AId: Integer): Boolean;
  end;

implementation

uses
  Vcl.Forms,
  uView.Customers,
  UModel.Customers,
  uModel.Connection;

{ TControllerCustomers }

class function TControllerCustomers.Delete(AId: Integer): Boolean;
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

class function TControllerCustomers.Save(ACustomer: TEntityCustomer): Boolean;
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
