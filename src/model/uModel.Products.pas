unit uModel.Products;

interface

uses
  uModel.Base,
  Data.DB,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Comp.Client,
  System.SysUtils;

type
  TModelProducts = class(TModelBase)
  private
    function ExecSelectAndCopy(ASQL: string; var ADest: TFDMemTable): Boolean;
  public
    function Load(var AMemTable: TFDMemTable): Boolean; overload;
    function Load(var AMemTable: TFDMemTable; AId: Integer): Boolean; overload;
  end;

implementation

{ TModelProducts }

function TModelProducts.ExecSelectAndCopy(ASQL: string; var ADest: TFDMemTable): Boolean;
begin
  try
    FQry.Open(ASQL);
    ADest.EmptyDataSet;
    ADest.CopyDataSet(FQry);
    Result := True;
  except
    Result := False;
  end;
end;

function TModelProducts.Load(var AMemTable: TFDMemTable; AId: Integer): Boolean;
begin
  FSQL := Format('SELECT * FROM PRODUCTS WHERE ID = %d', [AId]);
  Result := ExecSelectAndCopy(FSQL, AMemTable);
end;

function TModelProducts.Load(var AMemTable: TFDMemTable): Boolean;
begin
  FSQL := 'SELECT * FROM PRODUCTS';
  Result := ExecSelectAndCopy(FSQL, AMemTable);
end;

end.
