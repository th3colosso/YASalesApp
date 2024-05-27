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
    procedure FormShow(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
  private
    procedure ResetFocus;
    procedure OpenProductsForm;
    procedure OpenCustomersForm;
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

uses
  uUtils.DmImages,
  uController.Products;

{$R *.dfm}

procedure TfrmHome.btnCustomersClick(Sender: TObject);
begin
  OpenCustomersForm;
end;

procedure TfrmHome.btnProductsClick(Sender: TObject);
begin
  OpenProductsForm;
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
