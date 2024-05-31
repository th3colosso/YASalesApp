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
  Vcl.ExtCtrls;

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
    procedure FormCreate(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
  private
    procedure ResetFocus;
    procedure OpenProductsForm;
    procedure OpenCustomersForm;
    procedure OpenUsersForm;
  public
    { Public declarations }
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
  TControllerUsers.ShowUsersForm;
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  TControllerUsers.ShowLoginForm;
end;

procedure TfrmHome.FormShow(Sender: TObject);
begin
  ResetFocus;
end;

procedure TfrmHome.OpenCustomersForm;
begin
  ResetFocus;
end;

procedure TfrmHome.OpenProductsForm;
begin
  TControllerProducts.ShowRegistrationForm;
end;

procedure TfrmHome.ResetFocus;
begin
  if pnlMain.CanFocus then
    pnlMain.SetFocus;
end;

end.
