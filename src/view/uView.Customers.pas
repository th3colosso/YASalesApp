unit uView.Customers;

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
  uView.Base.Registration,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  uEntity.AddressInfo,
  uUtils.Interceptor.TEdit;

type
  TfrmCustomers = class(TfrmBaseReg)
    edtID: TEdit;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    dtpCreationDate: TDateTimePicker;
    dtpDateOfBirth: TDateTimePicker;
    edtEmail: TEdit;
    edtZipCode: TEdit;
    edtStreet: TEdit;
    edtHouseNo: TEdit;
    edtNeighbourhood: TEdit;
    edtCity: TEdit;
    edtState: TEdit;
    btnSearch: TButton;
    lblId: TLabel;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblDateOfBirth: TLabel;
    lblEmail: TLabel;
    lblCreationDate: TLabel;
    lblZipCode: TLabel;
    lblStreet: TLabel;
    lblHouseNo: TLabel;
    lblNeighbourhood: TLabel;
    lblCity: TLabel;
    lblState: TLabel;
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
    FMemTableCreationDate: TDateField;
    procedure btnSearchClick(Sender: TObject);
  protected
    procedure ReloadData; override;
    procedure ConfigEditTabComponents; override;
    procedure Save; override;
    procedure Delete; override;
  private
    procedure GetCustomerData;
    procedure SearchAddressInfo;
    procedure FillAddressInfoEdits(AAddressInfo: TEntityAddressInfo);
  end;

var
  frmCustomers: TfrmCustomers;

implementation

uses
  uEntity.Customer,
  uController.Customers,
  uController.Address,
  uUtils.Dialogs;

{$R *.dfm}

{ TfrmCustomers }

procedure TfrmCustomers.btnSearchClick(Sender: TObject);
begin
  inherited;
  SearchAddressInfo;
end;

procedure TfrmCustomers.SearchAddressInfo;
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  if Trim(edtZipCode.Text).Length <> 8 then
  begin
    TUtilsDialogs.Error('Not a valid brazilian zip code');
    Exit;
  end;
  var AddressInfo: TEntityAddressInfo;

  AddressInfo := TControllerAddress.GetBrazilianAddressInfo(Trim(edtZipCode.Text));

  if AddressInfo.ZipCode.Trim.IsEmpty then
  begin
    TUtilsDialogs.Error('Problem found while searching for address info');
    Exit;
  end;

  FillAddressInfoEdits(AddressInfo);
  Screen.Cursor := crDefault;
end;

procedure TfrmCustomers.FillAddressInfoEdits(AAddressInfo: TEntityAddressInfo);
begin
  edtStreet.Text := AAddressInfo.Street;
  edtNeighbourhood.Text := AAddressInfo.Neighbourhood;
  edtCity.Text := AAddressInfo.City;
  edtState.Text := AAddressInfo.State;
end;

procedure TfrmCustomers.ConfigEditTabComponents;
begin
  inherited;
  if FIsInserting then
  begin
    edtID.Text := '-1';
    dtpCreationDate.Date := Now;
  end
  else
    GetCustomerData;
end;

procedure TfrmCustomers.Delete;
begin
  inherited;
  var Msg := Format('Are you sure you want to delete the following customer? %s%s [ %d - %s %s ]',
    [SLineBreak, sLineBreak, FMemTableID.AsInteger, FMemTableFirstName.AsString.Trim, FMemTableLastName.AsString.Trim]);

  if TUtilsDialogs.Warning(Msg, MB_YESNO) = mrYes then
    if not TControllerCustomers.Delete(FMemTableID.AsInteger) then
      TUtilsDialogs.Error('Problem found while deleting customer');
end;

procedure TfrmCustomers.GetCustomerData;
begin
  edtId.Text := FMemTableID.AsString;
  edtFirstName.Text := FMemTableFirstName.AsString;
  edtLastName.Text := FMemTableLastName.AsString;
  edtEmail.Text := FMemTableEmail.AsString;
  dtpDateOfBirth.Date := FMemTableDateOfBirth.AsDateTime;
  dtpCreationDate.Date := FMemTableCreationDate.AsDateTime;

  //Address
  edtZipCode.Text := FMemTableZipCode.AsString;
  edtStreet.Text := FMemTableStreet.AsString;
  edtHouseNo.Text := FMemTableHouseNo.AsString;
  edtNeighbourhood.Text := FMemTableNeighbourhood.AsString;
  edtCity.Text := FMemTableCity.AsString;
  edtState.Text := FMemTableState.AsString;
end;

procedure TfrmCustomers.ReloadData;
begin
  inherited;
  if not TControllerCustomers.Load(FMemTable) then
    TUtilsDialogs.Error('Problem found while loading data');
end;

procedure TfrmCustomers.Save;
begin
  inherited;
  var Customer := TEntityCustomer.Create;
  try
    Customer.Id := StrToInt(edtID.Text);
    Customer.FirstName := edtFirstName.Text;
    Customer.LastName := edtLastName.Text;
    Customer.Email := edtEmail.Text;
    Customer.DateOfBirth := dtpDateOfBirth.Date;

    //Address
    var Int: Integer;
    TryStrToInt(edtZipCode.Text, Int);
    Customer.ZipCode := Int;
    Customer.Street := edtStreet.Text;
    TryStrToInt(edtHouseNo.Text, Int);
    Customer.HouseNo := Int;
    Customer.Neighbourhood := edtNeighbourhood.Text;
    Customer.City := edtCity.Text;
    Customer.State := edtState.Text;

    if not TControllerCustomers.Save(Customer) then
      TUtilsDialogs.Error('Problem found while saving customer');
  finally
    Customer.Free;
  end;
end;

end.
