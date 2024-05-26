unit uView.Base.Registration;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.DApt;

type
  TfrmBaseRegistration = class(TForm)
    pnlButtons: TPanel;
    pages: TPageControl;
    tsList: TTabSheet;
    tsEdit: TTabSheet;
    btInsert: TButton;
    btEdit: TButton;
    btCancel: TButton;
    btSave: TButton;
    btRefresh: TButton;
    btDelete: TButton;
    btLast: TButton;
    btSucc: TButton;
    btPred: TButton;
    btFirst: TButton;
    gdData: TDBGrid;
    FMemTable: TFDMemTable;
    FDataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure ConfigMemTable; virtual;
    procedure ReloadData; virtual; abstract;
    procedure ConfigGrid;
  private
    procedure ConfigTabs;
    procedure ConfigDBComponents;
  public
    { Public declarations }
  end;

var
  frmBaseRegistration: TfrmBaseRegistration;

implementation

uses
  uUtils.DmImages;

{$R *.dfm}

procedure TfrmBaseRegistration.FormCreate(Sender: TObject);
begin
  ConfigTabs;
  ConfigDBComponents;
  ConfigGrid;
  ConfigMemTable;
end;

procedure TfrmBaseRegistration.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDataSource);
end;

procedure TfrmBaseRegistration.FormShow(Sender: TObject);
begin
  ReloadData;
end;

procedure TfrmBaseRegistration.ConfigDBComponents;
begin
  FDataSource.DataSet := FMemTable;
end;

procedure TfrmBaseRegistration.btRefreshClick(Sender: TObject);
begin
  ReloadData;
end;

procedure TfrmBaseRegistration.ConfigGrid;
begin
  gdData.BorderStyle := bsNone;
  gdData.Options := [dgTitles, dgColumnResize, dgColLines, dgRowlines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack, dgThumbTracking];
  gdData.ReadOnly := True;
  gdData.DataSource := FDataSource;
end;

procedure TfrmBaseRegistration.ConfigMemTable;
begin
  if not FMemTable.Active then
    FMemTable.CreateDataSet;
end;

procedure TfrmBaseRegistration.ConfigTabs;
begin
  for var i := 0 to Pred(pages.PageCount) do
    pages.Pages[i].TabVisible := False;

  pages.ActivePageIndex := 0;
end;

end.
