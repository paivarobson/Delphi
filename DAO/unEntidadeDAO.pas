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

//    procedure CarregarDadosParaClientDS(AEscolaModelo: TEscolaModelo);

  public
    destructor Destroy; override;

    procedure AbrirConexaoClientDS; virtual; abstract;
    procedure FecharConexaoClientDS; virtual; abstract;
//    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
//    procedure CarregarEntidade(AEntidadeModelo: TEntidadeModelo); virtual; abstract;
    procedure GravarEscolaClientDS; virtual; abstract;
    procedure NovoCadastroClientDS; virtual; abstract;
    procedure AlterarEscolaClientDS; virtual; abstract;
    procedure CancelarEdicaoClientDS; virtual; abstract;
    procedure ExcluirClientDS; virtual; abstract;
    procedure LimparDadosClientDS; virtual; abstract;
    procedure DesabilitarFilteredClientDS; virtual; abstract;
    procedure HabilitarFilteredClientDS; virtual; abstract;
    procedure CarregarTodosRegistrosClientDS; virtual; abstract;
//    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

    function DevolverUltimoCodigo: Integer; virtual; abstract;
//    function Gravar(AEscola: TEscolaModelo): Boolean;
    function ValidarCampos: Boolean; virtual; abstract;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; virtual; abstract;
    function StatusInsertEditClientDS: Boolean; virtual; abstract;
    function VerificaClientDSSeEstaAtivo: Boolean; virtual; abstract;

    function ClientDS: TClientDataSet; virtual; abstract;
    function EstadoClientDS: TDataSetState; virtual; abstract;
  end;

implementation

destructor TEntidadeDAO.Destroy;
begin
  FreeAndNil(FClientDS);
  inherited;
end;

//COLOCAR PARAMENTRO PRA ENTRAR COM O CLIENTDATASET A SER USADO NO DATAMODULE (AClientDataSet:  TClientDataSet)
//function TEntidadeDAO.GetEstadoClientDS: TDataSetState;
//begin
//  Result := fmdados.EstadoClientDS(ClientDS);
//end;

end.
