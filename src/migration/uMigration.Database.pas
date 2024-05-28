unit uMigration.Database;

interface

uses
  uModel.Base;

type
  TMigrationDatabase = class(TModelBase)
  private
    function IsDBEmpty: Boolean;
    procedure DropAllTables;
    procedure InitProductsTable;
    function GetLastRunID: Integer;
    procedure InitStatsTable;
    procedure UpdateLastRunID(ARun: Integer);
  public
    procedure RunDBInit;
  end;

implementation

uses
  FireDAC.Comp.Client,
  System.SysUtils;

{ TMigrationDatabase }

procedure TMigrationDatabase.DropAllTables;
begin
  var LQry := TFDQuery.Create(FQry.Owner);
  LQry.Connection := FQry.Connection;
  try
    FQry.Open('SELECT NAME FROM SQLITE_MASTER WHERE UPPER(TYPE) = :TYPE AND UPPER(NAME) NOT LIKE :NAME AND UPPER(NAME) <> :TABLE',
      ['TABLE', '%SQLITE_%', 'STATS']);
    while not FQry.Eof do
    begin
      FSQL := Format('DROP TABLE %s', [FQry.Fields[0].AsString]);
      LQry.ExecSQL(FSQL);
      FQry.Next;
    end;
    FQry.Close;
  finally
    LQry.Free;
  end;
end;

function TMigrationDatabase.GetLastRunID: Integer;
begin
  FQry.Open('SELECT LASTDBUPDATE FROM STATS');
  Result := FQry.Fields[0].AsInteger;
  FQry.Close;
end;

procedure TMigrationDatabase.InitStatsTable;
begin
  FSQL := ' CREATE TABLE IF NOT EXISTS STATS (       ' +
          '   LASTDBUPDATE    INTEGER      DEFAULT 0 ' +
          ' )                                        ';
  FQry.ExecSQL(FSQL);
end;

procedure TMigrationDatabase.InitProductsTable;
begin
  FSQL := ' CREATE TABLE IF NOT EXISTS PRODUCTS (                    ' +
          '   ID           INTEGER         PRIMARY KEY AUTOINCREMENT ' +
          '                                UNIQUE                    ' +
          '                                NOT NULL,                 ' +
          '   Name         TEXT (100)      NOT NULL,                 ' +
          '   Description  TEXT (500),                               ' +
          '   Price        NUMERIC (10, 2) NOT NULL,                 ' +
          '   Image        BLOB,                                     ' +
          '   CreationDate DATE            NOT NULL                  ' +
          '                                DEFAULT (Date(''now'') )  ' +
          ' )                                                        ';
  FQry.ExecSQL(FSQL);
end;

function TMigrationDatabase.IsDBEmpty: Boolean;
begin
  FQry.Open('SELECT COUNT(*) FROM SQLITE_MASTER WHERE UPPER(TYPE) = :TYPE AND UPPER(NAME) NOT LIKE :NAME',
    ['TABLE', '%SQLITE_%']);
  Result := FQry.Fields[0].AsInteger = 0;
  FQry.Close;
end;

procedure TMigrationDatabase.RunDBInit;
begin
  InitStatsTable;
  var LastRunId := GetLastRunID;
  if (not IsDBEmpty) and (GetLastRunID = 0)  then
  begin
    DropAllTables;
    InitProductsTable;
    //InitUsersTable;
    //InitCostumersTable;
    //InitOrdersTables;
    UpdateLastRunId(1);
  end;

end;

procedure TMigrationDatabase.UpdateLastRunID(ARun: Integer);
begin
  if ARun = 1 then
    FQRY.ExecSQL('INSERT INTO STATS (LASTDBUPDATE) VALUES (:LASTDBUPDATE)', [ARun])
  else
    FQRY.ExecSQL('UPDATE STATS SET LASTDBUPDATE = :LASTDBUPDATE', [ARun]);
end;

end.
