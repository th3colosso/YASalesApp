unit uController.Customers;

interface

type
  TControllerCustomers = class
  public
    class procedure ShowCustomersForm;
  end;

implementation

uses
  Vcl.Forms,
  uView.Customers;

{ TControllerCustomers }

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
