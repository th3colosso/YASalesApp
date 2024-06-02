unit uModel.Base;

interface

uses
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.Comp.DataSet;

type
  TModelBase = class(TInterfacedObject)
  private
    procedure CheckConnect(DataSet: TDataSet); overload;
    procedure CheckDisconnect(DataSet: TDataSet); overload;
    procedure CheckConnect(DataSet: TFDDataSet); overload;
    procedure CheckDisconnect(DataSet: TFDDataSet); overload;
    procedure Connect(AComponent: TComponent);
    procedure Disconnect(AComponent: TComponent);
  protected
    FConn: TFDConnection;
    FQry: TFDQuery;
    FSQL: string;
  public
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
  end;

implementation

{ TModelBase }

procedure TModelBase.CheckConnect(DataSet: TDataSet);
begin
  Connect(DataSet);
end;

procedure TModelBase.CheckConnect(DataSet: TFDDataSet);
begin
  Connect(DataSet);
end;

procedure TModelBase.CheckDisconnect(DataSet: TDataSet);
begin
  Disconnect(DataSet);
end;

procedure TModelBase.CheckDisconnect(DataSet: TFDDataSet);
begin
  Disconnect(DataSet);
end;

procedure TModelBase.Connect(AComponent: TComponent);
begin
  if not TFDQuery(AComponent).Connection.Connected then
    TFDQuery(AComponent).Connection.Connected := True;
end;

procedure TModelBase.Disconnect(AComponent: TComponent);
begin
  TFDQuery(AComponent).Connection.Connected := False;
end;

constructor TModelBase.Create(AOwner: TComponent);
begin
  if not (AOwner is TFDConnection) then
    raise Exception.Create(Format('Owner of [%s] must be an TFDConnection(dmConnection)', [Self.ClassName]));

  FConn := (AOwner as TFDConnection);
  FQry := TFDQuery.Create(FCOnn);
  FQry.Connection := FConn;

  FQry.BeforeOpen := CheckConnect;
  FQry.AfterClose := CheckDisconnect;

  FQry.BeforeExecute := CheckConnect;
  FQry.AfterExecute := CheckDisconnect;
end;

destructor TModelBase.Destroy;
begin
  FreeAndNil(FQry);
  inherited;
end;

end.
