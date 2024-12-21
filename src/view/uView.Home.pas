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
  uEntity.User,
  Vcl.WinXCtrls,
  Vcl.FormTabsBar;

type
  TfrmHome = class(TForm)
    pnlMain: TPanel;
    frmTabBar: TFormTabsBar;
    svMenu: TSplitView;
    btnMenu: TButton;
    btnUsers: TButton;
    btnProducts: TButton;
    btnCustomers: TButton;
    btnSales: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnUsersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure svMenuClosing(Sender: TObject);
    procedure svMenuOpening(Sender: TObject);
    procedure btnSalesClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frmTabBarAcceptForm(AForm: TForm; var AAccept: Boolean);
  private
    FLoggedUser: TLoggedUser;
    procedure ResetFocus;
    procedure OpenProductsForm;
    procedure OpenCustomersForm;
    procedure OpenUsersForm;
    procedure ChangeSideMenuState(const AOpen: Boolean = True);
    procedure DoLogin;
    procedure ResetMenuSettings;
  public
    property LoggedUser: TLoggedUser read FLoggedUser;
  end;

var
  frmHome: TfrmHome;

implementation

uses
  uUtils.DmImages,
  uController.Products,
  uController.Users,
  uController.Customers,
  uUtils.Dialogs;

{$R *.dfm}

procedure TfrmHome.btnCustomersClick(Sender: TObject);
begin
  OpenCustomersForm;
end;

procedure TfrmHome.btnMenuClick(Sender: TObject);
begin
  ChangeSideMenuState(not svMenu.Opened);
end;

procedure TfrmHome.btnProductsClick(Sender: TObject);
begin
  OpenProductsForm;
end;

procedure TfrmHome.btnSalesClick(Sender: TObject);
begin
  //open sales form
end;

procedure TfrmHome.btnUsersClick(Sender: TObject);
begin
  OpenUsersForm;
end;

procedure TfrmHome.ChangeSideMenuState(const AOpen: Boolean);
begin
  svMenu.Opened := AOpen;
end;

procedure TfrmHome.OpenUsersForm;
begin
  if not LoggedUser.HasUserScr then
  begin
    TUtilsDialogs.Error('Unauthorized');
    Exit;
  end;
  TControllerUsers.ShowUsersForm(pnlMain);
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

procedure TfrmHome.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    ChangeSideMenuState(not svMenu.Opened);
end;

procedure TfrmHome.FormShow(Sender: TObject);
begin
  ResetFocus;
  ResetMenuSettings;
end;

procedure TfrmHome.frmTabBarAcceptForm(AForm: TForm; var AAccept: Boolean);
begin
  ChangeSideMenuState(False);
end;

procedure TfrmHome.OpenCustomersForm;
begin
  if not LoggedUser.HasCustomerScr then
  begin
    TUtilsDialogs.Error('Unauthorized');
    Exit;
  end;
  TControllerCustomers.ShowCustomersForm(pnlMain);
end;

procedure TfrmHome.OpenProductsForm;
begin
  if not LoggedUser.HasProductScr then
  begin
    TUtilsDialogs.Error('Unauthorized');
    Exit;
  end;
  TControllerProducts.ShowProductsForm(pnlMain);
end;

procedure TfrmHome.ResetFocus;
begin
  if pnlMain.CanFocus then
    pnlMain.SetFocus;
end;

procedure TfrmHome.ResetMenuSettings;
begin
  svMenu.Opened := False;
  svMenu.DisplayMode := TSplitViewDisplayMode.svmOverlay;
end;

procedure TfrmHome.svMenuClosing(Sender: TObject);
begin
  for var i := 0 to Pred(svMenu.ControlCount) do
  begin
    var Control := svMenu.Controls[i];
    if Control is TButton then
    begin
      var Button := (Control as TButton);
      Button.Hint := Button.Caption;
      Button.Caption := EmptyStr;
      Button.ImageAlignment := TImageAlignment.iaCenter;
    end;
  end;
end;

procedure TfrmHome.svMenuOpening(Sender: TObject);
begin
  for var i := 0 to Pred(svMenu.ControlCount) do
  begin
    var Control := svMenu.Controls[i];
    if Control is TButton then
    begin
      var Button := (Control as TButton);
      Button.Caption := Button.Hint;
      Button.Hint := EmptyStr;
      if not Trim(Button.Caption).IsEmpty then
        Button.ImageAlignment := TImageAlignment.iaRight;
    end;
  end;
end;

end.
