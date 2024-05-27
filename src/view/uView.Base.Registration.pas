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
    pnlEdit: TPanel;
    pnlTitle: TPanel;
    rectTitle: TShape;
    lblTitle: TLabel;
    pnlData: TPanel;
    rectData: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btFirstClick(Sender: TObject);
    procedure btPredClick(Sender: TObject);
    procedure btSuccClick(Sender: TObject);
    procedure btLastClick(Sender: TObject);
  protected
    FIsInserting: Boolean;
    procedure ConfigMemTable; virtual;
    procedure ReloadData; virtual; abstract;
    procedure ConfigEditComponents; virtual; abstract;
    procedure Delete; virtual; abstract;
    procedure Save; virtual; abstract;
    procedure ConfigGrid;
  private
    procedure ConfigTabs;
    procedure ConfigVariables;
    procedure ConfigDBComponents;
    procedure ControlNavigation(AEnabled: Boolean);
    procedure ControlActions(AInEdit: Boolean);
    procedure MoveToListPage;
    procedure MoveToEditPage;
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
  ConfigVariables;
  ConfigTabs;
  ConfigDBComponents;
  ConfigGrid;
  ConfigMemTable;
  ControlActions(False);
  ControlNavigation(True);
end;

procedure TfrmBaseRegistration.FormDestroy(Sender: TObject);
begin
  Application.MainForm.Show;
end;

procedure TfrmBaseRegistration.FormShow(Sender: TObject);
begin
  ReloadData;
  Application.MainForm.Hide;
end;

procedure TfrmBaseRegistration.MoveToEditPage;
begin
  pages.ActivePage := tsEdit;
end;

procedure TfrmBaseRegistration.MoveToListPage;
begin
  pages.ActivePage := tsList;
end;

procedure TfrmBaseRegistration.ConfigDBComponents;
begin
  FDataSource.DataSet := FMemTable;
end;

procedure TfrmBaseRegistration.btCancelClick(Sender: TObject);
begin
  ControlNavigation(True);
  ControlActions(False);
  MoveToListPage;
end;

procedure TfrmBaseRegistration.btDeleteClick(Sender: TObject);
begin
  Delete;
  ReloadData;
  MoveToListPage;
end;

procedure TfrmBaseRegistration.btEditClick(Sender: TObject);
begin
  ControlNavigation(False);
  ControlActions(True);
  FIsInserting := False;
  ConfigEditComponents;
  MoveToEditPage;
end;

procedure TfrmBaseRegistration.btFirstClick(Sender: TObject);
begin
  FMemTable.First;
end;

procedure TfrmBaseRegistration.btInsertClick(Sender: TObject);
begin
  ControlNavigation(False);
  ControlActions(True);
  FIsInserting := True;
  ConfigEditComponents;
  MoveToEditPage;
end;

procedure TfrmBaseRegistration.btLastClick(Sender: TObject);
begin
  FMemTable.Last;
end;

procedure TfrmBaseRegistration.btPredClick(Sender: TObject);
begin
  FMemTable.Prior;
end;

procedure TfrmBaseRegistration.btRefreshClick(Sender: TObject);
begin
  ReloadData;
end;

procedure TfrmBaseRegistration.btSaveClick(Sender: TObject);
begin
  Save;
  ControlNavigation(True);
  ControlActions(False);
  ReloadData;
  MoveToListPage;
end;

procedure TfrmBaseRegistration.btSuccClick(Sender: TObject);
begin
  FMemTable.Next;
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

procedure TfrmBaseRegistration.ConfigVariables;
begin
  FIsInserting := False;
  lblTitle.Caption := Self.Hint;
end;

procedure TfrmBaseRegistration.ControlActions(AInEdit: Boolean);
begin
  btSave.Enabled := AInEdit;
  btCancel.Enabled := AInEdit;

  btRefresh.Enabled := not AInEdit;
  btInsert.Enabled := not AInEdit;
  btEdit.Enabled := not AInEdit;
  btDelete.Enabled := not AInEdit;
end;

procedure TfrmBaseRegistration.ControlNavigation(AEnabled: Boolean);
begin
  btFirst.Enabled := AEnabled;
  btPred.Enabled := AEnabled;
  btSucc.Enabled := AEnabled;
  btLast.Enabled := AEnabled;
end;

end.
