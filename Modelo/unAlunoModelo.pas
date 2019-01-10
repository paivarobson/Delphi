unit unAlunoModelo;

interface

uses
  unEnumerado, SqlExpr, unAlunoDAO;

type
  TAlunoModelo = class
  private
    FAcao: TAcao;
    FNome: string;
    FMatricula: Integer;

    procedure SetAcao(const Value: TAcao);
    procedure SetMatricula(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    function Obter: TSQLQuery;

    property Matricula: Integer read FMatricula write SetMatricula;
    property Nome: string read FNome write SetNome;
    property Acao: TAcao read FAcao write SetAcao;
  end;

implementation

{ TClienteModelo }

function TAlunoModelo.Obter: TSQLQuery;
var
  VAlunoDAO: TAlunoDAO;
begin
  VAlunoDAO := TAlunoDAO.Create;
  try
    Result := VAlunoDAO.Obter;    
  finally
    VAlunoDAO.Free;
  end;
end;

procedure TAlunoModelo.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TAlunoModelo.SetMatricula(const Value: Integer);
begin
  FMatricula := Value;
end;

procedure TAlunoModelo.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.