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
    procedure UpdateLastRunID(var ALastRun: Integer);
    procedure InitCostumersTable;
    procedure InitUsersTable;
    procedure CheckAdminUser;
    procedure CheckStatsValues;
  public
    procedure RunDBInit;
  end;

implementation

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  uController.Encryption;

{ TMigrationDatabase }

procedure TMigrationDatabase.CheckAdminUser;
begin
  FQry.Open('SELECT COUNT(1) FROM USERS WHERE LOGIN = :LOGIN', ['admin']);
  if FQry.Fields[0].AsInteger = 0 then
    FQry.ExecSQL('INSERT INTO USERS (NAME, LOGIN, PASSWORD, ISPASSTEMP) VALUES (:NAME, :LOGIN, :PASSWORD, :ISTEMP)',
      ['Administrator', 'admin', TControllerEncryption.HashPassword('admin'), False]);
  FQry.Close;
end;

procedure TMigrationDatabase.CheckStatsValues;
begin
  FQry.Open('SELECT COUNT(1) FROM STATS');
  if FQry.Fields[0].AsInteger = 0 then
    FQry.ExecSQL('INSERT INTO STATS DEFAULT VALUES');
  FQry.Close;
end;

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
  FSQL := ' CREATE TABLE IF NOT EXISTS STATS (    ' +
          '   LASTDBUPDATE  INTEGER  DEFAULT 0    ' +
          ' )                                     ';
  FQry.ExecSQL(FSQL);
  CheckStatsValues;
end;

procedure TMigrationDatabase.InitProductsTable;
begin
  FSQL := ' CREATE TABLE IF NOT EXISTS PRODUCTS (                                  ' +
          '   ID           INTEGER         PRIMARY KEY AUTOINCREMENT               ' +
          '                                UNIQUE                                  ' +
          '                                NOT NULL,                               ' +
          '   Name         TEXT (100)      NOT NULL,                               ' +
          '   Description  TEXT (500),                                             ' +
          '   Price        NUMERIC (10, 2) NOT NULL,                               ' +
          '   Image        BLOB,                                                   ' +
          '   CreationDate DATE            NOT NULL                                ' +
          '                                DEFAULT (Date(''now'', ''localtime'') ) ' +
          ' )                                                                      ';
  FQry.ExecSQL(FSQL);
end;

procedure TMigrationDatabase.InitUsersTable;
begin
  FSQL := ' CREATE TABLE USERS (                                                 ' +
          '   ID             INTEGER   PRIMARY KEY AUTOINCREMENT                 ' +
          '                            NOT NULL                                  ' +
          '                            UNIQUE,                                   ' +
          '   Name           TEXT (80) NOT NULL,                                 ' +
          '   Login          TEXT (40) NOT NULL                                  ' +
          '                            UNIQUE,                                   ' +
          '   Password       TEXT (80) NOT NULL,                                 ' +
          '   IsPassTemp     BOOLEAN   NOT NULL                                  ' +
          '                            DEFAULT (True),                           ' +
          '   CreationDate   DATE      NOT NULL                                  ' +
          '                            DEFAULT (Date(''now'', ''localtime'') ),  ' +
          '   HasUserScr     BOOLEAN   NOT NULL                                  ' +
          '                            DEFAULT (True),                           ' +
          '   HasProductScr  BOOLEAN   NOT NULL                                  ' +
          '                            DEFAULT (True),                           ' +
          '   HasCustomerScr BOOLEAN   NOT NULL                                  ' +
          '                            DEFAULT (True),                           ' +
          '   HasOrderScr    BOOLEAN   NOT NULL                                  ' +
          '                            DEFAULT (True)                            ' +
          ' );                                                                   ' ;

  FQry.ExecSQL(FSQL);
end;

procedure TMigrationDatabase.InitCostumersTable;
begin
  FSQL := ' CREATE TABLE CUSTOMERS (                                                ' +
          '   ID               INTEGER    PRIMARY KEY AUTOINCREMENT                 ' +
          '                               UNIQUE                                    ' +
          '                               NOT NULL,                                 ' +
          '   FirstName        TEXT (50)  NOT NULL,                                 ' +
          '   LastName         TEXT (50)  NOT NULL,                                 ' +
          '   Email            TEXT (100) NOT NULL,                                 ' +
          '   DateOfBirth      DATE       NOT NULL,                                 ' +
          '   ZIPCode          TEXT (15),                                           ' +
          '   Street           TEXT (50),                                           ' +
          '   Neighbourhood    TEXT (30),                                           ' +
          '   HouseNo          INTEGER,                                             ' +
          '   State            TEXT (30),                                           ' +
          '   City             TEXT (30),                                           ' +
          '   CreationDate     DATE       DEFAULT (DATE(''now'', ''localtime'') )   ' +
          '                               NOT NULL                                  ' +
          ' );                                                                      ' ;
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
  if (IsDBEmpty) or (LastRunId = 0)  then
  begin
    DropAllTables;
    InitProductsTable;
    InitUsersTable;
    InitCostumersTable;
    {InitOrdersTables;} {TODO -cDev: Add Orders and Itens DDL}
    UpdateLastRunId(LastRunId);
  end;
  CheckAdminUser;

end;

procedure TMigrationDatabase.UpdateLastRunID(var ALastRun: Integer);
begin
  Inc(ALastRun);
  FQry.ExecSQL('UPDATE STATS SET LASTDBUPDATE = :LASTDBUPDATE', [ALastRun]);
end;

end.
