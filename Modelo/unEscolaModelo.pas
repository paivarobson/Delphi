unit unEscolaModelo;

interface

uses
  SysUtils, Forms, Classes, Dialogs, DBClient, StdCtrls, DB, unEntidadeModelo;

type
  TEscolaModelo = class(TEntidadeModelo)
  private
    FCodigo: Integer;
    FNome: string;
    FDataCadastro: TDateTime;
    FCep: string;
    FRua: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    procedure SetCodigo(const Valor: Integer);
    procedure SetNome(const Valor: string);
    procedure SetDataCadastro(const Valor: TDateTime);
    procedure SetCep(const Valor: string);
    procedure SetRua(const Valor: string);
    procedure SetNumero(const Valor: string);
    procedure SetComplemento(const Valor: string);
    procedure SetBairro(const Valor: string);
    procedure SetCidade(const Valor: string);
    function GetCodigo: Integer;
    function GetNome: string;
    function GetDataCadastro: TDateTime;
    function GetCep: string;
    function GetRua: string;
    function GetNumero: string;
    function GetComplemento: string;
    function GetBairro: string;
    function GetCidade: string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AfterConstruction; override;

    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;
    procedure CarregarEntidadeModeloDoClientDS; override;
    procedure NovoCadastroClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure AlterarClientDS; override;
    procedure ExcluirClientDS; override;
    procedure GravarClientDS; override;
    procedure LimparCamposModelo; override;
    procedure LimparDadosClientDS; override;
    procedure DesabilitarFilteredClientDS; override;
    procedure HabilitarFilteredClientDS; override;
    procedure CarregarTodosRegistrosClientDS; override;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer); override;

    function DevolverUltimoCodigo: Integer; override;
//    function CarregarDadosParaClientDS: Boolean; override;
    function ValidarCampos: Boolean; override;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; override;
    function ConsultaEntidadePorCodigo: Boolean;
    function StatusInsertEditClientDS: Boolean; override;
    function ClientDSPossuiDado: Boolean;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property DataCadastro: TDateTime read GetDataCadastro write SetDataCadastro;
    property Cep: string read GetCep write SetCep;
    property Rua: string read GetRua write SetRua;
    property Numero: string read GetNumero write SetNumero;
    property Complemento: string read GetComplemento write SetComplemento;
    property Bairro: string read GetBairro write SetBairro;
    property Cidade: string read GetCidade write SetCidade;

    function EstadoClientDS: TDataSetState; override;

    function Gravar: Boolean; override;
  end;


implementation

uses
  unEscolaDAO;
  
var
  FEscolaDAO: TEscolaDAO = nil;

procedure TEscolaModelo.AbrirConexaoClientDS;
begin
  FEscolaDAO.AbrirConexaoClientDS;
end;

procedure TEscolaModelo.AfterConstruction;
begin
  inherited;
  FEscolaDAO := TEscolaDAO.Create;
end;

procedure TEscolaModelo.AlterarClientDS;
begin
  FEscolaDAO.AlterarClientDS;
end;

//function TEscolaModelo.VerificaClientDSSeEstaAtivo: Boolean;
//begin
//  Result := FEscolaDao.VerificaClientDSSeEstaAtivo;
//end;

procedure TEscolaModelo.CancelarEdicaoClientDS;
begin
  FEscolaDAO.CancelarEdicaoClientDS;
end;

procedure TEscolaModelo.CarregarEntidadeModeloDoClientDS;
begin
  FEscolaDAO.CarregarEntidadeModeloDoClientDS(Self);
end;

function TEscolaModelo.DevolverUltimoCodigo: Integer;
begin
  Result := FEscolaDAO.DevolverUltimoCodigo;
end;

function TEscolaModelo.EstadoClientDS: TDataSetState;
begin
  Result := FEscolaDAO.EstadoClientDS;
end;

procedure TEscolaModelo.ExcluirClientDS;
begin
  FEscolaDAO.ExcluirClientDS;
end;

procedure TEscolaModelo.FecharConexaoClientDS;
begin
  FEscolaDAO.FecharConexaoClientDS;
end;

procedure TEscolaModelo.SetCodigo(const Valor: Integer);
begin
  FCodigo := Valor;
end;

procedure TEscolaModelo.SetNome(const Valor: string);
begin
  FNome := Valor;
end;

procedure TEscolaModelo.SetCep(const Valor: string);
begin
  FCep := Valor;
end;

procedure TEscolaModelo.SetDataCadastro(const Valor: TDateTime);
begin
  FDataCadastro := Valor;
end;

procedure TEscolaModelo.SetRua(const Valor: string);
begin
  FRua := Valor;
end;

function TEscolaModelo.StatusInsertEditClientDS: Boolean;
begin
  Result := FEscolaDAO.StatusInsertEditClientDS;
end;

function TEscolaModelo.ValidarCampos: Boolean;
begin
  Result := FEscolaDAO.ValidarCampos;
end;

procedure TEscolaModelo.SetNumero(const Valor: string);
begin
  FNumero := Valor;
end;

procedure TEscolaModelo.SetComplemento(const Valor: string);
begin
  FComplemento := Valor;
end;


procedure TEscolaModelo.SetBairro(const Valor: string);
begin
  FBairro := Valor;
end;

procedure TEscolaModelo.SetCidade(const Valor: string);
begin
  FCidade := Valor;
end;

function TEscolaModelo.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TEscolaModelo.GetNome: string;
begin
  Result := FNome;
end;

function TEscolaModelo.GetDataCadastro: TDateTime;
begin
  Result := FDataCadastro;
end;

function TEscolaModelo.GetRua: string;
begin
  Result := FRua;
end;

procedure TEscolaModelo.GravarClientDS;
begin
  FEscolaDAO.GravarClientDS;
end;

function TEscolaModelo.Gravar: Boolean;
begin
  Result := FEscolaDAO.Gravar(Self);
end;

procedure TEscolaModelo.LimparCamposModelo;
begin
  Nome := '';
  Cep := '';
  Rua := '';
  Numero := '';
  Complemento := '';
  Bairro := '';
  Cidade := '';
end;

procedure TEscolaModelo.LimparDadosClientDS;
begin
  FEscolaDAO.LimparDadosClientDS;
end;

procedure TEscolaModelo.DesabilitarFilteredClientDS;
begin
  FEscolaDAO.DesabilitarFilteredClientDS;
end;
//
//function TEscolaModelo.CarregarDadosParaClientDS: Boolean;
//begin
//  Result := FEscolaDAO.Gravar(Self);
//end;

function TEscolaModelo.CarregarConsultaClientDS(ACampoTabelaFiltrado: string;
  ADado: string): Boolean;
begin
  Result := FEscolaDAO.CarregarConsultaClientDS(ACampoTabelaFiltrado, ADado);
end;

procedure TEscolaModelo.HabilitarFilteredClientDS;
begin
  FEscolaDAO.HabilitarFilteredClientDS;
end;

procedure TEscolaModelo.CarregarTodosRegistrosClientDS;
begin
  FEscolaDAO.CarregarTodosRegistrosClientDS;
end;

function TEscolaModelo.ClientDSPossuiDado: Boolean;
begin
  Result := FEscolaDAO.ClientDSPossuiDado;
end;

procedure TEscolaModelo.NovoCadastroClientDS;
begin
  FEscolaDAO.NovoCadastroClientDS;
end;

function TEscolaModelo.GetNumero: string;
begin
  Result := FNumero;
end;

function TEscolaModelo.GetComplemento: string;
begin
  Result := FComplemento;
end;

function TEscolaModelo.GetBairro: string;
begin
  Result := FBairro;
end;

function TEscolaModelo.GetCep: string;
begin
  Result := FCep;
end;

function TEscolaModelo.GetCidade: string;
begin
  Result := FCidade;
end;

function TEscolaModelo.ConsultaEntidadePorCodigo: Boolean;
begin
  Result := FEscolaDAO.ConsultaEntidadePorCodigo(Self, Codigo);
end;

procedure TEscolaModelo.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  FEscolaDAO.ConsultaOrdenada(AIndiceComboBox);
end;

constructor TEscolaModelo.Create;
begin
  FEscolaDAO := TEscolaDAO.Create;
end;

destructor TEscolaModelo.Destroy;
begin
  FreeAndNil(FEscolaDao);
  inherited;
end;

end.
