unit uController.Users;

interface

uses
  FireDAC.Comp.Client;

type
  TControllerUsers = class
  private
    class procedure UpdatePassword;
  public
    class procedure ShowLoginForm;
    class procedure ShowUsersForm;
    class function CheckLogin(AUsername: string; ATypedPassword: string): Boolean;
    class function Load(var AMemTable: TFDMemTable): Boolean;
  end;

implementation

uses
  Vcl.Forms,
  uModel.Connection,
  uView.Login,
  uModel.Users,
  uView.Users;

{ TControllerLogin }

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

class function TControllerUsers.Load(var AMemTable: TFDMemTable): Boolean;
begin
  var UserModel := TModelUsers.Create(dmConnection.Conn);
  try
    Result := UserModel.Load(AMemTable);
  finally
    UserModel.Free;
  end;
end;

class procedure TControllerUsers.ShowLoginForm;
begin
  var frmLogin := TfrmLogin.Create(Application);
  try
    frmLogin.ShowModal;
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
