unit uView.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.Base.Registration, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmCustomers = class(TfrmBaseReg)
    edtID: TEdit;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    dtpCreationDate: TDateTimePicker;
    dtpBirthday: TDateTimePicker;
    edtEmail: TEdit;
    edtZipCode: TEdit;
    edtStreet: TEdit;
    edtHouseNo: TEdit;
    edtNeighbourhood: TEdit;
    edtCity: TEdit;
    edtState: TEdit;
    btnSearch: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    FMemTableID: TIntegerField;
    FMemTableFirstName: TStringField;
    FMemTableLastName: TStringField;
    FMemTableEmail: TStringField;
    FMemTableDateOfBirth: TDateField;
    FMemTableZipCode: TIntegerField;
    FMemTableStreet: TStringField;
    FMemTableNeighbourhood: TStringField;
    FMemTableHouseNo: TIntegerField;
    FMemTableState: TStringField;
    FMemTableCity: TStringField;
  protected
    procedure ReloadData; override;
    procedure ConfigEditTabComponents; override;
    procedure Save; override;
    procedure Delete; override;
  private
    procedure GetCustomerData;
  public
    { Public declarations }
  end;

var
  frmCustomers: TfrmCustomers;

implementation

uses
  uEntity.Customer;

{$R *.dfm}

{ TfrmCustomers }

procedure TfrmCustomers.ConfigEditTabComponents;
begin
  inherited;
  if FIsInserting then
    edtID.Text := '-1'
  else
    GetCustomerData;
end;

procedure TfrmCustomers.Delete;
begin
  inherited;
  var Msg := Format('Are you sure you want to delete the following customer? %s%s [ %d - %s ]',
    [SLineBreak, sLineBreak, '', '']);
  if Application.MessageBox(PChar(Msg), 'WARNING', MB_YESNO + MB_ICONWARNING) = mrYes then
    if not True then
      Application.MessageBox(Pchar('Problem found while deleting deleting item'), 'Error', MB_OK + MB_ICONERROR);
end;

procedure TfrmCustomers.GetCustomerData;
begin
  //Getting data from Fmemtable
end;

procedure TfrmCustomers.ReloadData;
begin
  inherited;
  Sleep(10);
end;

procedure TfrmCustomers.Save;
begin
  inherited;
  var Customer := TEntityCustomer.Create;
  try
    //saving to database;
  finally
    Customer.Free;
  end;
end;

end.
