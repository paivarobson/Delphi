unit unCadEscolaController;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB;

type
    TCadEscolaController = class
  private
    FEscolaModelo: TEscolaModelo;
    procedure SetEscolaModelo(const Value: TEscolaModelo);
    function GetEstadoClientDS: TDataSetState;
  public
    constructor Create;
    destructor Destroy; override;

    function DevolverUltimoCodigo: Integer;
    function CarregarDadosParaClientDS: Boolean;
    function ValidarCampos: Boolean;
    function Gravar: Boolean;
    function StatusInsertEditClientDS: Boolean;
    function VerificaClientDSSeEstaAtivo: Boolean;

    procedure LimparCampos;
    procedure LimparDadosClientDS;
    procedure NovoCadastroClientDS;
    procedure AlterarClientDS;
    procedure ExcluirClientDS;
    procedure CancelarEdicaoClientDS;
    procedure CarregarEscola;
    procedure AbrirConexaoClientDS;
    procedure FecharConexaoClientDS;

    property EstadoClientDS: TDataSetState read GetEstadoClientDS;
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

function TCadEscolaController.VerificaClientDSSeEstaAtivo: Boolean;
begin
  Result := EscolaModelo.VerificaClientDSSeEstaAtivo;
end;

procedure TCadEscolaController.CancelarEdicaoClientDS;
begin
  EscolaModelo.CancelarEdicaoClientDS;
end;

procedure TCadEscolaController.CarregarEscola;
begin
  EscolaModelo.CarregarEscola;
end;

procedure TCadEscolaController.NovoCadastroClientDS;
begin
  EscolaModelo.NovoCadastroClientDS;
end;

procedure TCadEscolaController.SetEscolaModelo(const Value: TEscolaModelo);
begin
  FEscolaModelo := Value;
end;

function TCadEscolaController.StatusInsertEditClientDS: Boolean;
begin
  Result := EscolaModelo.StatusInsertEditClientDS;
end;

function TCadEscolaController.ValidarCampos: Boolean;
begin
  Result := EscolaModelo.ValidarCampos;
end;

//M�todo GRAVAR
function TCadEscolaController.CarregarDadosParaClientDS: Boolean;
begin
  Result := EscolaModelo.CarregarDadosParaClientDS;
end;

//M�todo CANCELAR
//M�todo EXCLUIR
procedure TCadEscolaController.ExcluirClientDS;
begin
  EscolaModelo.ExcluirClientDS;
end;

procedure TCadEscolaController.FecharConexaoClientDS;
begin
  EscolaModelo.FecharConexaoClientDS;
end;

function TCadEscolaController.GetEstadoClientDS: TDataSetState;
begin
  Result := EscolaModelo.EstadoClientDS;
end;

function TCadEscolaController.Gravar: Boolean;
begin
  Result := FEscolaModelo.Gravar;
end;

procedure TCadEscolaController.AbrirConexaoClientDS;
begin
  EscolaModelo.AbrirConexaoClientDS;
end;

procedure TCadEscolaController.AlterarClientDS;
begin
  EscolaModelo.AlterarClientDS;
end;
//M�todo para o uso do ClientDataSet externamente

//M�todo para limpar os dados direto no ClientDataSet
procedure TCadEscolaController.LimparCampos;
begin
  EscolaModelo.LimparCampos;
end;

procedure TCadEscolaController.LimparDadosClientDS;
begin
  EscolaModelo.LimparDadosClientDS;
end;

//M�todo verificador do �ltimo C�DIGO registrado no BD 
function TCadEscolaController.DevolverUltimoCodigo: Integer;
begin
  Result := EscolaModelo.DevolverUltimoCodigo;
end;
end.
