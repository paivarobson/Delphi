unit unEntidadeDAO;

interface

uses
  unDados, SqlExpr, SysUtils, DBClient, Classes, Dialogs, DB,
  StdCtrls, unEntidadeModelo;

type
  TEntidadeDAO = class
    FDataModule: Tfmdados;
  protected
    FClientDS: TClientDataSet;

    function GetEstadoClientDS: TDataSetState; virtual;
//    procedure CarregarDadosParaClientDS(AEscolaModelo: TEscolaModelo);

  public
    destructor Destroy; override;

    procedure AbrirConexaoClientDS; virtual;
    procedure FecharConexaoClientDS; virtual;
//    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
    procedure CarregarEntidadePadrao(AEntidadeModelo: TEntidadeModelo);
//    procedure GravarEscolaClientDS;
    procedure NovoCadastroClientDS; virtual;
    procedure AlterarEscolaClientDS; virtual;
    procedure CancelarEdicaoClientDS; virtual;
    procedure ExcluirClientDS; virtual;
    procedure LimparDadosClientDS; virtual;
    procedure DesabilitarFilteredClientDS; virtual;
    procedure HabilitarFilteredClientDS; virtual;
    procedure CarregarTodosRegistrosClientDS; virtual;
//    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

    function DevolverUltimoCodigo: Integer; virtual;
//    function Gravar(AEscola: TEscolaModelo): Boolean;
    function ValidarCampos: Boolean; virtual;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; virtual;
    function StatusInsertEditClientDS: Boolean; virtual;
    function VerificaClientDSSeEstaAtivo: Boolean; virtual;

    function ClientDS: TClientDataSet; virtual;
    property EstadoClientDS: TDataSetState read GetEstadoClientDS;
  end;

implementation

destructor TEntidadeDAO.Destroy;
begin
  FreeAndNil(FClientDS);
  inherited;
end;

//COLOCAR PARAMENTRO PRA ENTRAR COM O CLIENTDATASET A SER USADO NO DATAMODULE (AClientDataSet:  TClientDataSet)
function TEntidadeDAO.GetEstadoClientDS: TDataSetState;
begin
  Result := fmdados.EstadoClientDS(ClientDS);
end;

end.
