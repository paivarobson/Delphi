unit unDados;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, FMTBcd, Provider, DBClient;

type
  Tfmdados = class(TDataModule)
    conexaoBDEscola: TSQLConnection;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1ESCNOME: TStringField;
    ClientDataSet1ESCDATACAD: TStringField;
    ClientDataSet1ESCENDRUA: TStringField;
    ClientDataSet1ESCENDNUM: TStringField;
    ClientDataSet1ESCENDCOMP: TStringField;
    ClientDataSet1ESCENDBAIRRO: TStringField;
    ClientDataSet1ESCENDCIDADE: TStringField;
    ClientDataSet1ESCENDCEP: TStringField;
    SQLDataSet1ESCNOME: TStringField;
    SQLDataSet1ESCDATACAD: TStringField;
    SQLDataSet1ESCENDRUA: TStringField;
    SQLDataSet1ESCENDNUM: TStringField;
    SQLDataSet1ESCENDCOMP: TStringField;
    SQLDataSet1ESCENDBAIRRO: TStringField;
    SQLDataSet1ESCENDCIDADE: TStringField;
    SQLDataSet1ESCENDCEP: TStringField;
    SQLDataSet1ESCCOD: TIntegerField;
    ClientDataSet1ESCCOD: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function GetConexaoDB: TSQLConnection;
    { Private declarations }
  public
    { Public declarations }
    property ConexaoDB: TSQLConnection read GetConexaoDB;
  end;

var
  fmdados: Tfmdados;

implementation

{$R *.dfm}

procedure Tfmdados.DataModuleCreate(Sender: TObject);
begin
  conexaoBDEscola.Connected := True;
end;

procedure Tfmdados.DataModuleDestroy(Sender: TObject);
begin
  conexaoBDEscola.Connected := False;
end;

function Tfmdados.GetConexaoDB: TSQLConnection;
begin
  Result := conexaoBDEscola
end;

end.
