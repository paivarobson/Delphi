unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, StdCtrls, Grids, DBGrids, WideStrings, SqlExpr,
  FMTBcd, Provider, DBTables, SimpleDS, ComCtrls, unDados;

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
    qryEscola: TSQLQuery;
    dtpEscolaDataCadastro: TDateTimePicker;
    btnEscolaGravar: TButton;
    procedure btnEscolaCadastrarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarComponentesDados;
    procedure LimparCampos;
    procedure GravarDados;
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

procedure TfrmCadastroEscola.btnEscolaCadastrarClick(Sender: TObject);
begin
  HabilitarComponentesDados;
end;

procedure TfrmCadastroEscola.GravarDados;
begin
  qryEscola.Open;
  qryEscola.Append;
  qryEscola.FieldByName('ESCCOD').AsInteger := StrToInt(edtEscolaCodigo.Text);
  qryEscola.FieldByName('ESCNOME').AsString := edtEscolaNome.Text;
  qryEscola.FieldByName('ESCDATACAD').AsDateTime := StrToDateTime(dtpEscolaDataCadastro.Text);
  qryEscola.FieldByName('ESCENDRUA').AsString := edtEscolaEndRua.Text;
  qryEscola.FieldByName('ESCENDNUM').AsInteger := StrToInt(edtEscolaEndNumero.Text);
  qryEscola.FieldByName('ESCENDCOMP').AsString := edtEscolaEndComplemento.Text;
  qryEscola.FieldByName('ESCENDBAIRRO').AsString := edtEscolaEndBairro.Text;
  qryEscola.FieldByName('ESCENDCIDADE').AsString := edtEscolaEndCidade.Text;
  qryEscola.FieldByName('ESCENDCEP').AsString := edtEscolaEndCep.Text;
  qryEscola.Post;
  qryEscola.Close;
end;

procedure TfrmCadastroEscola.HabilitarComponentesDados;
begin
  edtEscolaNome.Enabled := True;
  dtpEscolaDataCadastro.Enabled := True;  
  edtEscolaEndRua.Enabled := True;
  edtEscolaEndNumero.Enabled := True;
  edtEscolaEndComplemento.Enabled := True;
  edtEscolaEndCidade.Enabled := True;
  edtEscolaEndCep.Enabled := True;
  edtEscolaEndBairro.Enabled := True;
  edtEscolaNome.SetFocus;
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
  edtEscolaEndBairro.Clear;
end;

end.
