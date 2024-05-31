unit uView.Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.Base.Registration, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmUsers = class(TfrmBase)
    FMemTableID: TIntegerField;
    FMemTableName: TStringField;
    FMemTableLogin: TStringField;
    FMemTableCreationDate: TDateField;
    edtID: TEdit;
    edtName: TEdit;
    edtLogin: TEdit;
    edtCreationDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    cbNewPassword: TCheckBox;
    cbUsers: TCheckBox;
    cbCustomers: TCheckBox;
    cbProducts: TCheckBox;
    cbOrders: TCheckBox;
    FMemTableIsPassTemp: TBooleanField;
  protected
    procedure ReloadData; override;
    procedure Save; override;
    procedure Delete; override;
    Procedure ConfigEditTabComponents; override;
  private
    procedure GetUsersdata;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

uses
  uController.Users;

{$R *.dfm}

{ TfrmUsers }

procedure TfrmUsers.ConfigEditTabComponents;
begin
  cbNewPassword.Enabled := not FIsInserting;
  if FIsInserting then
  begin
    edtID.Text := '-1';
    cbNewPassword.Checked := True;
  end
  else
    GetUsersData;
end;

procedure TfrmUsers.GetUsersdata;
begin
  edtID.Text := FMemTableID.AsString;
  edtName.Text := FMemTableName.AsString;
  edtLogin.Text := FMemTableLogin.AsString;
  edtCreationDate.Date := FMemTableCreationDate.AsDateTime;
  cbNewPassword.Checked := FMemTableIsPassTemp.AsBoolean;
end;

procedure TfrmUsers.Delete;
begin

end;

procedure TfrmUsers.ReloadData;
begin
  TControllerUsers.Load(FMemTable);
end;

procedure TfrmUsers.Save;
begin

end;

end.
