unit unPesquisaEscolaController;

interface

uses DB, DBClient, StdCtrls, unEscolaModelo, SysUtils;

type
    TPesquisaEscolaController = class
  private
    FEscolaModelo: TEscolaModelo;
    procedure SetEscolaModelo(const Value: TEscolaModelo);

  public
    constructor Create;
    destructor Destroy; override;

    procedure AbrirConexaoClientDS;
    procedure FecharConexaoClientDS;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);
    procedure DesabilitarFilteredClientDS;
    procedure CarregarTodosRegistrosClientDS;
    procedure HabilitarFilteredClientDS;
    procedure CarregarEscola;

    function DadosCDS: TClientDataSet;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean;
//    function VerificaClientDSSeEstaAtivo: Boolean;

    property EscolaModelo: TEscolaModelo read FEscolaModelo write SetEscolaModelo;
  end;

implementation


uses
  unDados;

constructor TPesquisaEscolaController.Create;
begin
  EscolaModelo := TEscolaModelo.Create;
end;

destructor TPesquisaEscolaController.Destroy;
begin
  FreeAndNil(FEscolaModelo);
  inherited;
end;
  
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
//Método para ordenação da lista de consulta por CÓDIGO, DESCRIÇÃO ou DATA DE CADASTRO
procedure TPesquisaEscolaController.AbrirConexaoClientDS;
begin
  EscolaModelo.AbrirConexaoClientDS;
end;

procedure TPesquisaEscolaController.HabilitarFilteredClientDS;
begin
  EscolaModelo.HabilitarFilteredClientDS;
end;

//function TPesquisaEscolaController.VerificaClientDSSeEstaAtivo: Boolean;
//begin
//  Result := EscolaModelo.VerificaClientDSSeEstaAtivo;
//end;

function TPesquisaEscolaController.CarregarConsultaClientDS(
  ACampoTabelaFiltrado: string; ADado: string): Boolean;
begin
  Result := EscolaModelo.CarregarConsultaClientDS(ACampoTabelaFiltrado, ADado);
end;

procedure TPesquisaEscolaController.CarregarEscola;
begin
  EscolaModelo.CarregarEscola;
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
