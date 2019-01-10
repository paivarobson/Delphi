unit unSistemaControle;

interface

uses
  unConexao, SysUtils, SqlExpr, unEscolaModelo;

type
  TSistemaControle = class
  private
    FConexao     : TConexao;
    FEscolaModelo: TEscolaModelo;

    class var FInstancia: TSistemaControle;
  public
    constructor Create();
    destructor Destroy; override;

    procedure CarregarEscola(ACodigoEscola: Integer);

    class function GetInstancia: TSistemaControle;

    property Conexao: TConexao read FConexao write FConexao;
    property EscolaModelo: TEscolaModelo read FEscolaModelo write FEscolaModelo;
  end;

implementation

{ TSistemaControle }

procedure TSistemaControle.CarregarEscola(ACodigoEscola: Integer);
begin
  EscolaModelo.Carregar(ACodigoEscola);
end;

constructor TSistemaControle.Create;
begin
  FConexao := TConexao.Create;
  FEscolaModelo := TEscolaModelo.Create;
end;

destructor TSistemaControle.Destroy;
begin
  FreeAndNil(FEscolaModelo);
  FreeAndNil(FConexao);
  inherited;
end;

class function TSistemaControle.GetInstancia: TSistemaControle;
begin
  if not Assigned(Self.FInstancia) then
    Self.FInstancia := TSistemaControle.Create();
    
  Result := Self.FInstancia;
end;

end.