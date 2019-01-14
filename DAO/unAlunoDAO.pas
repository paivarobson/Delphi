unit unAlunoDAO;

interface

uses
  SqlExpr, unConexao, unSistemaControle, SysUtils, Provider, unAlunoModelo;


type
  TAlunoDAO = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function Obter: TSQLQuery;
    function ObterProvider: TDataSetProvider;
//    function ObterAluno(AId: Integer): TAlunoModelo;
//    function Salvar(AAluno: TAlunoModelo): Boolean;
  end;


implementation

uses
  unDados;

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
  try
    VQuery := FConexao.CriarQuery();

    VQuery.SQL.Text := 'SELECT ALUMAT, ALUNOME FROM ALUNO';
    VQuery.Open;

    Result := VQuery;
  finally
    FreeAndNil(VQuery);
  end;
end;

//function TAlunoDAO.ObterAluno(AId: Integer): TAlunoModelo;
//begin
////  fmdados.cdsAluno.Close;
////  fmdados.cdsAluno.CommandText:= 'select * from aluno where id = ' + IntToStr(AId);
//
////  if fmdados.cdsAluno.Open then
////  begin
////
////  end;
//end;

function TAlunoDAO.ObterProvider: TDataSetProvider;
var
  VProvider: TDataSetProvider;
begin
  VProvider := FConexao.CriarProvider;

  Result := VProvider;
end;

//function TAlunoDAO.Salvar(AAluno: TAlunoModelo): Boolean;
//begin
//
//end;

end.
