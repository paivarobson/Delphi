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
//    function GetEstadoClientDS: TDataSetState; virtual;
  public
    constructor Create;
//    procedure AbrirConexaoClientDS;
//    procedure FecharConexaoClientDS;
    procedure CarregarEntidadePadrao;
    procedure NovoCadastroClientDS; virtual;
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

    function EstadoClientDS: TDataSetState;
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

procedure TEntidadeModelo.NovoCadastroClientDS;
begin
  FEntidadeDAO.NovoCadastroClientDS;
end;

function TEntidadeModelo.GetNumero: string;
begin
  Result := FNumero;
end;

function TEntidadeModelo.GetComplemento: string;
begin
  Result := FComplemento;
end;

procedure TEntidadeModelo.CarregarEntidadePadrao;
begin
  FEntidadeDAO.CarregarEntidadePadrao(nil);
end;

constructor TEntidadeModelo.Create;
begin
  FEntidadeDAO := TEntidadeDAO.Create;
end;

function TEntidadeModelo.EstadoClientDS: TDataSetState;
begin
  Result := FEntidadeDAO.EstadoClientDS;
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
