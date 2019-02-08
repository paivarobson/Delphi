unit unAlunoDAO;

interface

uses
  SqlExpr, unConexao, unSistemaControle, SysUtils, Provider, DB,
  DbClient, unDados, unEntidadeDAO, unAlunoModelo, unValidacoes;


type
  TAlunoDAO = class(TEntidadeDAO)
  private
    procedure CarregarDadosParaClientDS(AAlunoModelo: TAlunoModelo);
  public               
    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;
    procedure CarregarEntidade(AAlunoModelo: TAlunoModelo);
    procedure GravarClientDS; override;
    procedure NovoCadastroClientDS; override;
    procedure AlterarClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure ExcluirClientDS; override;
    procedure LimparDadosClientDS; override;
    procedure DesabilitarFilteredClientDS; override;
    procedure HabilitarFilteredClientDS; override;
    procedure CarregarTodosRegistrosClientDS; override;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

    function DevolverUltimoCodigo: Integer; override;
    function Gravar(AAluno: TAlunoModelo): Boolean;
    function ValidarCampos: Boolean; override;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; override;
    function StatusInsertEditClientDS: Boolean; override;
    function VerificaClientDSSeEstaAtivo: Boolean; override;

    function ClientDS: TClientDataSet; override;
    function EstadoClientDS: TDataSetState; override;
  end;

implementation  


{ TAlunoDAO }

procedure TAlunoDAO.AbrirConexaoClientDS;
begin
  inherited;
  fmdados.AbrirConexaoClientDS(ClientDS);
end;

procedure TAlunoDAO.AlterarClientDS;
begin
  inherited;
  fmdados.AlterarClientDS(ClientDS);
end;

procedure TAlunoDAO.CancelarEdicaoClientDS;
begin
  inherited;
  fmdados.CancelarEdicaoClientDS(ClientDS);
end;

procedure TAlunoDAO.CarregarDadosParaClientDS(AAlunoModelo: TAlunoModelo);
begin
  ClientDS.FieldByName('ALUCOD').AsInteger := AAlunoModelo.Codigo;
  ClientDS.FieldByName('ALUMAT').AsString := AAlunoModelo.Matricula;
  ClientDS.FieldByName('ALUNOME').AsString := AAlunoModelo.Nome;
  ClientDS.FieldByName('ALUDATACAD').AsDateTime := AAlunoModelo.DataCadastro;
  ClientDS.FieldByName('ALUCPF').AsString := AAlunoModelo.Cpf;
  ClientDS.FieldByName('ALUNOMEMAE').AsString := AAlunoModelo.NomeMae;
  ClientDS.FieldByName('ALUNOMEPAI').AsString := AAlunoModelo.NomePai;
  ClientDS.FieldByName('ALUENDCEP').AsString := AAlunoModelo.Cep;
  ClientDS.FieldByName('ALUENDRUA').AsString := AAlunoModelo.Rua;
  ClientDS.FieldByName('ALUENDNUM').AsString := AAlunoModelo.Numero;
  ClientDS.FieldByName('ALUENDCOMP').AsString := AAlunoModelo.Complemento;
  ClientDS.FieldByName('ALUENDBAIRRO').AsString := AAlunoModelo.Bairro;
  ClientDS.FieldByName('ALUENDCIDADE').AsString := AAlunoModelo.Cidade;
end;

procedure TAlunoDAO.CarregarTodosRegistrosClientDS;
begin
  inherited;
  fmdados.CarregarTodosRegistrosClientDS(ClientDS);
end;

function TAlunoDAO.ClientDS: TClientDataSet;
begin
  Result := fmdados.ClientDSAluno;
end;

function TAlunoDAO.CarregarConsultaClientDS(ACampoTabelaFiltrado,
  ADado: string): Boolean;
begin
  if ClientDS.Locate(ACampoTabelaFiltrado, ADado, []) then
  begin
    ClientDS.Filtered := False;
    ClientDS.Filter := ACampoTabelaFiltrado + ' = ' + QuotedStr(ADado); //Aplicação do filtro
    ClientDS.Filtered := True;
    Result := True;
  end
  else
    Result := False
end;

procedure TAlunoDAO.CarregarEntidade(AAlunoModelo: TAlunoModelo);
begin
  AAlunoModelo.Codigo := ClientDS.Fields[0].AsInteger;
  AAlunoModelo.Nome := ClientDS.Fields[1].AsString;
  AAlunoModelo.DataCadastro := ClientDS.Fields[2].AsDateTime;
  AAlunoModelo.Cpf := ClientDS.Fields[3].AsString;
  AAlunoModelo.NomeMae := ClientDS.Fields[4].AsString;
  AAlunoModelo.NomePai := ClientDS.Fields[5].AsString;
  AAlunoModelo.Cep := ClientDS.Fields[6].AsString;
  AAlunoModelo.Rua := ClientDS.Fields[7].AsString;
  AAlunoModelo.Numero := ClientDS.Fields[8].AsString;
  AAlunoModelo.Complemento := ClientDS.Fields[9].AsString;
  AAlunoModelo.Bairro := ClientDS.Fields[10].AsString;
  AAlunoModelo.Cidade := ClientDS.Fields[11].AsString;
end;

procedure TAlunoDAO.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  case AIndiceComboBox of
    0: ClientDS.IndexFieldNames := 'ALUCOD'; //Ordena por CÓDIGO
    1: ClientDS.IndexFieldNames := 'ALUNOME'; //Ordena por DESCRIÇÃO
    2: ClientDS.IndexFieldNames := 'ALUDATACAD'; //Ordena por DATA DE CADASTRO
  end;
end;

procedure TAlunoDAO.DesabilitarFilteredClientDS;
begin
  inherited;
  fmdados.DesabilitarFilteredClientDS(ClientDS);
end;

function TAlunoDAO.DevolverUltimoCodigo: Integer;
begin
  Result := fmdados.DevolverUltimoCodigo('ALUCOD', 'ALUNO');
end;

function TAlunoDAO.EstadoClientDS: TDataSetState;
begin
  Result := fmdados.EstadoClientDS(ClientDS);
end;

procedure TAlunoDAO.ExcluirClientDS;
begin
  inherited;
  fmdados.ExcluirClientDS(ClientDS);
end;

procedure TAlunoDAO.FecharConexaoClientDS;
begin
  inherited;
  fmdados.FecharConexaoClientDS(ClientDS);
end;

function TAlunoDAO.Gravar(AAluno: TAlunoModelo): Boolean;
begin
  CarregarDadosParaClientDS(AAluno);
  Result := fmdados.GravarDB(ClientDS);
end;

procedure TAlunoDAO.GravarClientDS;
begin
  inherited;
  fmdados.GravarDB(ClientDS);
end;

procedure TAlunoDAO.HabilitarFilteredClientDS;
begin
  inherited;
  fmdados.HabilitarFilteredClientDS(ClientDS);
end;

procedure TAlunoDAO.LimparDadosClientDS;
begin
  inherited;
  fmdados.LimparDadosClientDS(ClientDS);
end;

procedure TAlunoDAO.NovoCadastroClientDS;
begin
  inherited;
  fmdados.NovoCadastroClientDS(ClientDS);
end;

function TAlunoDAO.StatusInsertEditClientDS: Boolean;
begin
  Result := fmdados.StatusInsertEditClientDS(ClientDS);
end;

function TAlunoDAO.ValidarCampos: Boolean;
begin
  Result := TValidacoes.ValidarCampos(ClientDS);
end;

function TAlunoDAO.VerificaClientDSSeEstaAtivo: Boolean;
begin
  Result := fmdados.VerificaClientDSSeEstaAtivo(ClientDS);
end;

end.
