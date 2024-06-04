unit uView.Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.Base.Registration, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmUsers = class(TfrmBaseReg)
    FMemTableID: TIntegerField;
    FMemTableName: TStringField;
    FMemTableLogin: TStringField;
    FMemTableCreationDate: TDateField;
    edtID: TEdit;
    edtName: TEdit;
    edtLogin: TEdit;
    dtpCreationDate: TDateTimePicker;
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
    FMemTableHasUserScr: TBooleanField;
    FMemTableHasProductScr: TBooleanField;
    FMemTableHasCustomerScr: TBooleanField;
    FMemTableHasOrderScr: TBooleanField;
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
  uController.Users,
  uEntity.User;

{$R *.dfm}

{ TfrmUsers }

procedure TfrmUsers.ConfigEditTabComponents;
begin
  cbNewPassword.Enabled := not FIsInserting;
  if FIsInserting then
  begin
    ClearData(pnlData);
    edtID.Text := '-1';
    cbNewPassword.Checked := True;
    dtpCreationDate.Date := Now;
  end
  else
    GetUsersData;
end;

procedure TfrmUsers.GetUsersdata;
begin
  edtID.Text := FMemTableID.AsString;
  edtName.Text := FMemTableName.AsString;
  edtLogin.Text := FMemTableLogin.AsString;
  dtpCreationDate.Date := FMemTableCreationDate.AsDateTime;

  //Options
  cbNewPassword.Checked := FMemTableIsPassTemp.AsBoolean;
  cbUsers.Checked := FMemTableHasUserScr.AsBoolean;
  cbProducts.Checked := FMemTableHasProductScr.AsBoolean;
  cbCustomers.Checked := FMemTableHasCustomerScr.AsBoolean;
  //cbOrders.Checked := FMemTableHasOrderScr.AsBoolean;
end;

procedure TfrmUsers.Delete;
begin
  var Msg := Format('Are you sure you want to delete the following user? %s%s [ %d - %s ]',
    [SLineBreak, sLineBreak, FMemTableID.AsInteger, FMemTableName.AsString]);
  if Application.MessageBox(PChar(Msg), 'WARNING', MB_YESNO + MB_ICONWARNING) = mrYes then
    if not TControllerUsers.Delete(FMemTableID.AsInteger) then
      Application.MessageBox(Pchar('Problem found while deleting deleting user'), 'Error', MB_OK + MB_ICONERROR);
end;

procedure TfrmUsers.ReloadData;
begin
  if not TControllerUsers.Load(FMemTable) then
    Application.MessageBox(PChar('Problem found while loading data'), 'Error', MB_OK + MB_ICONERROR);
end;

procedure TfrmUsers.Save;
begin
  var User := TEntityUser.Create;
  try
    User.ID := StrToInt(edtID.Text);
    User.Name := edtName.Text;
    User.Login := edtLogin.Text;
    User.IsPassTemp := cbNewPassword.Checked;
    User.HasUserSrc := cbUsers.Checked;
    User.HasProducScr := cbProducts.Checked;
    User.HasCustomerScr := cbCustomers.Checked;
    User.HasOrderScr := cbOrders.Checked;
    TControllerUsers.Save(User);
  finally
    User.Free;
  end;
end;

end.
