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
    procedure AbrirConexaoClientDS(AClientDataSet: TClientDataset);
    procedure FecharConexaoClientDS(AClientDataSet: TClientDataset);
    procedure NovoCadastroClientDS(AClientDataSet: TClientDataset);
    procedure AlterarClientDS(AClientDataSet: TClientDataset);
    procedure LimparDadosClientDS(AClientDataSet: TClientDataset);
    procedure CancelarEdicaoClientDS(AClientDataSet: TClientDataset);
    procedure ExcluirClientDS(AClientDataSet: TClientDataset);
    procedure DesabilitarFilteredClientDS(AClientDataSet: TClientDataset);
    procedure HabilitarFilteredClientDS(AClientDataSet: TClientDataset);
    procedure CarregarTodosRegistrosClientDS(AClientDataSet: TClientDataset);


    function GravarDB(AClientDataSet: TClientDataSet): Boolean;
    function StatusInsertClientDS(AClientDataSet: TClientDataset): Boolean;
    function VerificaClientDSSeEstaAtivo(AClientDataSet: TClientDataset): Boolean; 

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
//Método NOVO CADASTRO
procedure Tfmdados.NovoCadastroClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Open;
  AClientDataSet.Append;
end;

function Tfmdados.StatusInsertClientDS(AClientDataSet: TClientDataset): Boolean;
begin
  if AClientDataSet.State in [dsInsert] then
    Result := True
  else
    Result := False;
end;
//Método GRAVAR
function Tfmdados.GravarDB(AClientDataSet: TClientDataset):Boolean;
begin
  AClientDataSet.Post;
  
  Result := AClientDataSet.ApplyUpdates(0) = 0;
end;
procedure Tfmdados.LimparDadosClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.ClearFields;
end;

procedure Tfmdados.DesabilitarFilteredClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Filtered := False;
end;

//Método CANCELAR EDIÇÃO
procedure Tfmdados.AbrirConexaoClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Open;
end;

procedure Tfmdados.AlterarClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Edit;
end;

function Tfmdados.VerificaClientDSSeEstaAtivo(AClientDataSet: TClientDataset): Boolean;
begin
  if AClientDataSet.Active then
    Result := True
  else
    Result := False;  
end;

procedure Tfmdados.CancelarEdicaoClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Cancel;
end;
procedure Tfmdados.HabilitarFilteredClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Filtered := True;
end;

procedure Tfmdados.CarregarTodosRegistrosClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Filter := '1 = 1';
end;

//Método EXCLUIR
procedure Tfmdados.ExcluirClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Delete;
  AClientDataSet.ApplyUpdates(0);
  AClientDataSet.Refresh;
  AClientDataSet.Close;
end;

procedure Tfmdados.FecharConexaoClientDS(AClientDataSet: TClientDataset);
begin
  AClientDataSet.Close;
end;

end.
