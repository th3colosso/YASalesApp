unit uModel.Users;

interface

uses
  uModel.Base;

type
  TModelUsers = class(TModelBase)
  public
    function CheckLogin(AUsername: string; ATypedPassword: string; var ANeedNewPassword: Boolean): Boolean;
  end;

implementation

uses
  Data.DB,
  uController.Encryption;

{ TModelUsers }

function TModelUsers.CheckLogin(AUsername, ATypedPassword: string; var ANeedNewPassword: Boolean): Boolean;
begin
  FQry.Open('SELECT LOGIN, PASSWORD, ISPASSTEMP FROM USERS WHERE LOGIN = :LOGIN', [AUsername]);
  if FQry.IsEmpty then
    Exit(False);

  Result := TControllerEncryption.CheckPassword(ATypedPassword, FQry.FieldByName('PASSWORD').AsString, ANeedNewPassword);
  ANeedNewPassword := ANeedNewPassword or FQry.FieldByName('ISPASSTEMP').AsBoolean;
end;

end.
