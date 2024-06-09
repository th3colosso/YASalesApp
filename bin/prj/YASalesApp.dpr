program YASalesApp;

uses
  Vcl.Forms,
  uView.Home in '..\..\src\view\uView.Home.pas' {frmHome},
  uUtils.DmImages in '..\..\src\utillity\uUtils.DmImages.pas' {dmImages: TDataModule},
  uModel.Base in '..\..\src\model\uModel.Base.pas',
  uModel.Connection in '..\..\src\model\uModel.Connection.pas' {dmConnection: TDataModule},
  uModel.Products in '..\..\src\model\uModel.Products.pas',
  uView.Base.Registration in '..\..\src\view\uView.Base.Registration.pas' {frmBaseReg},
  uController.Products in '..\..\src\controller\uController.Products.pas',
  uView.Products in '..\..\src\view\uView.Products.pas' {frmProducts},
  uController.Database in '..\..\src\controller\uController.Database.pas',
  uEntity.Product in '..\..\src\entity\uEntity.Product.pas',
  uUtils.TEdit in '..\..\src\utillity\uUtils.TEdit.pas',
  uUtils.Interceptor.TEdit in '..\..\src\utillity\uUtils.Interceptor.TEdit.pas',
  uMigration.Database in '..\..\src\migration\uMigration.Database.pas',
  uController.Encryption in '..\..\src\controller\uController.Encryption.pas',
  uView.Login in '..\..\src\view\uView.Login.pas' {frmLogin},
  uController.Users in '..\..\src\controller\uController.Users.pas',
  uModel.Users in '..\..\src\model\uModel.Users.pas',
  uView.Users in '..\..\src\view\uView.Users.pas' {frmUsers},
  uEntity.User in '..\..\src\entity\uEntity.User.pas',
  uView.NewPassword in '..\..\src\view\uView.NewPassword.pas' {frmNewPassword},
  uController.Customers in '..\..\src\controller\uController.Customers.pas',
  uView.Customers in '..\..\src\view\uView.Customers.pas' {frmCustomers},
  uEntity.Customer in '..\..\src\entity\uEntity.Customer.pas',
  uModel.Customers in '..\..\src\model\uModel.Customers.pas',
  uController.Address in '..\..\src\controller\uController.Address.pas',
  uEntity.AddressInfo in '..\..\src\entity\uEntity.AddressInfo.pas',
  uModel.AddressInfo.ViaCEP in '..\..\src\model\uModel.AddressInfo.ViaCEP.pas',
  uUtils.Dialogs in '..\..\src\utillity\uUtils.Dialogs.pas',
  uUtils.Handler.Exceptions in '..\..\src\utillity\uUtils.Handler.Exceptions.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.Title := 'YASales App';
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmHome, frmHome);
  Application.Run;
end.
