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
  TfrmBase = class(TForm)
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
    procedure ConfigEditTabComponents; virtual; abstract;
    procedure Delete; virtual;
    procedure Save; virtual; abstract;
    procedure ConfigGrid;
    procedure ClearData(AParent: TWinControl);
  private
    procedure ConfigTabs;
    procedure ConfigVariables;
    procedure ConfigDBComponents;
    procedure ControlNavigation(AEnabled: Boolean);
    procedure ControlActions(AInEdit: Boolean);
    procedure MoveToListPage;
    procedure MoveToEditPage;
    procedure CheckForNullItem;
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

uses
  uUtils.DmImages;

{$R *.dfm}

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  ConfigVariables;
  ConfigTabs;
  ConfigDBComponents;
  ConfigGrid;
  ConfigMemTable;
  ControlActions(False);
  ControlNavigation(True);
end;

procedure TfrmBase.FormDestroy(Sender: TObject);
begin
  Application.MainForm.AlphaBlend := False;
end;

procedure TfrmBase.FormShow(Sender: TObject);
begin
  ReloadData;
  Application.MainForm.AlphaBlend := True;
end;

procedure TfrmBase.MoveToEditPage;
begin
  pages.ActivePage := tsEdit;
end;

procedure TfrmBase.MoveToListPage;
begin
  pages.ActivePage := tsList;
end;

procedure TfrmBase.ClearData(AParent: TWinControl);
begin
  for var i := 0 to Pred(AParent.ControlCount) do
  begin
    if AParent.Controls[i] is TCustomEdit then
      (AParent.Controls[i] as TCustomEdit).Clear
    else if AParent.Controls[i] is TCustomMemo then
      (AParent.Controls[i] as TCustomMemo).Clear
    else if AParent.Controls[i] is TDateTimePicker then
      (AParent.Controls[i] as TDateTimePicker).Date := Now
    else if AParent.Controls[i] is TImage then
      (AParent.Controls[i] as TImage).Picture.Assign(nil)
    else if AParent.Controls[i] is TCheckbox then
      (AParent.Controls[i] as TCheckbox).Checked := False
    else if AParent.Controls[i] is TPanel then
      ClearData((AParent.Controls[i]) as TPanel);
  end;
end;

procedure TfrmBase.ConfigDBComponents;
begin
  FDataSource.DataSet := FMemTable;
end;

procedure TfrmBase.btCancelClick(Sender: TObject);
begin
  ControlNavigation(True);
  ControlActions(False);
  MoveToListPage;
end;

procedure TfrmBase.btDeleteClick(Sender: TObject);
begin
  Delete;
  ReloadData;
  MoveToListPage;
end;

procedure TfrmBase.btEditClick(Sender: TObject);
begin
  CheckForNullItem;
  ControlNavigation(False);
  ControlActions(True);
  FIsInserting := False;
  ConfigEditTabComponents;
  MoveToEditPage;
end;

procedure TfrmBase.btFirstClick(Sender: TObject);
begin
  FMemTable.First;
end;

procedure TfrmBase.btInsertClick(Sender: TObject);
begin
  ControlNavigation(False);
  ControlActions(True);
  FIsInserting := True;
  ConfigEditTabComponents;
  MoveToEditPage;
end;

procedure TfrmBase.btLastClick(Sender: TObject);
begin
  FMemTable.Last;
end;

procedure TfrmBase.btPredClick(Sender: TObject);
begin
  FMemTable.Prior;
end;

procedure TfrmBase.btRefreshClick(Sender: TObject);
begin
  ReloadData;
end;

procedure TfrmBase.btSaveClick(Sender: TObject);
begin
  Save;
  ControlNavigation(True);
  ControlActions(False);
  ReloadData;
  MoveToListPage;
end;

procedure TfrmBase.btSuccClick(Sender: TObject);
begin
  FMemTable.Next;
end;

procedure TfrmBase.ConfigGrid;
begin
  gdData.BorderStyle := bsNone;
  gdData.Options := [dgTitles, dgColumnResize, dgColLines, dgRowlines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack, dgThumbTracking];
  gdData.ReadOnly := True;
  gdData.DataSource := FDataSource;
end;

procedure TfrmBase.ConfigMemTable;
begin
  if not FMemTable.Active then
    FMemTable.CreateDataSet;
end;

procedure TfrmBase.ConfigTabs;
begin
  for var i := 0 to Pred(pages.PageCount) do
    pages.Pages[i].TabVisible := False;

  pages.ActivePageIndex := 0;
end;

procedure TfrmBase.ConfigVariables;
begin
  FIsInserting := False;
  lblTitle.Caption := Self.Hint;
  Self.Caption := Format(Self.Caption, [Application.Title]);
end;

procedure TfrmBase.ControlActions(AInEdit: Boolean);
begin
  btSave.Enabled := AInEdit;
  btCancel.Enabled := AInEdit;

  btRefresh.Enabled := not AInEdit;
  btInsert.Enabled := not AInEdit;
  btEdit.Enabled := not AInEdit;
  btDelete.Enabled := not AInEdit;
end;

procedure TfrmBase.ControlNavigation(AEnabled: Boolean);
begin
  btFirst.Enabled := AEnabled;
  btPred.Enabled := AEnabled;
  btSucc.Enabled := AEnabled;
  btLast.Enabled := AEnabled;
end;

procedure TfrmBase.Delete;
begin
  CheckForNullItem;
end;

procedure TfrmBase.CheckForNullItem;
begin
  if not (FMemTable.RecNo > 0) then
    Abort;
end;

end.
