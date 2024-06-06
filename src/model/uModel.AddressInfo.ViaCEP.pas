unit uModel.AddressInfo.ViaCEP;

interface

uses
  uEntity.AddressInfo,
  Net.HttpClient,
  Net.HttpClientComponent;

type
  TModelAdressInfoViaCEP = class
  private
    function IsValidZipCode(AZipCode: string): Boolean;
    function ParseJsonResponse(ARes: IHTTPResponse): TEntityAddressInfo;
  public
    function GetBrazilianAddressInfo(AZipCode: string): TEntityAddressInfo;
  end;

implementation

uses
  System.SysUtils,
  System.Json;

{ TModelAdressInfoViaCEP }

function TModelAdressInfoViaCEP.IsValidZipCode(AZipCode: string): Boolean;
begin
  Result := AZipCode.Length = 8;
end;

function TModelAdressInfoViaCEP.ParseJsonResponse(ARes: IHTTPResponse): TEntityAddressInfo;
begin
  var Obj := TJSONObject.ParseJSONValue(ARes.ContentAsString());
  var value: string;
  try
    if Obj.TryGetValue<string>('erro', value) then
    begin
      Result.ZipCode := EmptyStr;
      Abort;
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

function TModelAdressInfoViaCEP.GetBrazilianAddressInfo(AZipCode: string): TEntityAddressInfo;
begin
  if not IsValidZipCode(AZipCode) then
  begin
    Result.ZipCode := EmptyStr;
    Abort;
  end;

  var Cli := TNetHTTPClient.Create(nil);
  try
    var URL := Format('https://viacep.com.br/ws/%s/json/', [AZipCode]);
    var Res := Cli.Get(URL);
    if not Res.StatusCode = 200 then
    begin
      Result.ZipCode := EmptyStr;
      Abort;
    end;

    Result := ParseJsonResponse(Res);

  finally
    Cli.Free;
  end;
end;

end.
