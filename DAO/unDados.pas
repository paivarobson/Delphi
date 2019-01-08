unit unDados;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, FMTBcd, Provider, DBClient,
  DBTables;

type
  Tfmdados = class(TDataModule)
    FConexaoBDEscola: TSQLConnection;
    dspEscola: TDataSetProvider;
    tbdsEscola: TClientDataSet;
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
    tbdsEscolaESCCOD: TIntegerField;
    tbdsEscolaESCNOME: TStringField;
    tbdsEscolaESCENDRUA: TStringField;
    tbdsEscolaESCENDNUM: TStringField;
    tbdsEscolaESCENDCOMP: TStringField;
    tbdsEscolaESCENDBAIRRO: TStringField;
    tbdsEscolaESCENDCIDADE: TStringField;
    tbEscolaESCDATACAD: TSQLTimeStampField;
    tbdsEscolaESCDATACAD: TSQLTimeStampField;
    tbdsEscolaESCENDCEP: TStringField;

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
  UnCadEscola;

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
  tbdsEscola.Open;
  tbdsEscola.Append;
end;
//Método GRAVAR
procedure Tfmdados.Gravar;
begin
  tbdsEscola.Post;
  tbdsEscola.ApplyUpdates(0);
end;
//Método CANCELAR EDIÇÃO
procedure Tfmdados.CancelarEdicao;
begin
  tbdsEscola.Cancel;
end;
//Método EXCLUIR
procedure Tfmdados.Excluir;
begin
  tbdsEscola.Delete;
  tbdsEscola.ApplyUpdates(0);
  tbdsEscola.Refresh;
  tbdsEscola.Close;
end;

end.
