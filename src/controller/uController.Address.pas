unit uController.Address;

interface

uses
  uEntity.AddressInfo;

type
  TControllerAddress = class
  public
    class function GetBrazilianAddressInfo(const AZipCode: string): TEntityAddressInfo;
  end;

implementation

uses
  uModel.AddressInfo.ViaCEP;

{ TControllerAddress }

class function TControllerAddress.GetBrazilianAddressInfo(const AZipCode: string): TEntityAddressInfo;
begin
  var BrazilAddressInfo := TModelAdressInfoViaCEP.Create;
  try
    Result := BrazilAddressInfo.GetBrazilianAddressInfo(AZipCode);
  finally
    BrazilAddressInfo.Free;
  end;
end;

end.
