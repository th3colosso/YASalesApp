unit uUtils.Handler.Exceptions;

interface

uses
  System.Classes,
  System.SysUtils;

type
  TExceptionHandler = class
  private
    class var FPath: string;
    class var FLog: TStringList;
    class var FExceptionHandler: TExceptionHandler;
    procedure CheckLogFile;
    procedure FreeLogFile;
    procedure WriteLogFile(Sender: TObject; E: Exception);
  public
    class destructor Destroy;
    class function New: TExceptionHandler;
    procedure OnException(Sender: TObject; E: Exception);
  end;

implementation

uses
  uUtils.Dialogs,
  Vcl.Forms,
  System.IOUtils,
  System.DateUtils;

{ TExceptionHandler }
  
var 
  ExceptionHandler: TExceptionHandler;

procedure TExceptionHandler.CheckLogFile;
const
  FILE_NAME = 'Exceptions.log';
begin
  FPath := TPath.Combine(GetCurrentDir, FILE_NAME);

  if not Assigned(FLog) then
    FLog := TStringList.Create;
  
  if FileExists(FPath) then 
    Flog.LoadFromFile(FPath);
end;

class destructor TExceptionHandler.Destroy;
begin
  if Assigned(FExceptionHandler) then
    FreeAndNil(FExceptionHandler);
end;

procedure TExceptionHandler.FreeLogFile;
begin
  if Assigned(FLog) then
    FreeAndNil(FLog);
end;

class function TExceptionHandler.New: TExceptionHandler;
begin
  if not Assigned(FExceptionHandler) then
    FExceptionHandler := TExceptionHandler.Create;

  Result := FExceptionHandler;
end;

procedure TExceptionHandler.OnException(Sender: TObject; E: Exception);
begin
  CheckLogFile;
  WriteLogFile(Sender, E);
  FLog.SaveToFile(FPath);
  FreeLogFile;
end;

procedure TExceptionHandler.WriteLogFile(Sender: TObject; E: Exception);
begin
  FLog.Append('===================================');
  FLog.Append('--------UNHANDLED EXCEPTION--------');
  FLog.Append('Class: ' + E.ClassName);
  FLog.Append('Error: ' + E.Message);
  FLog.Append('Form: ' + Screen.ActiveForm.Name);
  FLog.Append('Control: ' + Screen.ActiveControl.Name);
  FLog.Append('DateTime: ' + Now.ToString);
end;

initialization
  Application.OnException := TExceptionHandler.New.OnException;

end.
