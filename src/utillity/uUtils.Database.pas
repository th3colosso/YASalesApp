unit uUtils.Database;

interface

uses
  Data.DB;

type
  TUtilsDataBase = class
  private
    class procedure CheckExistence(APath: string);
  public
    class function GetDataBase: string;
  end;

implementation

uses
  System.SysUtils;

{ TUtilsDataBase }

class procedure TUtilsDataBase.CheckExistence(APath: string);
begin
  if not FileExists(APath) then
    ForceDirectories(ExtractFilePath(APath));
end;

class function TUtilsDataBase.GetDataBase: string;
begin
  {$IFNDEF Debug}
  Result := GetCurrentDir + '\..\..\assets\db\YASalesApp.db';
  {$ELSE}
  Result := GetCurrentDir + '\db\YASalesApp.db';
  {$ENDIF}

  CheckExistence(Result);
end;

end.
