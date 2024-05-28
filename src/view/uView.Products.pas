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
  Vcl.Imaging.jpeg;

type
  TfrmProducts = class(TfrmBaseRegistration)
    FMemTableID: TIntegerField;
    FMemTableName: TStringField;
    FMemTableDescription: TStringField;
    FMemTablePrice: TFloatField;
    FMemTableCreationDate: TDateField;
    edtID: TEdit;
    edtName: TEdit;
    mmDescription: TMemo;
    edtCreationDate: TDateTimePicker;
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
    procedure btLoadImgClick(Sender: TObject);
  protected
    procedure ReloadData; override;
    procedure ConfigEditComponents; override;
    procedure Save; override;
    procedure Delete; override;
  private
    procedure GetProductData;
    procedure BrowseImages;
  public
    { Public declarations }
  end;

var
  frmProducts: TfrmProducts;

implementation

uses
  uController.Products,
  uUtils.DmImages, uEntity.Product;

{$R *.dfm}

{ TfrmProducts }

procedure TfrmProducts.ConfigEditComponents;
begin
  inherited;
  if FIsInserting then
  begin
    ClearData(pnlData);
    edtID.Text := '-1';
  end
  else
    GetProductData;
end;

procedure TfrmProducts.Delete;
begin
  inherited;
  // deletion code here
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
    mmDescription.Lines.Text := FMemTableDescription.AsString;
    edtCreationDate.Date := FMemTableCreationDate.AsDateTime;
    img.Picture.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TfrmProducts.ReloadData;
begin
  TControllerProducts.Load(FMemTable);
end;

procedure TfrmProducts.Save;
begin
  inherited;
  var Product := TEntityProduct.Create;
  try
    Product.ID := StrToInt(edtID.Text);
    Product.Name := edtName.Text;
    Product.Description := mmDescription.Text;
    Product.Price := StrToFloat(edtPrice.Text);
    img.Picture.SaveToStream(Product.Image);
    TControllerProducts.Save(Product);
  finally
    Product.Free;
  end;
end;

end.
