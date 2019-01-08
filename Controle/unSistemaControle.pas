unit unSistemaControle;

interface

uses
  unDados, SysUtils, unEscolaModelo, SqlExpr;

type
  TSistemaControle = class
  private
    FConexao     : Tfmdados;
    FEscola      : TEscolaModelo;
    FEscolaCodigo: Integer;

    class var FInstancia: TSistemaControle;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetEscola(ACodigoEscola: Integer);
    procedure CarregarEscola;

    class function GetInstancia: TSistemaControle;

    property Conexao: Tfmdados read FConexao write FConexao;
    property Escola: TEscolaModelo read FEscola write FEscola;
  end;

implementation

{ TSistemaControle }

procedure TSistemaControle.CarregarEscola;
begin
  FEscola.Carregar();
end;

constructor TSistemaControle.Create;
begin
  FConexao := Tfmdados.Create(nil);
  FEscola := TEscolaModelo.Create(FEscolaCodigo);
end;

destructor TSistemaControle.Destroy;
begin
  FreeAndNil(FEscola);
  FreeAndNil(FConexao);
  inherited;
end;

class function TSistemaControle.GetInstancia: TSistemaControle;
begin
  if not Assigned(Self.FInstancia) then
    Self.FInstancia := TSistemaControle.Create;
  Result := Self.FInstancia;
end;

procedure TSistemaControle.SetEscola(ACodigoEscola: Integer);
begin
  FEscolaCodigo := ACodigoEscola;
end;

end.
