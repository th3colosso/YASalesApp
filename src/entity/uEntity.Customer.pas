unit uEntity.Customer;

interface

type

  TEntityCustomer = class
  private
    FId: Integer;
    FFirstName: string;
    FLastName: string;
    FEmail: string;
    FDateOfBirth: TDate;
    FZipCode: integer;
    FStreet: string;
    FNeighbourhood: string;
    FHouseNo: Integer;
    FState: string;
    FCity: string;
    FRegistrationDate: string;
    procedure SetFirstName(const Value: string);
    procedure SetLastName(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetDateOfBirth(const Value: TDate);
  public
    property Id: Integer read FId write FId;
    property FirstName: string read FFirstName write SetFirstName;
    property LastName: string read FLastName write SetLastName;
    property Email: string read FEmail write SetEmail;
    property DateOfBirth: TDate read FDateOfBirth write SetDateOfBirth;
    property ZipCode: integer read FZipCode write FZipCode;
    property Street: string read FStreet write FStreet;
    property Neighbourhood: string read FNeighbourhood write FNeighbourhood;
    property HouseNo: Integer read FHouseNo write FHouseNo;
    property State: string read FState write FState;
    property City: string read FCity write FCity;
    property RegistrationDate: string read FRegistrationDate write FRegistrationDate;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

{ TEntityCustomer }

procedure TEntityCustomer.SetDateOfBirth(const Value: TDate);
begin  
  if Value = 0 then
    raise Exception.Create('Date of Birth can not be null');
  FDateOfBirth := Value;
end;

procedure TEntityCustomer.SetEmail(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Email can not be null');
  FEmail := Value;
end;

procedure TEntityCustomer.SetFirstName(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('First name can not be null');
  FFirstName := Value;
end;

procedure TEntityCustomer.SetLastName(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Last name can not be null');
  FLastName := Value;
end;

end.
