unit unAlunoDAO;

interface

uses
  SqlExpr, unConexao, unSistemaControle, SysUtils;


type
  TAlunoDAO = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function Obter: TSQLQuery;
  end;


implementation

{ TClienteDAO }

constructor TAlunoDAO.Create;
begin
  FConexao := TSistemaControle. GetInstancia().Conexao;
end;

destructor TAlunoDAO.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

function TAlunoDAO.Obter: TSQLQuery;
var
  VQuery: TSQLQuery;
begin
  VQuery := FConexao.CriarQuery();

  VQuery.SQL.Text := 'SELECT ALUMAT, ALUNOME FROM ALUNO';
  VQuery.Open;

  Result := VQuery;
end;

end.
