program YASalesApp;

uses
  Vcl.Forms,
  uView.Home in '..\..\src\view\uView.Home.pas' {frmHome},
  uUtils.DmImages in '..\..\src\utillity\uUtils.DmImages.pas' {dmImages: TDataModule},
  uModel.Base in '..\..\src\model\uModel.Base.pas',
  uModel.Connection in '..\..\src\model\uModel.Connection.pas' {dmConnection: TDataModule},
  uModel.Products in '..\..\src\model\uModel.Products.pas',
  uView.Base.Registration in '..\..\src\view\uView.Base.Registration.pas' {frmBase},
  uController.Products in '..\..\src\controller\uController.Products.pas',
  uView.Products in '..\..\src\view\uView.Products.pas' {frmProducts},
  uController.Database in '..\..\src\controller\uController.Database.pas',
  uEntity.Product in '..\..\src\entity\uEntity.Product.pas',
  uUtils.TEdit in '..\..\src\utillity\uUtils.TEdit.pas',
  uUtils.Interceptor.TEdit in '..\..\src\utillity\uUtils.Interceptor.TEdit.pas',
  uMigration.Database in '..\..\src\migration\uMigration.Database.pas',
  Bcrypt in '..\..\src\modules\Bcrypt\Bcrypt.pas',
  uController.Encryption in '..\..\src\controller\uController.Encryption.pas',
  uView.Login in '..\..\src\view\uView.Login.pas' {frmLogin},
  uController.Users in '..\..\src\controller\uController.Users.pas',
  uModel.Users in '..\..\src\model\uModel.Users.pas',
  uView.Users in '..\..\src\view\uView.Users.pas' {frmUsers};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.Title := 'YASales App';
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmUsers, frmUsers);
  Application.Run;
end.
