unit unPesquisaEscolaController;

interface

uses DB, DBClient, StdCtrls, unEscolaModelo;

type
    TPesquisaEscolaController = class
  private
    FEscolaModelo: TEscolaModelo;
    procedure SetEscolaModelo(const Value: TEscolaModelo);

  public
    procedure AbrirConexaoClientDS;
    procedure FecharConexaoClientDS;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);
    procedure DesabilitarFilteredClientDS;
    procedure CarregarTodosRegistrosClientDS;
    procedure HabilitarFilteredClientDS;

    function DadosCDS: TClientDataSet;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean;

    property EscolaModelo: TEscolaModelo read FEscolaModelo write SetEscolaModelo;
  end;

implementation


uses
  unDados;

function TPesquisaEscolaController.DadosCDS: TClientDataSet;
begin
  Result := fmdados.ClientDSEscola;
end;

procedure TPesquisaEscolaController.FecharConexaoClientDS;
begin
  EscolaModelo.FecharConexaoClientDS;
end;

procedure TPesquisaEscolaController.DesabilitarFilteredClientDS;
begin
  EscolaModelo.DesabilitarFilteredClientDS;
end;

procedure TPesquisaEscolaController.SetEscolaModelo(const Value: TEscolaModelo);
begin
  FEscolaModelo := Value;
end;
//M�todo para ordena��o da lista de consulta por C�DIGO, DESCRI��O ou DATA DE CADASTRO
procedure TPesquisaEscolaController.AbrirConexaoClientDS;
begin
  EscolaModelo.AbrirConexaoClientDS;
end;

procedure TPesquisaEscolaController.HabilitarFilteredClientDS;
begin
  EscolaModelo.HabilitarFilteredClientDS;
end;

function TPesquisaEscolaController.CarregarConsultaClientDS(
  ACampoTabelaFiltrado: string; ADado: string): Boolean;
begin
  Result := EscolaModelo.CarregarConsultaClientDS(ACampoTabelaFiltrado, ADado);
end;

procedure TPesquisaEscolaController.CarregarTodosRegistrosClientDS;
begin
  EscolaModelo.CarregarTodosRegistrosClientDS;
end;

procedure TPesquisaEscolaController.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  EscolaModelo.ConsultaOrdenada(AIndiceComboBox);
end;

end.
