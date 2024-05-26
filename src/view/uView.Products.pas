unit uView.Products;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uView.Base.Registration, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmProducts = class(TfrmBaseRegistration)
    FMemTableID: TIntegerField;
    FMemTableName: TStringField;
    FMemTableDescription: TStringField;
    FMemTablePrice: TFloatField;
    FMemTableCreationDate: TDateField;
  protected
    procedure ReloadData; override;
  public
    { Public declarations }
  end;

var
  frmProducts: TfrmProducts;

implementation

uses
  uController.Products;

{$R *.dfm}

{ TfrmProducts }

procedure TfrmProducts.ReloadData;
begin
  TControllerProducts.Load(FMemTable);
end;

end.
