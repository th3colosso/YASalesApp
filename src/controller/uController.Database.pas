unit uController.Database;

interface

uses
  Data.DB;

type
  TControllerDB = class
  private
    class procedure CheckExistence(APath: string);
  public
    class function GetDataBase: string;
    class procedure CheckMigration;
  end;

implementation

uses
  System.SysUtils,
  uMigration.Database,
  uModel.Connection;

{ TControllerDB }

class procedure TControllerDB.CheckExistence(APath: string);
begin
  if not FileExists(APath) then
    ForceDirectories(ExtractFilePath(APath));
end;

class procedure TControllerDB.CheckMigration;
begin
  var DatabaseMigration := TMigrationDatabase.Create(dmConnection.Conn);
  try
    DatabaseMigration.RunDBInit;
  finally
    DatabaseMigration.Free;
  end;
end;

class function TControllerDB.GetDataBase: string;
begin
  {$IFDEF Debug}
  Result := GetCurrentDir + '\..\..\assets\db\YASalesApp.db';
  {$ELSE}
  Result := GetCurrentDir + '\db\YASalesApp.db';
  {$ENDIF}

  CheckExistence(Result);
end;

end.
