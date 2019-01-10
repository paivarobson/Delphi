unit unFrmAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, unAlunoControle, SqlExpr,
  DBClient;

type
  TfrmCadAluno = class(TForm)
    lblAlunoMatricula: TLabel;
    lblAlunoNome: TLabel;
    edtAlunoMatricula: TEdit;
    edtAlunoNome: TEdit;
    tblAluno: TTable;
    dsAluno: TDataSource;
    dbgrdAluno: TDBGrid;
  private
    procedure CarregarAluno;
  public
    { Public declarations }
  end;

var
  frmCadAluno: TfrmCadAluno;

implementation

{$R *.dfm}

{ TfrmCadAluno }

procedure TfrmCadAluno.CarregarAluno;
var
  VControleAluno: TAlunoControle;
  VQuery        : TSQLQuery;
begin
  VControleAluno := TAlunoControle.Create;
  try
    VQuery := VControleAluno.Obter;
    try
//      cdsAluno. :=  //A partir daqui verificar a possibilidade de trabalhar somente com a Query
                      //setando direto no DataSource
    finally

    end;
  finally
    FreeAndNil(VControleAluno);
  end;
end;

end.