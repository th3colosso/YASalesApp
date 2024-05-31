unit uModel.Users;

interface

uses
  uModel.Base,
  FireDAC.Comp.Client;

type
  TModelUsers = class(TModelBase)
  public
    function CheckLogin(AUsername: string; ATypedPassword: string; var ANeedNewPassword: Boolean): Boolean;
    function Load(var AMemTable: TFDMemtable): Boolean;
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

function TModelUsers.Load(var AMemTable: TFDMemtable): Boolean;
begin
  try
    AMemTable.EmptyDataSet;
    FQry.Open('SELECT ID, NAME, LOGIN, CREATIONDATE FROM USERS');
    AMemTable.CopyDataSet(FQRy);
    Result := True;
    FQry.Close;
  except
    Result := False;
  end;
end;

end.
