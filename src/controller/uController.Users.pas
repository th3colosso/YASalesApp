unit uController.Users;

interface

uses
  FireDAC.Comp.Client,
  uEntity.User;

type
  TControllerUsers = class
  private
    class procedure UpdatePassword;
  public
    class procedure ShowLoginForm(var ALoggedUserName: string);
    class procedure ShowUsersForm;
    class function CheckLogin(AUsername: string; ATypedPassword: string): Boolean;
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class function Delete(AId: Integer): Boolean;
    class function CheckLoggedUser(ALogin: string): TLoggedUser;
    class function Save(AUser: TEntityUser): Boolean;
  end;

implementation

uses
  Vcl.Forms,
  uModel.Connection,
  uView.Login,
  uModel.Users,
  uView.Users;

{ TControllerLogin }

class function TControllerUsers.CheckLoggedUser(ALogin: string): TLoggedUser;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.CheckLoggedUser(ALogin);
  finally
    UserModel.Free;
  end;
end;

class function TControllerUsers.CheckLogin(AUsername: string; ATypedPassword: string): Boolean;
begin
  var NeedNewPassword: Boolean;
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.CheckLogin(AUsername, ATypedPassword, NeedNewPassword);
    if NeedNewPassword then
      UpdatePassword;
  finally
    UserModel.Free;
  end;
end;

class function TControllerUsers.Delete(AId: Integer): Boolean;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.Delete(AId);
  finally
    UserModel.Free;
  end;
end;

class function TControllerUsers.Load(var AMemTable: TFDMemTable): Boolean;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.Load(AMemTable);
  finally
    UserModel.Free;
  end;
end;

class function TControllerUsers.Save(AUser: TEntityUser): Boolean;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.Save(AUser);
  finally
    UserModel.Free;
  end;
end;

class procedure TControllerUsers.ShowLoginForm(var ALoggedUserName: string);
begin
  var frmLogin := TfrmLogin.Create(Application);
  try
    frmLogin.ShowModal;
    AloggedUserName := frmLogin.edtUsername.Text;
  finally
    frmLogin.Free;
  end;
end;

class procedure TControllerUsers.ShowUsersForm;
begin
  var frmUsers := TfrmUsers.Create(Application);
  try
    frmUsers.ShowModal;
  finally
    frmUsers.Free;
  end;
end;

class procedure TControllerUsers.UpdatePassword;
begin
  //codehere
end;

end.
