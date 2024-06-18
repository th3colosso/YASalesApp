unit uUtils.Logger.Exceptions;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TExceptionLogger = class
  private
    class var FPath: string;
    class var FLog: TStringList;
    class procedure CheckLogFile;
    class procedure FreeLogFile;
    class procedure WriteLogFile(const Sender: TObject; const E: Exception);
  public
    class procedure Log(const Sender: TObject; const E: Exception);
  end;

implementation

uses
  uUtils.Dialogs,
  Vcl.Forms,
  System.IOUtils,
  System.DateUtils;

{ TExceptionLogger }

class procedure TExceptionLogger.CheckLogFile;
const
  FILE_NAME = 'Exceptions.log';
begin
  FPath := TPath.Combine(GetCurrentDir, FILE_NAME);

  if not Assigned(FLog) then
    FLog := TStringList.Create;

  if FileExists(FPath) then
    Flog.LoadFromFile(FPath);
end;

class procedure TExceptionLogger.FreeLogFile;
begin
  if Assigned(FLog) then
    FreeAndNil(FLog);
end;

class procedure TExceptionLogger.Log(const Sender: TObject; const E: Exception);
begin
  CheckLogFile;
  WriteLogFile(Sender, E);
  FLog.SaveToFile(FPath);
  FreeLogFile;
end;

class procedure TExceptionLogger.WriteLogFile(const Sender: TObject; const E: Exception);
begin
  FLog.Append('===================================');
  FLog.Append('--------UNHANDLED EXCEPTION--------');
  FLog.Append('Unit: ' + Sender.UnitName);
  FLog.Append('Class: ' + E.ClassName);
  FLog.Append('Error: ' + E.Message);
  FLog.Append('Form: ' + Screen.ActiveForm.Name);
  FLog.Append('Control: ' + Screen.ActiveControl.Name);
  FLog.Append('DateTime: ' + Now.ToString);
end;

end.
