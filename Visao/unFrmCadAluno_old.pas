unit unFrmCadAluno_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, unAlunoControle, SqlExpr,
  DBClient, unDados, unFrmCadPadrao;

type
  TfrmCadAluno = class(TForm)
    lblAlunoMatricula: TLabel;
    lblAlunoNome: TLabel;
    edtAlunoMatricula: TEdit;
    edtAlunoNome: TEdit;
    tblAluno: TTable;
    dsAluno: TDataSource;
    dbgrdAluno: TDBGrid;
    cdsAluno: TClientDataSet;
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarAluno;
  public
    { Public declarations }
  end;

var
  frmCadAluno: TfrmCadAluno;

implementation

uses
  Provider;

{$R *.dfm}

{ TfrmCadAluno }

procedure TfrmCadAluno.CarregarAluno;
//var
//  VAlunoControle: TAlunoControle;
//  Provider: TDataSetProvider;
begin
//  VAlunoControle := TAlunoControle.Create;
//  Provider := TDataSetProvider.Create(Self);
//  try
//    try
////      Provider := VAlunoControle.ObterProvider;
////      if Assigned(Provider) then
////      begin
////        cdsAluno.SetProvider(Provider);
////        cdsAluno.CommandText := 'SELECT ALUMAT, ALUNOME FROM ALUNO';
////        cdsAluno.Open;
////      end;
//
//
//    finally
//
//    end;
//  finally
//
//  end;
end;

procedure TfrmCadAluno.FormShow(Sender: TObject);
begin
  Self.CarregarAluno();
end;

end.
