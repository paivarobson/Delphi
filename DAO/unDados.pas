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
    function GetTbEscola: TSQLQuery;
    { Private declarations }
  public
    { Public declarations }
    property ComponenteQuery: TSQLQuery read GetTbEscola write tbEscola;

    function DataModuleQuery: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure NovoCadastroClientDS;
    procedure GravarClientDS;
    procedure CancelarEdicaoClientDS;
    procedure ExcluirClientDS;

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

//M�todo NOVO CADASTRO
procedure Tfmdados.NovoCadastroClientDS;
begin
  cdsEscola.Open;
  cdsEscola.Append;
end;
//M�todo GRAVAR
procedure Tfmdados.GravarClientDS;
begin
  cdsEscola.Post;
  cdsEscola.ApplyUpdates(0);
end;
//M�todo CANCELAR EDI��O
procedure Tfmdados.CancelarEdicaoClientDS;
begin
  cdsEscola.Cancel;
end;
//M�todo EXCLUIR
procedure Tfmdados.ExcluirClientDS;
begin
  cdsEscola.Delete;
  cdsEscola.ApplyUpdates(0);
  cdsEscola.Refresh;
  cdsEscola.Close;
end;

end.
