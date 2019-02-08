unit unSistemaControle;

interface

uses
  unConexao, SysUtils, SqlExpr, unEscolaModelo, unCadEscolaController;

type
  TSistemaControle = class
  private
    FConexao     : TConexao;
    FEscolaModelo: TEscolaModelo;
    class var FInstancia: TSistemaControle;
    class procedure LiberarInstancia();
  public              
    class function GetInstancia: TSistemaControle;
    property Conexao: TConexao read FConexao write FConexao;
    property EscolaModelo: TEscolaModelo read FEscolaModelo write FEscolaModelo;
  end;

implementation

{ TSistemaControle }

class function TSistemaControle.GetInstancia: TSistemaControle;
begin
  if not Assigned(FInstancia) then
    FInstancia := TSistemaControle.Create;

  Result := FInstancia;
end;

class procedure TSistemaControle.LiberarInstancia;
begin
  if Assigned(Self.FInstancia) then
    Self.FInstancia.Free;
end;

initialization
finalization
  TSistemaControle.LiberarInstancia();

end.
