unit uModel.Customers;

interface

uses
  uModel.Base,
  uEntity.Customer,
  FireDAC.Comp.Client;

type

  TModelCustomers = class(TModelBase)
  public
    function Save(const ACustomer: TEntityCustomer): Boolean;
    function Load(var AMemTable: TFDMemTable): Boolean;
    function Delete(const AId: Integer): Boolean;
  end;

implementation

uses
  System.SysUtils;

{ TModelCustomers }

function TModelCustomers.Delete(const AId: Integer): Boolean;
begin
  try
    Result := DeleteByID('CUSTOMERS', Aid);
  except
    on E: Exception do
    begin
      Result := False;
      Log(Self, E);
    end;
  end;
end;

function TModelCustomers.Load(var AMemTable: TFDMemTable): Boolean;
begin
  try
    AMemTable.EmptyDataSet;
    FQry.Open('SELECT * FROM CUSTOMERS');
    AMemTable.CopyDataSet(FQry);
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

function TModelCustomers.Save(const ACustomer: TEntityCustomer): Boolean;
begin
  try
    if ACustomer.ID > 0 then
      Result := FQry.ExecSQL('UPDATE CUSTOMERS SET FIRSTNAME = :1, LASTNAME = :2, EMAIL = :3, DATEOFBIRTH = :4, ZIPCODE = :5, STREET = :6, NEIGHBOURHOOD = :7, ' +
        'HOUSENO = :8, CITY = :9, STATE = :10 WHERE ID = :11', [ACustomer.FirstName, ACustomer.LastName, ACustomer.Email, FormatDateTime('yyyy-mm-dd', ACustomer.DateOfBirth),
        ACustomer.ZipCode, ACustomer.Street, ACustomer.Neighbourhood, ACustomer.HouseNo, ACustomer.City, ACustomer.State, ACustomer.Id]) = 1
    else
      Result := FQry.ExecSQL('INSERT INTO CUSTOMERS (FIRSTNAME, LASTNAME, EMAIL, DATEOFBIRTH, ZIPCODE, STREET, NEIGHBOURHOOD, HOUSENO, CITY, STATE) VALUES ' +
        '(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10)', [ACustomer.FirstName, ACustomer.LastName, ACustomer.Email, FormatDateTime('yyyy-mm-dd', ACustomer.DateOfBirth),
        ACustomer.ZipCode, ACustomer.Street, ACustomer.Neighbourhood, ACustomer.HouseNo, ACustomer.City, ACustomer.State]) = 1
  except
    on E: Exception do
    begin
      Result := False;
      Log(Self, E);
    end;
  end;
end;

end.
