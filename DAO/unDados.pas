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
    function GetConexaoBDEscola: TSQLConnection;
    function GetTbEscola: TSQLQuery;
    { Private declarations }
  public
    { Public declarations }
    property ConexaoBDEscola: TSQLConnection read GetConexaoBDEscola;
    property ComponenteQuery: TSQLQuery read GetTbEscola write tbEscola;

    function DataModuleQuery: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure NovoCadastro;
    procedure Gravar;
    procedure CancelarEdicao;
    procedure Excluir;

  end;

var
  fmdados: Tfmdados;

implementation

uses
  unFrmCadEscola;

{$R *.dfm}
function Tfmdados.GetTbEscola: TSQLQuery;
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

function Tfmdados.DataModuleQuery: TSQLQuery;
begin
  Result := tbEscola;
end;

function Tfmdados.GetConexaoBDEscola: TSQLConnection;
begin
  Result := FConexaoBDEscola;
end;
//Método NOVO CADASTRO
procedure Tfmdados.NovoCadastro;
begin
  cdsEscola.Open;
  cdsEscola.Append;
end;
//Método GRAVAR
procedure Tfmdados.Gravar;
begin
  cdsEscola.Post;
  cdsEscola.ApplyUpdates(0);
end;
//Método CANCELAR EDIÇÃO
procedure Tfmdados.CancelarEdicao;
begin
  cdsEscola.Cancel;
end;
//Método EXCLUIR
procedure Tfmdados.Excluir;
begin
  cdsEscola.Delete;
  cdsEscola.ApplyUpdates(0);
  cdsEscola.Refresh;
  cdsEscola.Close;
end;

end.
