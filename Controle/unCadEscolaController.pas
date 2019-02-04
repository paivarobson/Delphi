unit unCadEscolaController;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB, unCadPadraoController;

type
    TCadEscolaController = class(TCadPadraoController)
  private
    FEscolaModelo: TEscolaModelo;
    FControladorPadrao: TCadPadraoController;
    procedure SetEscolaModelo(const Value: TEscolaModelo);
    procedure SetControladorPadrao(const Value: TCadPadraoController);
//    function GetEstadoClientDS: TDataSetState;
  public
    constructor Create;
    destructor Destroy; override;

    function DevolverUltimoCodigo: Integer; override;
    function CarregarDadosParaClientDS: Boolean; override;
    function ValidarCampos: Boolean; override;
    function Gravar: Boolean; override;
    function StatusInsertEditClientDS: Boolean; override;
//    function VerificaClientDSSeEstaAtivo: Boolean; override;

    procedure LimparCampos; override;
    procedure LimparDadosClientDS; override;
    procedure NovoCadastroClientDS; override;
    procedure AlterarEscolaClientDS; override;
    procedure ExcluirClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure CarregarEscola; override;
    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;

    function EstadoClientDS: TDataSetState; override;

    property EscolaModelo: TEscolaModelo read FEscolaModelo write SetEscolaModelo;
    property ControladorPadrao: TCadPadraoController read FControladorPadrao write SetControladorPadrao;
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

procedure TCadEscolaController.CarregarEscola;
begin
  EscolaModelo.CarregarEscola;
end;

//procedure TCadEscolaController.NovoCadastroClientDS;
//begin
//  EscolaModelo.NovoCadastroClientDS;
//end;

procedure TCadEscolaController.SetControladorPadrao(
  const Value: TCadPadraoController);
begin
  FControladorPadrao := Value;
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

//Método GRAVAR
function TCadEscolaController.CarregarDadosParaClientDS: Boolean;
begin
  Result := EscolaModelo.CarregarDadosParaClientDS;
end;

//Método CANCELAR
//Método EXCLUIR
procedure TCadEscolaController.ExcluirClientDS;
begin
  EscolaModelo.ExcluirClientDS;
end;

procedure TCadEscolaController.FecharConexaoClientDS;
begin
  EscolaModelo.FecharConexaoClientDS;
end;

function TCadEscolaController.EstadoClientDS: TDataSetState;
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

procedure TCadEscolaController.AlterarEscolaClientDS;
begin
  inherited;
  EscolaModelo.AlterarEscolaClientDS;
end;

//Método para o uso do ClientDataSet externamente

//Método para limpar os dados direto no ClientDataSet
procedure TCadEscolaController.LimparCampos;
begin
  EscolaModelo.LimparCampos;
end;

procedure TCadEscolaController.LimparDadosClientDS;
begin
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
