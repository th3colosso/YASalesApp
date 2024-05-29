unit uController.Users;

interface

type
  TControllerUsers = class
  private
    class procedure UpdatePassword;
  public
    class procedure ShowLoginForm;
    class function CheckLogin(AUsername: string; ATypedPassword: string): Boolean;
  end;

implementation

uses
  Vcl.Forms,
  uModel.Connection,
  uView.Login,
  uModel.Users;

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

class procedure TControllerUsers.ShowLoginForm;
begin
  var frmLogin := TfrmLogin.Create(Application);
  try
    frmLogin.ShowModal;
  finally
    frmLogin.Free;
  end;
end;

class procedure TControllerUsers.UpdatePassword;
begin
  //codehere
end;

end.
