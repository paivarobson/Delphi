unit unCadEscolaController;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB, unCadPadraoController;

type
    TCadEscolaController = class(TCadPadraoController)
  private
    FEscolaModelo: TEscolaModelo;
    procedure SetEscolaModelo(const Value: TEscolaModelo);
  public
    constructor Create;
    destructor Destroy; override;

    function DevolverUltimoCodigo: Integer; override;
//    function CarregarDadosParaClientDS: Boolean; override;
    function ValidarCampos: Boolean; override;
    function Gravar: Boolean; override;
    function StatusInsertEditClientDS: Boolean; override;

    procedure LimparCamposModelo; override;
    procedure LimparDadosClientDS; override;
    procedure NovoCadastroClientDS; override;
    procedure AlterarClientDS; override;
    procedure ExcluirClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure CarregarEntidadeModeloDoClientDS; override;
    function ConsultaEntidadePorCodigo: Boolean;
    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;
    
    function EstadoClientDS: TDataSetState; override;
    function ClientDSPossuiDado: Boolean;
    
    property EscolaModelo: TEscolaModelo read FEscolaModelo write SetEscolaModelo;
    
  end;

implementation

uses
  unSistemaControle;

constructor TCadEscolaController.Create;
begin
  EscolaModelo := TEscolaModelo.Create;
end;

destructor TCadEscolaController.Destroy;
begin
  FreeAndNil(FEscolaModelo);
  inherited;
end;

//function TCadEscolaController.VerificaClientDSSeEstaAtivo: Boolean;
//begin
//  Result := EscolaModelo.VerificaClientDSSeEstaAtivo;
//end;

procedure TCadEscolaController.CancelarEdicaoClientDS;
begin
  EscolaModelo.CancelarEdicaoClientDS;
end;

procedure TCadEscolaController.CarregarEntidadeModeloDoClientDS;
begin
  inherited;
  EscolaModelo.CarregarEntidadeModeloDoClientDS;
end;

function TCadEscolaController.ClientDSPossuiDado: Boolean;
begin
  ConsultaEntidadePorCodigo;
  Result := EscolaModelo.ClientDSPossuiDado;
end;

function TCadEscolaController.ConsultaEntidadePorCodigo: Boolean;
begin
  Result :=  EscolaModelo.ConsultaEntidadePorCodigo;
end;

//procedure TCadEscolaController.NovoCadastroClientDS;
//begin
//  EscolaModelo.NovoCadastroClientDS;
//end;


procedure TCadEscolaController.SetEscolaModelo(const Value: TEscolaModelo);
begin
  FEscolaModelo := Value;
end;

function TCadEscolaController.StatusInsertEditClientDS: Boolean;
begin
  inherited;
  Result := EscolaModelo.StatusInsertEditClientDS;
end;

function TCadEscolaController.ValidarCampos: Boolean;
begin
  inherited;
  Result := EscolaModelo.ValidarCampos;
end;

//Método GRAVAR
function TCadEscolaController.Gravar: Boolean;
begin
  inherited;
  Result := EscolaModelo.Gravar;
end;

//Método CANCELAR
//Método EXCLUIR
procedure TCadEscolaController.ExcluirClientDS;
begin
  inherited;
  EscolaModelo.ExcluirClientDS;
end;

procedure TCadEscolaController.FecharConexaoClientDS;
begin
  inherited;
  EscolaModelo.FecharConexaoClientDS;
end;

function TCadEscolaController.EstadoClientDS: TDataSetState;
begin
  inherited;
  Result := EscolaModelo.EstadoClientDS;
end;

procedure TCadEscolaController.AbrirConexaoClientDS;
begin
  inherited;
  EscolaModelo.AbrirConexaoClientDS;
end;

procedure TCadEscolaController.AlterarClientDS;
begin
  inherited;
  EscolaModelo.AlterarClientDS;
end;

//Método para o uso do ClientDataSet externamente

//Método para limpar os dados direto no ClientDataSet
procedure TCadEscolaController.LimparCamposModelo;
begin
  inherited;
  EscolaModelo.LimparCamposModelo;
end;

procedure TCadEscolaController.LimparDadosClientDS;
begin
  inherited;
  EscolaModelo.LimparDadosClientDS;
end;

procedure TCadEscolaController.NovoCadastroClientDS;
begin
  inherited;
  EscolaModelo.NovoCadastroClientDS;
end;

//Método verificador do último CÓDIGO registrado no BD 
function TCadEscolaController.DevolverUltimoCodigo: Integer;
begin
  Result := EscolaModelo.DevolverUltimoCodigo;
end;

end.
