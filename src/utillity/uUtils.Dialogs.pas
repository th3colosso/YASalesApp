unit uUtils.Dialogs;

interface

uses
  Winapi.Windows;

type
  TUtilsDialogs = class
  public
    class function Error(const AMsg: string; AButtons: Integer = MB_OK): Integer;
    class function Warning(const AMsg: string; AButtons: Integer = MB_OK): Integer;
  end;

implementation

uses
  Vcl.Forms;

{ TUtilsDialogs }

class function TUtilsDialogs.Error(const AMsg: string; AButtons: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AMsg), 'Error', AButtons + MB_ICONERROR);
end;

class function TUtilsDialogs.Warning(const AMsg: string; AButtons: Integer): Integer;
begin
  Result := Application.MessageBox(PChar(AMsg), 'Warning', AButtons + MB_ICONWARNING);
end;

end.
