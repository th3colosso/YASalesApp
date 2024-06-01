unit uEntity.User;

interface

type

  TLoggedUser = record
    Id: Integer;
    Name: string;
    HasUserScr: Boolean;
    HasProductScr: Boolean;
    HasCustomerScr: Boolean;
    HasOrderScr: Boolean;
  end;

  TEntityUser = class
  private
    FID: Integer;
    FName: string;
    FLogin: string;
    FIsPassTemp: Boolean;
    FCreationDate: TDate;
    FHasUserScr: Boolean;
    FHasProductScr: Boolean;
    FHasCustomerScr: Boolean;
    FHasOrderScr: Boolean;
    FPassword: string;
    procedure SetLogin(const Value: string);
    procedure SetName(const Value: string);
    procedure SetPassword(const Value: string);
  public
    property ID: Integer read FID write FID;
    property Name: string read FName write SetName;
    property Login: string read FLogin write SetLogin;
    property Password: string read FPassword write SetPassword;
    property IsPassTemp: Boolean read FIsPassTemp write FIsPassTemp default True;
    property CreationDate: TDate read FCreationDate write FCreationDate;
    property HasUserSrc: Boolean read FHasUserScr write FHasUserScr;
    property HasProducScr: Boolean read FHasProductScr write FHasProductScr;
    property HasCustomerScr: Boolean read FHasCustomerScr write FHasCustomerScr;
    property HasOrderScr: Boolean read FHasOrderScr write FHasOrderScr;
  end;

implementation

uses
  System.SysUtils;

{ TEntityUser }

procedure TEntityUser.SetLogin(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Login can not be null');
  FLogin := Value;
end;

procedure TEntityUser.SetName(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Name can not be null');
  FName := Value;
end;

procedure TEntityUser.SetPassword(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Password can not be null');
  FPassword := Value;
end;

end.
