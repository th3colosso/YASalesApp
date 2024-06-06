unit uController.Address;

interface

uses
  uEntity.AddressInfo;

type
  TControllerAddress = class
  public
    class function GetBrazilianAddressInfo(AZipCode: string): TEntityAddressInfo;
  end;

implementation

uses
  uModel.AddressInfo.ViaCEP;

{ TControllerAddress }

class function TControllerAddress.GetBrazilianAddressInfo(AZipCode: string): TEntityAddressInfo;
begin
  var BrazilAddressInfo := TModelAdressInfoViaCEP.Create;
  try
    Result := BrazilAddressInfo.GetBrazilianAddressInfo(AZipCode);
  finally
    BrazilAddressInfo.Free;
  end;
end;

end.
