unit uView.Home;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uEntity.User;

type
  TfrmHome = class(TForm)
    pnlMain: TPanel;
    btnProducts: TButton;
    btnCustomers: TButton;
    btnSales: TButton;
    btnUsers: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FLoggedUser: TLoggedUser;
    procedure ResetFocus;
    procedure OpenProductsForm;
    procedure OpenCustomersForm;
    procedure OpenUsersForm;
    procedure DoLogin;
  public
    property LoggedUser: TLoggedUser read FLoggedUser;
  end;

var
  frmHome: TfrmHome;

implementation

uses
  uUtils.DmImages,
  uController.Products,
  uController.Users;

{$R *.dfm}

procedure TfrmHome.btnCustomersClick(Sender: TObject);
begin
  OpenCustomersForm;
end;

procedure TfrmHome.btnProductsClick(Sender: TObject);
begin
  OpenProductsForm;
end;

procedure TfrmHome.btnUsersClick(Sender: TObject);
begin
  OpenUsersForm;
end;

procedure TfrmHome.OpenUsersForm;
begin
  if not LoggedUser.HasUserScr then
    raise Exception.Create('Unauthorized');
  TControllerUsers.ShowUsersForm;
end;

procedure TfrmHome.DoLogin;
begin
  var LoggedUserName: string;
  TControllerUsers.ShowLoginForm(LoggedUserName);

  FLoggedUser := TControllerUsers.GetLoggedUser(LoggedUserName);
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  DoLogin;
end;

procedure TfrmHome.FormShow(Sender: TObject);
begin
  ResetFocus;
end;

procedure TfrmHome.OpenCustomersForm;
begin
  if not LoggedUser.HasProductScr then
    raise Exception.Create('Unauthorized');
  ResetFocus;
end;

procedure TfrmHome.OpenProductsForm;
begin
  if not LoggedUser.HasProductScr then
    raise Exception.Create('Unauthorized');
  TControllerProducts.ShowRegistrationForm;
end;

procedure TfrmHome.ResetFocus;
begin
  if pnlMain.CanFocus then
    pnlMain.SetFocus;
end;

end.
