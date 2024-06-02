unit uView.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, uUtils.Interceptor.TEdit;

type
  TfrmLogin = class(TForm)
    pnlContainer: TPanel;
    pnlMain: TPanel;
    rectLine: TShape;
    pnlData: TPanel;
    lblWelcome: TLabel;
    lblTitle: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    lblUsername: TLabel;
    lblPassword: TLabel;
    btnLogin: TButton;
    btnCancel: TButton;
    pnlImg: TPanel;
    imgAppLogo: TImage;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    procedure Terminate;
    procedure TryLogin;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uController.Users;

{$R *.dfm}

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  TryLogin;
end;

procedure TfrmLogin.Terminate;
begin
  Application.Terminate;
end;

procedure TfrmLogin.TryLogin;
begin
  if TControllerUsers.CheckLogin(edtUsername.Text, edtPassword.Text) then
    Close
  else
    Application.MessageBox('Invalid credentials', 'Error', MB_ICONERROR + MB_OK);
end;

end.
