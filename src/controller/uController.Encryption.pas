unit uController.Encryption;

interface

type
  TControllerEncryption = class
    class function HashPassword(const APassword: string): string;
    class function CheckPassword(const ATypedPassword: string; const APassword: string; var APasswordNeedsReHash: Boolean): Boolean;
  end;

implementation

uses
  BCrypt;

{ TControllerEncryption }

class function TControllerEncryption.CheckPassword(const ATypedPassword, APassword: string; var APasswordNeedsReHash: Boolean): Boolean;
begin
  Result := TBCrypt.CompareHash(ATypedPassword, APassword);
  APasswordNeedsReHash := TBCrypt.NeedsRehash(APassword);
end;

class function TControllerEncryption.HashPassword(const APassword: string): string;
begin
  Result := TBCrypt.GenerateHash(APassword);
end;

end.
