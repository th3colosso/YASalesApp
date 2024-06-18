unit uModel.Users;

interface

uses
  uModel.Base,
  FireDAC.Comp.Client,
  uEntity.User;

type

  TModelUsers = class(TModelBase)
  public
    function CheckLogin(const AUsername: string; const ATypedPassword: string; var ANeedNewPassword: Boolean): Boolean;
    function Load(var AMemTable: TFDMemtable): Boolean;
    function Delete(const AId: Integer): Boolean;
    function GetLoggedUser(const ALogin: string): TLoggedUser;
    function Save(const AUser: TEntityUser): Boolean;
    function SaveNewPassword(const AUsername: string; const APassword: string): Boolean;
  end;

implementation

uses
  Data.DB,
  uController.Encryption;

{ TModelUsers }

function TModelUsers.GetLoggedUser(const ALogin: string): TLoggedUser;
begin
  FQry.Open('SELECT * FROM USERS WHERE LOGIN = :LOGIN', [ALogin]);
  Result.Id := FQry.FieldByName('ID').AsInteger;
  Result.Name := FQry.FieldByName('NAME').AsString;
  Result.HasUserScr := FQry.FieldByName('HASUSERSCR').AsBoolean;
  Result.HasProductScr := FQry.FieldByName('HASPRODUCTSCR').AsBoolean;
  Result.HasCustomerScr := FQry.FieldByName('HASCUSTOMERSCR').AsBoolean;
  Result.HasOrderScr := FQry.FieldByName('HASORDERSCR').AsBoolean;
end;

function TModelUsers.CheckLogin(const AUsername, ATypedPassword: string; var ANeedNewPassword: Boolean): Boolean;
begin
  FQry.Open('SELECT LOGIN, PASSWORD, ISPASSTEMP FROM USERS WHERE LOGIN = :LOGIN', [AUsername]);
  if FQry.IsEmpty then
    Exit(False);

  Result := TControllerEncryption.CheckPassword(ATypedPassword, FQry.FieldByName('PASSWORD').AsString, ANeedNewPassword);
  ANeedNewPassword := ANeedNewPassword or FQry.FieldByName('ISPASSTEMP').AsBoolean;
  FQry.Close;
end;

function TModelUsers.Delete(const AId: Integer): Boolean;
begin
  try
    Result := DeleteByID('USERS', AId);
  except
    Result := False;
  end;
end;

function TModelUsers.Load(var AMemTable: TFDMemtable): Boolean;
begin
  try
    AMemTable.EmptyDataSet;
    FQry.Open('SELECT * FROM USERS');
    AMemTable.CopyDataSet(FQry);
    Result := True;
    FQry.Close;
  except
    Result := False;
  end;
end;

function TModelUsers.Save(const AUser: TEntityUser): Boolean;
const
  DEF_PASSWORD = '123456';
begin
  try
    if AUser.ID > 0 then
      FQry.ExecSQL('UPDATE USERS SET NAME = :NAME, LOGIN = :LOGIN, ISPASSTEMP = :ISPASSTEMP, HASUSERSCR = :HASUSERSCR, HASPRODUCTSCR = :HASPRODUCTSCR, ' +
        'HASCUSTOMERSCR = :HASCUSTOMERSCR, HASORDERSCR = :HASORDERSCR WHERE ID = :ID', [AUser.Name, AUser.Login, AUser.IsPassTemp, AUser.HasUserSrc,
        AUser.HasProducScr, AUser.HasCustomerScr, AUser.HasOrderScr, AUser.ID])
    else
      FQry.ExecSQL('INSERT INTO USERS (NAME, LOGIN, PASSWORD, HASUSERSCR, HASPRODUCTSCR, HASCUSTOMERSCR, HASORDERSCR) VALUES (:NAME, :LOGIN,' +
        ' :PASSWORD, :HASUSERSCR, :HASPRODUCTSCR, :HASCUSTOMERSCR, :HASORDERSCR)', [AUser.Name, AUser.Login, TControllerEncryption.HashPassword(DEF_PASSWORD),
        AUser.HasUserSrc, AUser.HasProducScr, AUser.HasCustomerScr, AUser.HasOrderScr]);
    Result := True;
  except
    Result := False;
  end;
end;

function TModelUsers.SaveNewPassword(const AUsername: string; const APassword: string): Boolean;
begin
  try
    Result := FQry.ExecSQL('UPDATE USERS SET PASSWORD = :PASSWORD, ISPASSTEMP = :ISPASSTEMP ' +
      ' WHERE LOGIN = :LOGIN', [TControllerEncryption.HashPassword(APassword), False, AUsername]) > 0;
  except
    Result := False;
  end;
end;

end.
