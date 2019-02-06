unit unAlunoModelo;

interface

uses
  SqlExpr, Provider, DB, unEntidadeModelo, SysUtils;

type
  TAlunoModelo = class(TEntidadeModelo)
  private
    FNomePai: string;
    FBairro: string;
    FCodigo: Integer;
    FCpf: string;
    FCep: string;
    FNumero: string;
    FComplemento: string;
    FDataCadastro: TDateTime;
    FNomeMae: string;
    FNome: string;
    FMatricula: string;
    FCidade: string;
    FRua: string;
    procedure SetBairro(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetComplemento(const Value: string);
    procedure SetCpf(const Value: string);
    procedure SetDataCadastro(const Value: TDateTime);
    procedure SetMatricula(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeMae(const Value: string);
    procedure SetNomePai(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetRua(const Value: string);

  public
    destructor Destroy; override;

    procedure AfterConstruction; override;

    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;
    procedure CarregarEntidade; override;
    procedure NovoCadastroClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure AlterarClientDS; override;
    procedure ExcluirClientDS; override;
    procedure GravarClientDS; override;
    procedure LimparCampos; override;
    procedure LimparDadosClientDS; override;
    procedure DesabilitarFilteredClientDS; override;
    procedure HabilitarFilteredClientDS; override;
    procedure CarregarTodosRegistrosClientDS; override;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer); override;

    function DevolverUltimoCodigo: Integer; override;
//    function CarregarDadosParaClientDS: Boolean; override;
    function ValidarCampos: Boolean; override;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; override;
    function StatusInsertEditClientDS: Boolean; override;
    
    property Codigo: Integer read FCodigo write SetCodigo;
    property Matricula: string read FMatricula write SetMatricula;
    property Nome: string read FNome write SetNome;
    property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
    property Cpf: string read FCpf write SetCpf;
    property NomeMae: string read FNomeMae write SetNomeMae;
    property NomePai: string read FNomePai write SetNomePai;
    property Cep: string read FCep write SetCep;
    property Rua: string read FRua write SetRua;
    property Numero: string read FNumero write SetNumero;
    property Complemento: string read FComplemento write SetComplemento;
    property Bairro: string read FBairro write SetBairro;
    property Cidade: string read FCidade write SetCidade;

    function EstadoClientDS: TDataSetState; override;

    function Gravar: Boolean; override;
    
  end;

implementation

uses
  unAlunoDAO;
  
var
  FAlunoDAO: TAlunoDAO = nil;
  
procedure TAlunoModelo.AbrirConexaoClientDS;
begin
  inherited;
  FAlunoDAO.AbrirConexaoClientDS;
end;

procedure TAlunoModelo.AfterConstruction;
begin
  inherited;
  FAlunoDAO := TAlunoDAO.Create;
end;

procedure TAlunoModelo.AlterarClientDS;
begin
  inherited;
  FAlunoDAO.AlterarClientDS;
end;

procedure TAlunoModelo.CancelarEdicaoClientDS;
begin
  inherited;

end;

function TAlunoModelo.CarregarConsultaClientDS(ACampoTabelaFiltrado,
  ADado: string): Boolean;
begin
  Result := FAlunoDAO.CarregarConsultaClientDS(ACampoTabelaFiltrado, ADado);
end;

function TAlunoModelo.Gravar: Boolean;
begin
  Result := FAlunoDAO.Gravar(Self);
end;

procedure TAlunoModelo.CarregarEntidade;
begin
  inherited;
  FAlunoDAO.CarregarEntidade(Self);
end;

procedure TAlunoModelo.CarregarTodosRegistrosClientDS;
begin
  inherited;
  FAlunoDAO.CarregarTodosRegistrosClientDS;
end;

procedure TAlunoModelo.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  inherited;
  FAlunoDAO.ConsultaOrdenada(AIndiceComboBox);
end;

procedure TAlunoModelo.DesabilitarFilteredClientDS;
begin
  inherited;
  FAlunoDAO.DesabilitarFilteredClientDS;
end;

destructor TAlunoModelo.Destroy;
begin
//  FreeAndNil(FAlunoDAO);
  inherited;
end;

function TAlunoModelo.DevolverUltimoCodigo: Integer;
begin
  Result := FAlunoDAO.DevolverUltimoCodigo;
end;

function TAlunoModelo.EstadoClientDS: TDataSetState;
begin
  Result := FAlunoDAO.EstadoClientDS;
end;

procedure TAlunoModelo.ExcluirClientDS;
begin
  inherited;
  FAlunoDAO.ExcluirClientDS;
end;

procedure TAlunoModelo.FecharConexaoClientDS;
begin
  inherited;
  FAlunoDAO.FecharConexaoClientDS;
end;

procedure TAlunoModelo.GravarClientDS;
begin
  inherited;
  FAlunoDAO.GravarClientDS;
end;

procedure TAlunoModelo.HabilitarFilteredClientDS;
begin
  inherited;
  FAlunoDAO.HabilitarFilteredClientDS;
end;

procedure TAlunoModelo.LimparCampos;
begin
  inherited;
  Matricula := '';
  Nome := '';
  Cpf := '';
  NomeMae := '';
  NomePai := '';
  Cep := '';
  Rua := '';
  Numero := '';
  Complemento := '';
  Bairro := '';
  Cidade := '';
end;

procedure TAlunoModelo.LimparDadosClientDS;
begin
  inherited;
  FAlunoDAO.LimparDadosClientDS;
end;

procedure TAlunoModelo.NovoCadastroClientDS;
begin
  inherited;
  FAlunoDAO.NovoCadastroClientDS;
end;

procedure TAlunoModelo.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TAlunoModelo.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TAlunoModelo.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TAlunoModelo.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAlunoModelo.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TAlunoModelo.SetCpf(const Value: string);
begin
  FCpf := Value;
end;

procedure TAlunoModelo.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TAlunoModelo.SetMatricula(const Value: string);
begin
  FMatricula := Value;
end;

procedure TAlunoModelo.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TAlunoModelo.SetNomeMae(const Value: string);
begin
  FNomeMae := Value;
end;

procedure TAlunoModelo.SetNomePai(const Value: string);
begin
  FNomePai := Value;
end;

procedure TAlunoModelo.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TAlunoModelo.SetRua(const Value: string);
begin
  FRua := Value;
end;

function TAlunoModelo.StatusInsertEditClientDS: Boolean;
begin
  Result := FAlunoDAO.StatusInsertEditClientDS;
end;

function TAlunoModelo.ValidarCampos: Boolean;
begin
  Result := FAlunoDAO.ValidarCampos;
end;

end.
