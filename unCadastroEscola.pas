unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, StdCtrls, Grids, DBGrids, WideStrings, SqlExpr,
  FMTBcd;

type
  TfrmCadastroEscola = class(TForm)
    menuBarCadastro: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Escola1: TMenuItem;
    edtEscolaCodigo: TEdit;
    edtEscolaNome: TEdit;
    edtEscolaEndRua: TEdit;
    edtEscolaEndNumero: TEdit;
    edtEscolaEndComplemento: TEdit;
    edtEscolaEndCidade: TEdit;
    edtEscolaEndCep: TEdit;
    lblEscolaCodigo: TLabel;
    lblEscolaNome: TLabel;
    lblEscolaEndRua: TLabel;
    lblEscolaEndNumero: TLabel;
    lblEscolaEndComplemento: TLabel;
    lblEscolaEndCidade: TLabel;
    lblEscolaendCep: TLabel;
    edtEscolaDataCadastro: TEdit;
    lblEscolaDataCadastro: TLabel;
    edtEscolaEndBairro: TEdit;
    lblEscolaEndBairro: TLabel;
    dbgrdEscola: TDBGrid;
    dsEscola: TDataSource;
    lblEscolaTitulo: TLabel;
    btnEscolaCadastrar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaImprimiir: TButton;
    conexaoBDEscola: TSQLConnection;
    sqlqryescola: TSQLQuery;
    SQLTable1: TSQLTable;
    procedure btnEscolaCadastrarClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure EscolaDados;
    procedure LimparCampos;    
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

procedure TfrmCadastroEscola.btnEscolaAlterarClick(Sender: TObject);
begin
  cdsTemp.Edit;
  EscolaDados;
  end;

procedure TfrmCadastroEscola.btnEscolaCadastrarClick(Sender: TObject);
begin
  cdsTemp.Append;
  EscolaDados;
end;

procedure TfrmCadastroEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  cdsTemp.Delete;
end;

procedure TfrmCadastroEscola.EscolaDados;
begin
  cdsTemp.FieldByName('ESCCOD').AsInteger := StrToInt(edtEscolaCodigo.Text);
  cdsTemp.FieldByName('ESCNOME').AsString := edtEscolaNome.Text;
  cdsTemp.FieldByName('ESCDATACAD').AsDateTime := StrToDateTime(edtEscolaDataCadastro.Text);
  cdsTemp.FieldByName('ESCENDRUA').AsString := edtEscolaEndRua.Text;
  cdsTemp.FieldByName('ESCENDNUM').AsInteger := StrToInt(edtEscolaEndNumero.Text);
  cdsTemp.FieldByName('ESCENDCOMP').AsString := edtEscolaEndComplemento.Text;
  cdsTemp.FieldByName('ESCENDBAIRRO').AsString := edtEscolaEndBairro.Text;
  cdsTemp.FieldByName('ESCENDCIDADE').AsString := edtEscolaEndCidade.Text;
  cdsTemp.FieldByName('ESCENDCEP').AsString := edtEscolaEndCep.Text;
  cdsTemp.Post;

  ShowMessage('Cadastro realizado com sucesso!');
end;

procedure TfrmCadastroEscola.LimparCampos;
begin
  edtEscolaCodigo.Clear;
  edtEscolaNome.Clear;
  edtEscolaEndRua.Clear;
  edtEscolaEndNumero.Clear;
  edtEscolaEndComplemento.Clear;
  edtEscolaEndCidade.Clear;
  edtEscolaEndCep.Clear;
  edtEscolaDataCadastro.Clear;
  edtEscolaEndBairro.Clear;
end;

end.
