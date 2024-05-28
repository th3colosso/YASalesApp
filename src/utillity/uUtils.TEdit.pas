unit uUtils.TEdit;

interface

type
  TUtilsTEdit = class
  public
    class procedure OnKeyPressCurrencyEdit(Sender: TObject; var Key: Char);
    class procedure OnExitCurrencyEdit(Sender: TObject);
  end;

implementation

uses
  Winapi.Windows,
  Vcl.StdCtrls,
  System.SysUtils,
  System.StrUtils;

{ TUtilsTEdit }

class procedure TUtilsTEdit.OnExitCurrencyEdit(Sender: TObject);
begin
  (Sender as TCustomEdit).Text := FormatFloat('##0.00', StrToFloatDef((Sender as TCustomEdit).Text, 0));
end;

class procedure TUtilsTEdit.OnKeyPressCurrencyEdit(Sender: TObject; var Key: Char);
begin
  if Key = FormatSettings.ThousandSeparator then
    Key := FormatSettings.DecimalSeparator;

  if (Key = FormatSettings.DecimalSeparator) and (Pos(Key, (Sender as TCustomEdit).Text) > 0) then
    Key := #0;

  if not (CharInSet(Key, ['0'..'9', Char(VK_BACK), Char(VK_RETURN), FormatSettings.DecimalSeparator])) then
    Key := #0;
end;

end.
