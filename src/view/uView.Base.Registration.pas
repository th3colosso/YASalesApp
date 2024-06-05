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
  TfrmBaseReg = class(TForm)
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
  frmBaseReg: TfrmBaseReg;

implementation

uses
  uUtils.DmImages;

{$R *.dfm}

procedure TfrmBaseReg.FormCreate(Sender: TObject);
begin
  ConfigVariables;
  ConfigTabs;
  ConfigDBComponents;
  ConfigGrid;
  ConfigMemTable;
  ControlActions(False);
  ControlNavigation(True);
end;

procedure TfrmBaseReg.FormDestroy(Sender: TObject);
begin
  Application.MainForm.AlphaBlend := False;
end;

procedure TfrmBaseReg.FormShow(Sender: TObject);
begin
  ReloadData;
  Application.MainForm.AlphaBlend := True;
end;

procedure TfrmBaseReg.MoveToEditPage;
begin
  pages.ActivePage := tsEdit;
end;

procedure TfrmBaseReg.MoveToListPage;
begin
  pages.ActivePage := tsList;
end;

procedure TfrmBaseReg.ClearData(AParent: TWinControl);
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
      ClearData((AParent.Controls[i]) as TPanel)
    else if AParent.Controls[i] is TGroupBox then
      ClearData((AParent.Controls[i]) as TGroupBox);
  end;
end;

procedure TfrmBaseReg.ConfigDBComponents;
begin
  FDataSource.DataSet := FMemTable;
end;

procedure TfrmBaseReg.btCancelClick(Sender: TObject);
begin
  ControlNavigation(True);
  ControlActions(False);
  MoveToListPage;
end;

procedure TfrmBaseReg.btDeleteClick(Sender: TObject);
begin
  Delete;
  ReloadData;
  MoveToListPage;
end;

procedure TfrmBaseReg.btEditClick(Sender: TObject);
begin
  CheckForNullItem;
  ControlNavigation(False);
  ControlActions(True);
  FIsInserting := False;
  ConfigEditTabComponents;
  MoveToEditPage;
end;

procedure TfrmBaseReg.btFirstClick(Sender: TObject);
begin
  FMemTable.First;
end;

procedure TfrmBaseReg.btInsertClick(Sender: TObject);
begin
  ControlNavigation(False);
  ControlActions(True);
  FIsInserting := True;
  ConfigEditTabComponents;
  MoveToEditPage;
end;

procedure TfrmBaseReg.btLastClick(Sender: TObject);
begin
  FMemTable.Last;
end;

procedure TfrmBaseReg.btPredClick(Sender: TObject);
begin
  FMemTable.Prior;
end;

procedure TfrmBaseReg.btRefreshClick(Sender: TObject);
begin
  ReloadData;
end;

procedure TfrmBaseReg.btSaveClick(Sender: TObject);
begin
  Save;
  ControlNavigation(True);
  ControlActions(False);
  ReloadData;
  MoveToListPage;
end;

procedure TfrmBaseReg.btSuccClick(Sender: TObject);
begin
  FMemTable.Next;
end;

procedure TfrmBaseReg.ConfigGrid;
begin
  gdData.BorderStyle := bsNone;
  gdData.Options := [dgTitles, dgColumnResize, dgColLines, dgRowlines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack, dgThumbTracking];
  gdData.ReadOnly := True;
  gdData.DataSource := FDataSource;
end;

procedure TfrmBaseReg.ConfigMemTable;
begin
  if not FMemTable.Active then
    FMemTable.CreateDataSet;
end;

procedure TfrmBaseReg.ConfigTabs;
begin
  for var i := 0 to Pred(pages.PageCount) do
    pages.Pages[i].TabVisible := False;

  pages.ActivePageIndex := 0;
end;

procedure TfrmBaseReg.ConfigVariables;
begin
  FIsInserting := False;
  lblTitle.Caption := Self.Hint;
  Self.Caption := Format(Self.Caption, [Application.Title]);
end;

procedure TfrmBaseReg.ControlActions(AInEdit: Boolean);
begin
  btSave.Enabled := AInEdit;
  btCancel.Enabled := AInEdit;

  btRefresh.Enabled := not AInEdit;
  btInsert.Enabled := not AInEdit;
  btEdit.Enabled := not AInEdit;
  btDelete.Enabled := not AInEdit;
end;

procedure TfrmBaseReg.ControlNavigation(AEnabled: Boolean);
begin
  btFirst.Enabled := AEnabled;
  btPred.Enabled := AEnabled;
  btSucc.Enabled := AEnabled;
  btLast.Enabled := AEnabled;
end;

procedure TfrmBaseReg.Delete;
begin
  CheckForNullItem;
end;

procedure TfrmBaseReg.CheckForNullItem;
begin
  if not (FMemTable.RecNo > 0) then
    Abort;
end;

end.
