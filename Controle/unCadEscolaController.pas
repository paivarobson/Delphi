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

    procedure LimparFieldsCDS;
    procedure NovoCadastroEscola;
    procedure GravarEscola;
    procedure ExcluirEscola;
    procedure CancelarEdicaoEscola;
    procedure CarregarEscola(ACodigoEscola: Integer);
    procedure InserirEscola;
    
    property EscolaModelo: TEscolaModelo read FEscolaModelo write SetEscolaModelo;
  end;

implementation

uses
  unDados, unSistemaControle;

constructor TCadEscolaController.Create;
begin
  EscolaModelo := TEscolaModelo.Create;
end;

destructor TCadEscolaController.Destroy;
begin
  FreeAndNil(FEscolaModelo);
  inherited;
end;

procedure TCadEscolaController.CarregarEscola(ACodigoEscola: Integer);
begin
  EscolaModelo.Carregar(ACodigoEscola);
end;

procedure TCadEscolaController.NovoCadastroEscola;
begin
  fmdados.NovoCadastro;
end;
procedure TCadEscolaController.SetEscolaModelo(const Value: TEscolaModelo);
begin
  FEscolaModelo := Value;
end;

//M�todo GRAVAR
procedure TCadEscolaController.GravarEscola;
begin
  fmdados.Gravar;
end;
procedure TCadEscolaController.InserirEscola;
begin
  EscolaModelo.Inserir;
end;

//M�todo CANCELAR
procedure TCadEscolaController.CancelarEdicaoEscola;
begin
  fmdados.CancelarEdicao;
end;
//M�todo EXCLUIR
procedure TCadEscolaController.ExcluirEscola;
begin
  fmdados.Excluir;
end;
//M�todo para o uso do ClientDataSet externamente
function TCadEscolaController.DadosCDS: TClientDataSet;
begin
  Result := fmdados.cdsEscola;
end;

function TCadEscolaController.DadosFieldCodigo: TIntegerField;
begin
  Result := fmdados.cdsEscolaESCCOD;
end;

function TCadEscolaController.DadosFieldData: TSQLTimeStampField;
begin
  Result := fmdados.cdsEscolaESCDATACAD;
end;
//M�todo para limpar os dados direto no ClientDataSet
procedure TCadEscolaController.LimparFieldsCDS;
begin
  fmdados.cdsEscolaESCNOME.Clear;
  fmdados.cdsEscolaESCENDCEP.Clear;
  fmdados.cdsEscolaESCENDRUA.Clear;
  fmdados.cdsEscolaESCENDNUM.Clear;
  fmdados.cdsEscolaESCENDCOMP.Clear;
  fmdados.cdsEscolaESCENDBAIRRO.Clear;
  fmdados.cdsEscolaESCENDCIDADE.Clear;
end;
//M�todo verificador do �ltimo C�DIGO registrado no BD 
function TCadEscolaController.DevolverUltimoCodigo: Integer;
begin
  fmdados.tbAux.Close;
  fmdados.tbAux.SQL.Clear;
  fmdados.tbAux.SQL.Text := 'SELECT MAX(ESCCOD) FROM ESCOLA';
  fmdados.tbAux.Open;
  Result := fmdados.tbAux.Fields[0].AsInteger;
end;
end.