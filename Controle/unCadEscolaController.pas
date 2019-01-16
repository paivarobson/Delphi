unit unCadEscolaController;

interface

uses
  DB, DBClient, SqlExpr, Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo;

type
    TCadEscolaController = class
  private
    FEscolaModelo: TEscolaModelo;
    procedure SetEscolaModelo(const Value: TEscolaModelo);

  public
    constructor Create;
    destructor Destroy; override;

    function DevolverUltimoCodigo: Integer;
    function DadosCDS: TClientDataSet;
    function DadosFieldCodigo: TIntegerField;
    function DadosFieldData: TSQLTimeStampField;
    function ObterDadosParaClientDS: Boolean;

    procedure LimparCampos;
    procedure NovoCadastroClientDS;
    procedure ExcluirClientDS;
    procedure CancelarEdicaoClientDS;
    procedure CarregarEscola(ACodigoEscola: Integer);
    
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

procedure TCadEscolaController.CancelarEdicaoClientDS;
begin
  EscolaModelo.CancelarEdicaoClientDS;
end;

procedure TCadEscolaController.CarregarEscola(ACodigoEscola: Integer);
begin
  EscolaModelo.Carregar(ACodigoEscola);
end;

procedure TCadEscolaController.NovoCadastroClientDS;
begin
  EscolaModelo.NovoCadastroClientDS;
end;

procedure TCadEscolaController.SetEscolaModelo(const Value: TEscolaModelo);
begin
  FEscolaModelo := Value;
end;

//M�todo GRAVAR
function TCadEscolaController.ObterDadosParaClientDS: Boolean;
begin
  Result := EscolaModelo.ObterDadosParaClientDS;
end;

//M�todo CANCELAR
//M�todo EXCLUIR
procedure TCadEscolaController.ExcluirClientDS;
begin
  EscolaModelo.ExcluirClientDS;
end;
//M�todo para o uso do ClientDataSet externamente
function TCadEscolaController.DadosCDS: TClientDataSet;
begin
  Result := EscolaModelo.ObterClientDS;
end;

function TCadEscolaController.DadosFieldCodigo: TIntegerField;
begin
//  Result := fmdados.cdsEscolaESCCOD;
end;

function TCadEscolaController.DadosFieldData: TSQLTimeStampField;
begin
//  Result := fmdados.cdsEscolaESCDATACAD;
end;
//M�todo para limpar os dados direto no ClientDataSet
procedure TCadEscolaController.LimparCampos;
begin
  EscolaModelo.LimparCampos;
end;
//M�todo verificador do �ltimo C�DIGO registrado no BD 
function TCadEscolaController.DevolverUltimoCodigo: Integer;
begin
  Result := EscolaModelo.DevolverUltimoCodigo;
end;
end.
