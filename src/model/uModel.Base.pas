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
    procedure Connect(const AComponent: TComponent);
    procedure Disconnect(const AComponent: TComponent);
  protected
    FConn: TFDConnection;
    FQry: TFDQuery;
    FSQL: string;
    function DeleteByID(const ATable: string; const AId: Integer): Boolean;
    procedure Log(const Sender: TObject; const E: Exception);
  public
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
  end;

implementation

uses
  uUtils.Logger.Exceptions;

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

procedure TModelBase.Connect(const AComponent: TComponent);
begin
  if not TFDQuery(AComponent).Connection.Connected then
    TFDQuery(AComponent).Connection.Connected := True;
end;

procedure TModelBase.Disconnect(const AComponent: TComponent);
begin
  TFDQuery(AComponent).Connection.Connected := False;
end;

procedure TModelBase.Log(const Sender: TObject; const E: Exception);
begin
  TExceptionLogger.Log(Sender, E);
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

function TModelBase.DeleteByID(const ATable: string; const AId: Integer): Boolean;
begin
  FSQL := Format('DELETE FROM %s WHERE ID = %d', [ATable.ToUpper, AId]);
  Result := FQry.ExecSQL(FSQL) > 0;
end;

destructor TModelBase.Destroy;
begin
  FreeAndNil(FQry);
  inherited;
end;

end.
