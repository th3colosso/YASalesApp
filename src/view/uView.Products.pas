unit uView.Products;

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
  uView.Base.Registration,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ExtDlgs,
  Vcl.Imaging.pngimage,
  uUtils.Interceptor.TEdit;

type
  TfrmProducts = class(TfrmBaseReg)
    FMemTableID: TIntegerField;
    FMemTableName: TStringField;
    FMemTableDescription: TStringField;
    FMemTablePrice: TFloatField;
    FMemTableCreationDate: TDateField;
    edtID: TEdit;
    edtName: TEdit;
    mmDescription: TMemo;
    dtpCreationDate: TDateTimePicker;
    edtPrice: TEdit;
    lblID: TLabel;
    lblName: TLabel;
    lblPrice: TLabel;
    lblCreationDate: TLabel;
    lblDescription: TLabel;
    lblImage: TLabel;
    FMemTableImage: TBlobField;
    btLoadImg: TButton;
    pnlImage: TPanel;
    img: TImage;
    rectImg: TShape;
    lblCharCount: TLabel;
    procedure btLoadImgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mmDescriptionChange(Sender: TObject);
  protected
    procedure ReloadData; override;
    procedure ConfigEditTabComponents; override;
    procedure Save; override;
    procedure Delete; override;
  private
    procedure GetProductData;
    procedure BrowseImages;
    procedure ConfigEdits;
    procedure SetDescriptionCharCountInfo;
  end;

var
  frmProducts: TfrmProducts;

implementation

uses
  uController.Products,
  uUtils.DmImages,
  uEntity.Product,
  uUtils.TEdit;

{$R *.dfm}

{ TfrmProducts }

procedure TfrmProducts.ConfigEdits;
begin
  edtPrice.OnKeyPress := TUtilsTEdit.OnKeyPressCurrencyEdit;
  edtPrice.OnExit := TUtilsTEdit.OnExitCurrencyEdit;
end;

procedure TfrmProducts.ConfigEditTabComponents;
begin
  inherited;
  if FIsInserting then
  begin
    SetDescriptionCharCountInfo;
    edtID.Text := '-1';
    dtpCreationDate.Date := Now;
  end
  else
    GetProductData;
end;

procedure TfrmProducts.Delete;
begin
  inherited;
  var Msg := Format('Are you sure you want to delete the following product? %s%s [ %d - %s ]',
    [SLineBreak, sLineBreak, FMemTableID.AsInteger, FMemTableName.AsString]);
  if Application.MessageBox(PChar(Msg), 'WARNING', MB_YESNO + MB_ICONWARNING) = mrYes then
    if not TControllerProducts.Delete(FMemTableID.AsInteger) then
      Application.MessageBox(Pchar('Problem found while deleting product'), 'Error', MB_OK + MB_ICONERROR);
end;

procedure TfrmProducts.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigEdits;
end;

procedure TfrmProducts.BrowseImages;
begin
  var openPDlg := TOpenPictureDialog.Create(Self);
  try
    openPDlg.Filter := 'PNG|*.png';
    if openPDlg.Execute then
    begin
      img.Picture.LoadFromFile(openPDlg.FileName);
    end;
  finally
    openPDlg.Free;
  end;

end;

procedure TfrmProducts.btLoadImgClick(Sender: TObject);
begin
  inherited;
  BrowseImages;
end;

procedure TfrmProducts.GetProductData;
begin
  var Stream := TFDBlobStream.Create(FMemTableImage, bmRead);
  try
    edtID.Text := FMemTableID.AsString;
    edtName.Text := FMemTableName.AsString;
    edtPrice.Text := FMemTablePrice.AsString;
    edtPrice.OnExit(edtPrice); //Format Currency
    mmDescription.Lines.Text := FMemTableDescription.AsString;
    dtpCreationDate.Date := FMemTableCreationDate.AsDateTime;
    img.Picture.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TfrmProducts.mmDescriptionChange(Sender: TObject);
begin
  inherited;
  SetDescriptionCharCountInfo;
end;

procedure TfrmProducts.SetDescriptionCharCountInfo;
begin
  lblCharCount.Caption := Format('%d/500', [mmDescription.GetTextLen]);
end;

procedure TfrmProducts.ReloadData;
begin
  if not TControllerProducts.Load(FMemTable) then
    Application.MessageBox(PChar('Problem found while loading data'), 'Error', MB_OK + MB_ICONERROR);
end;

procedure TfrmProducts.Save;
begin
  inherited;
  var Product := TEntityProduct.Create;
  try
    Product.ID := StrToIntDef(edtID.Text, -1);
    Product.Name := edtName.Text;
    Product.Description := mmDescription.Text;
    Product.Price := StrToFloatDef(edtPrice.Text, 0);
    img.Picture.SaveToStream(Product.Image);
    if not TControllerProducts.Save(Product) then
      Application.MessageBox(PChar('Problem found while saving product'), 'Error', MB_OK + MB_ICONERROR);
  finally
    Product.Free;
  end;
end;

end.
