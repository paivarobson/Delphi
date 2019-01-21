unit unDados;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, FMTBcd, Provider, DBClient,
  DBTables;

type
  Tfmdados = class(TDataModule)
    FConexaoBDEscola: TSQLConnection;
    dspEscola: TDataSetProvider;
    cdsEscola: TClientDataSet;
    dsEscola: TDataSource;
    tbEscola: TSQLQuery;
    tbAux: TSQLQuery;
    tbEscolaESCCOD: TIntegerField;
    tbEscolaESCNOME: TStringField;
    tbEscolaESCENDRUA: TStringField;
    tbEscolaESCENDNUM: TStringField;
    tbEscolaESCENDCOMP: TStringField;
    tbEscolaESCENDBAIRRO: TStringField;
    tbEscolaESCENDCIDADE: TStringField;
    tbEscolaESCENDCEP: TStringField;
    cdsEscolaESCCOD: TIntegerField;
    cdsEscolaESCNOME: TStringField;
    cdsEscolaESCENDRUA: TStringField;
    cdsEscolaESCENDNUM: TStringField;
    cdsEscolaESCENDCOMP: TStringField;
    cdsEscolaESCENDBAIRRO: TStringField;
    cdsEscolaESCENDCIDADE: TStringField;
    tbEscolaESCDATACAD: TSQLTimeStampField;
    cdsEscolaESCDATACAD: TSQLTimeStampField;
    cdsEscolaESCENDCEP: TStringField;
    tbAluno: TSQLQuery;
    dspAluno: TDataSetProvider;
    cdsAluno: TClientDataSet;

  private
    function GetQueryEscola: TSQLQuery;

  public
    property ComponenteQuery: TSQLQuery read GetQueryEscola;
    property ClientDSEscola: TClientDataSet read cdsEscola;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure AbrirConexaoClientDS;
    procedure FecharConexaoClientDS;
    procedure NovoCadastroClientDS;
    procedure AlterarClientDS;
    procedure LimparDadosClient;
    procedure CancelarEdicaoClientDS;
    procedure ExcluirClientDS;
    procedure DesabilitarFilteredClientDS;
    procedure HabilitarFilteredClientDS;
    procedure CarregarTodosRegistrosClientDS;

    function GravarDB(AClientDataSet: TClientDataSet): Boolean;

  end;

var
  fmdados: Tfmdados;

implementation

uses
  unFrmCadEscola;

{$R *.dfm}

function Tfmdados.GetQueryEscola: TSQLQuery;
begin
  Result := tbEscola;
end;

procedure Tfmdados.DataModuleCreate(Sender: TObject);
begin
  FConexaoBDEscola.Connected := True;
end;

procedure Tfmdados.DataModuleDestroy(Sender: TObject);
begin
  FConexaoBDEscola.Connected := False;
  FreeAndNil(FConexaoBDEscola);
end;
//M�todo NOVO CADASTRO
procedure Tfmdados.NovoCadastroClientDS;
begin
  ClientDSEscola.Open;
  ClientDSEscola.Append;
end;
//M�todo GRAVAR
function Tfmdados.GravarDB(AClientDataSet: TClientDataset):Boolean;
begin
  AClientDataSet.Post;
  
  Result := AClientDataSet.ApplyUpdates(0) = 0;
end;
procedure Tfmdados.LimparDadosClient;
begin
  ClientDSEscola.ClearFields;
end;

procedure Tfmdados.DesabilitarFilteredClientDS;
begin
  ClientDSEscola.Filtered := False;
end;

//M�todo CANCELAR EDI��O
procedure Tfmdados.AbrirConexaoClientDS;
begin
  ClientDSEscola.Open;
end;

procedure Tfmdados.AlterarClientDS;
begin
  ClientDSEscola.Edit;
end;

procedure Tfmdados.CancelarEdicaoClientDS;
begin
  ClientDSEscola.Cancel;
end;
procedure Tfmdados.HabilitarFilteredClientDS;
begin
  ClientDSEscola.Filtered := True;
end;

procedure Tfmdados.CarregarTodosRegistrosClientDS;
begin
  ClientDSEscola.Filter := '1 = 1';
end;

//M�todo EXCLUIR
procedure Tfmdados.ExcluirClientDS;
begin
  ClientDSEscola.Delete;
  ClientDSEscola.ApplyUpdates(0);
  ClientDSEscola.Refresh;
  ClientDSEscola.Close;
end;

procedure Tfmdados.FecharConexaoClientDS;
begin
  ClientDSEscola.Close;
end;

end.
