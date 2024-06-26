unit uModel.AddressInfo.ViaCEP;

interface

uses
  uEntity.AddressInfo,
  Net.HttpClient,
  Net.HttpClientComponent;

type
  TModelAdressInfoViaCEP = class
  private
    function IsValidZipCode(const AZipCode: string): Boolean;
    function ParseJsonResponse(const ARes: IHTTPResponse): TEntityAddressInfo;
  public
    function GetBrazilianAddressInfo(const AZipCode: string): TEntityAddressInfo;
  end;

implementation

uses
  System.SysUtils,
  System.Json;

{ TModelAdressInfoViaCEP }

function TModelAdressInfoViaCEP.IsValidZipCode(const AZipCode: string): Boolean;
begin
  Result := AZipCode.Length = 8;
end;

function TModelAdressInfoViaCEP.ParseJsonResponse(const ARes: IHTTPResponse): TEntityAddressInfo;
begin
  var Obj := TJSONObject.ParseJSONValue(ARes.ContentAsString());
  var value: string;
  try
    if Obj.TryGetValue<string>('erro', value) then
    begin
      Result.ZipCode := EmptyStr;
      Exit;
    end;

    Obj.TryGetValue<string>('cep', Result.ZipCode);
    Obj.TryGetValue<string>('logradouro', Result.Street);
    Obj.TryGetValue<string>('bairro', Result.Neighbourhood);
    Obj.TryGetValue<string>('localidade', Result.City);
    Obj.TryGetValue<string>('uf', Result.State);

  finally
    Obj.Free;
  end;
end;

function TModelAdressInfoViaCEP.GetBrazilianAddressInfo(const AZipCode: string): TEntityAddressInfo;
begin
  if not IsValidZipCode(AZipCode) then
  begin
    Result.ZipCode := EmptyStr;
    Exit;
  end;

  var Cli := TNetHTTPClient.Create(nil);
  try
    var URL := Format('https://viacep.com.br/ws/%s/json/', [AZipCode]);
    var Res := Cli.Get(URL);
    if not Res.StatusCode = 200 then
    begin
      Result.ZipCode := EmptyStr;
      Exit;
    end;

    Result := ParseJsonResponse(Res);

  finally
    Cli.Free;
  end;
end;

end.
