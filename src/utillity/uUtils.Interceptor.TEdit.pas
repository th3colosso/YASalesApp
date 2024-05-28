unit uUtils.Interceptor.TEdit;

interface

uses
  Vcl.StdCtrls;

type
  TEdit = class(Vcl.StdCtrls.TEdit)
  protected
    procedure KeyPress(var Key: Char); override;
  end;

implementation

uses
   Winapi.Windows,
   Vcl.Forms,
   Winapi.Messages;

{ TEdit }

procedure TEdit.KeyPress(var Key: Char);
begin

  if Key = #13 then
  begin
    PostMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, 0, 0);
    Key := #0;
  end;

  inherited KeyPress(Key);
end;

end.
