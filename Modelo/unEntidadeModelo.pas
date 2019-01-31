unit unEntidadeModelo;

interface

uses
  SysUtils, Classes, Dialogs, DBClient, StdCtrls, DB;

type
  TEntidadeModelo = class
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
    procedure SetCodigo(const Valor: Integer); virtual;
    procedure SetNome(const Valor: string); virtual;
    procedure SetDataCadastro(const Valor: TDateTime); virtual;
    procedure SetCep(const Valor: string); virtual;
    procedure SetRua(const Valor: string); virtual;
    procedure SetNumero(const Valor: string); virtual;
    procedure SetComplemento(const Valor: string); virtual;
    procedure SetBairro(const Valor: string); virtual;
    procedure SetCidade(const Valor: string); virtual;
    function GetCodigo: Integer; virtual;
    function GetNome: string; virtual;
    function GetDataCadastro: TDateTime; virtual;
    function GetCep: string; virtual;
    function GetRua: string; virtual;
    function GetNumero: string; virtual;
    function GetComplemento: string; virtual;
    function GetBairro: string; virtual;
    function GetCidade: string; virtual;
//    function GetEstadoClientDS: TDataSetState; virtual;
  public
//    procedure AbrirConexaoClientDS;
//    procedure FecharConexaoClientDS;
    class procedure CarregarEntidadePadrao;
//    procedure NovoCadastroClientDS;
//    procedure CancelarEdicaoClientDS;
//    procedure AlterarClientDS;
//    procedure ExcluirClientDS;
//    procedure GravarEscolaClientDS;
//    procedure LimparCampos;
//    procedure LimparDadosClientDS;
//    procedure DesabilitarFilteredClientDS;
//    procedure HabilitarFilteredClientDS;
//    procedure CarregarTodosRegistrosClientDS;
//    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

//    function ObterClientDS: TClientDataSet;
//    function DevolverUltimoCodigo: Integer;
//    function CarregarDadosParaClientDS: Boolean;
    function ValidarCampos: Boolean;
//    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean;
//    function StatusInsertEditClientDS: Boolean;
//    function VerificaClientDSSeEstaAtivo: Boolean;

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property DataCadastro: TDateTime read GetDataCadastro write SetDataCadastro;
    property Cep: string read GetCep write SetCep;
    property Rua: string read GetRua write SetRua;
    property Numero: string read GetNumero write SetNumero;
    property Complemento: string read GetComplemento write SetComplemento;
    property Bairro: string read GetBairro write SetBairro;
    property Cidade: string read GetCidade write SetCidade;

//    property EstadoClientDS: TDataSetState read GetEstadoClientDS;
//
//    function Gravar: Boolean;
  end;

implementation

uses
  unEntidadeDAO;

var
  FEntidadeDAO: TEntidadeDAO = nil;

//function TEntidadeModelo.GetEstadoClientDS: TDataSetState;
//begin
//  Result := FEntidadeDao.EstadoClientDS;
//end;

procedure TEntidadeModelo.SetCodigo(const Valor: Integer);
begin
  FCodigo := Valor;
end;

procedure TEntidadeModelo.SetNome(const Valor: string);
begin
  FNome := Valor;
end;

procedure TEntidadeModelo.SetCep(const Valor: string);
begin
  FCep := Valor;
end;

procedure TEntidadeModelo.SetDataCadastro(const Valor: TDateTime);
begin
  FDataCadastro := Valor;
end;

procedure TEntidadeModelo.SetRua(const Valor: string);
begin
  FRua := Valor;
end;

function TEntidadeModelo.ValidarCampos: Boolean;
begin
  Result := FEntidadeDAO.ValidarCampos;
end;

procedure TEntidadeModelo.SetNumero(const Valor: string);
begin
  FNumero := Valor;
end;

procedure TEntidadeModelo.SetComplemento(const Valor: string);
begin
  FComplemento := Valor;
end;


procedure TEntidadeModelo.SetBairro(const Valor: string);
begin
  FBairro := Valor;
end;

procedure TEntidadeModelo.SetCidade(const Valor: string);
begin
  FCidade := Valor;
end;

function TEntidadeModelo.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TEntidadeModelo.GetNome: string;
begin
  Result := FNome;
end;

function TEntidadeModelo.GetDataCadastro: TDateTime;
begin
  Result := FDataCadastro;
end;

function TEntidadeModelo.GetRua: string;
begin
  Result := FRua;
end;

function TEntidadeModelo.GetNumero: string;
begin
  Result := FNumero;
end;

function TEntidadeModelo.GetComplemento: string;
begin
  Result := FComplemento;
end;

class procedure TEntidadeModelo.CarregarEntidadePadrao;
begin
  FEntidadeDAO.CarregarEntidadePadrao(nil);
end;

function TEntidadeModelo.GetBairro: string;
begin
  Result := FBairro;
end;

function TEntidadeModelo.GetCep: string;
begin
  Result := FCep;
end;

function TEntidadeModelo.GetCidade: string;
begin
  Result := FCidade;
end;

end.
