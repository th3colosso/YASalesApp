unit uView.NewPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uUtils.Interceptor.TEdit;

type
  TfrmNewPassword = class(TForm)
    pnlMain: TPanel;
    pnlTitle: TPanel;
    pnlData: TPanel;
    edtPassword: TEdit;
    edtPasswordCopy: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    lblNewPassword: TLabel;
    lblConfirm: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FUsername: string;
    procedure HideLoginForm;
    procedure ResetFocus;
    procedure CheckPasswords;
    procedure SaveNewPassword;
  public
    property Username: string read FUsername write FUsername;
  end;

var
  frmNewPassword: TfrmNewPassword;

implementation

uses
  uController.Users;

{$R *.dfm}

procedure TfrmNewPassword.btnCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmNewPassword.btnSaveClick(Sender: TObject);
begin
  SaveNewPassword;
end;

procedure TfrmNewPassword.CheckPasswords;
begin
  if not string.Equals(edtPassword.Text, edtPasswordCopy.Text) then
  begin
    ResetFocus;
    raise Exception.Create('Passwords do not match');
  end;
end;

procedure TfrmNewPassword.FormShow(Sender: TObject);
begin
  HideLoginForm;
  ResetFocus;
end;

procedure TfrmNewPassword.HideLoginForm;
begin
  var frm := Application.FindComponent('frmLogin');
  if Assigned(frm) then
    (frm as TForm).Hide;
end;

procedure TfrmNewPassword.ResetFocus;
begin
  if edtPassword.CanFocus then
    edtPassword.SetFocus;
end;

procedure TfrmNewPassword.SaveNewPassword;
begin
  CheckPasswords;
  if not TControllerUsers.SaveNewPassword(FUsername, edtPassword.Text) then
    raise Exception.Create('Problem found while update password');
  Close;
end;

end.
