unit uEntity.Product;

interface

uses
  System.Classes;

type

  TEntityProduct = class
  private
    FName: string;
    FPrice: Double;
    FImage: TMemoryStream;
    FID: Integer;
    FDescription: string;
    FCreationDate: TDate;
    procedure SetCreationDate(const Value: TDate);
    procedure SetDescription(const Value: string);
    procedure SetID(const Value: Integer);
    procedure SetImage(const Value: TMemoryStream);
    procedure SetName(const Value: string);
    procedure SetPrice(const Value: Double);
  public
    constructor Create;
    destructor Destroy; override;
  public
    property ID: Integer read FID write SetID;
    property Name: string read FName write SetName;
    property Description: string read FDescription write SetDescription;
    property CreationDate: TDate read FCreationDate write SetCreationDate;
    property Price: Double read FPrice write SetPrice;
    property Image: TMemoryStream read FImage write SetImage;
  end;

implementation

uses
  System.SysUtils;

{ TEntityProduct }

constructor TEntityProduct.Create;
begin
  FImage := TMemoryStream.Create;
end;

destructor TEntityProduct.Destroy;
begin
  FreeAndNil(FImage);
  inherited;
end;

procedure TEntityProduct.SetCreationDate(const Value: TDate);
begin
  FCreationDate := Value;
end;

procedure TEntityProduct.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TEntityProduct.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TEntityProduct.SetImage(const Value: TMemoryStream);
begin
  FImage := Value;
end;

procedure TEntityProduct.SetName(const Value: string);
begin
  if Value.Trim.IsEmpty then
    raise Exception.Create('Product name cannot be null');
  FName := Value;
end;

procedure TEntityProduct.SetPrice(const Value: Double);
begin
  if not (Value > 0) then
    raise Exception.Create('Product price must be higher than 0');
  FPrice := Value;
end;

end.
