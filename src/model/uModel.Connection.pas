unit uModel.Connection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  Data.DB;

type
  TdmConnection = class(TDataModule)
  private
    FConn: TFDConnection;
  public
    constructor Create(AOwner: TComponent); override;
    property Conn: TFDConnection read FConn;
  end;

var
  dmConnection: TdmConnection;

implementation

uses
  Vcl.Forms,
  uController.Database;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConnection }

constructor TdmConnection.Create(AOwner: TComponent);
begin
  inherited;
  FConn := TFDConnection.Create(AOwner);
  try
    FConn.DriverName := 'SQLite';
    FConn.Params.Database := TControllerDB.GetDataBase;
    FConn.Params.Add('LockingMode=Normal');
    FConn.LoginPrompt := False;
    FConn.Connected := True;
    TControllerDB.CheckMigration;
  except
    raise Exception.Create('Error setting up connection to the database. Program will be terminated!');
    FConn.Free;
    Application.Terminate;
  end;
end;

end.
