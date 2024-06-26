unit uController.Users;

interface

uses
  FireDAC.Comp.Client,
  uEntity.User;

type
  TControllerUsers = class
  private
    class procedure UpdatePassword(const AUsername: string);
    class procedure ShowMainForm;
  public
    class procedure ShowLoginForm(var ALoggedUserName: string);
    class procedure ShowUsersForm;
    class function CheckLogin(const AUsername: string; const ATypedPassword: string): Boolean;
    class function Load(var AMemTable: TFDMemTable): Boolean;
    class function Delete(const AId: Integer): Boolean;
    class function GetLoggedUser(const ALogin: string): TLoggedUser;
    class function Save(const AUser: TEntityUser): Boolean;
    class function SaveNewPassword(const AUsername: string; const APassword: string): Boolean;
  end;

implementation

uses
  Vcl.Forms,
  Dialogs,
  uModel.Connection,
  uView.Login,
  uModel.Users,
  uView.Users,
  uView.NewPassword;

{ TControllerLogin }

class function TControllerUsers.GetLoggedUser(const ALogin: string): TLoggedUser;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.GetLoggedUser(ALogin);
  finally
    UserModel.Free;
  end;
end;

class function TControllerUsers.CheckLogin(const AUsername: string; const ATypedPassword: string): Boolean;
begin
  Result := False;
  var NeedNewPassword := False;
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.CheckLogin(AUsername, ATypedPassword, NeedNewPassword);
    if NeedNewPassword then
      UpdatePassword(AUsername);
  finally
    UserModel.Free;
    if Result then
      ShowMainForm;
  end;
end;

class function TControllerUsers.Delete(const AId: Integer): Boolean;
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

class function TControllerUsers.Save(const AUser: TEntityUser): Boolean;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.Save(AUser);
  finally
    UserModel.Free;
  end;
end;

class function TControllerUsers.SaveNewPassword(const AUsername, APassword: string): Boolean;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.SaveNewPassword(AUsername, APassword);
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

class procedure TControllerUsers.ShowMainForm;
begin
  var frm := Application.FindComponent('frmHome');
  if Assigned(frm) then
  begin
    if not (frm as TForm).Visible then
      (frm as TForm).Show;
    (frm as TForm).BringToFront;
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

class procedure TControllerUsers.UpdatePassword(const AUsername: string);
begin
  var frmNewPassword := TfrmNewPassword.Create(Application);
  try
    frmNewPassword.Username := AUsername;
    frmNewPassword.ShowModal;
  finally
    frmNewPassword.Free;
  end;
end;

end.
