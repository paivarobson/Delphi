unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, StdCtrls, Grids, DBGrids;

type
  TfrmCadastroEscola = class(TForm)
    menuBarCadastro: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Escola1: TMenuItem;
    cdsTemp: TClientDataSet;
    cdsTempESCCOD: TIntegerField;
    cdsTempESCNOME: TStringField;
    cdsTempESCDATACAD: TDateTimeField;
    cdsTempESCENDRUA: TStringField;
    cdsTempESCENDNUM: TIntegerField;
    cdsTempESCENDCOMP: TStringField;
    cdsTempESCENDBAIRRO: TStringField;
    cdsTempESCENDCIDADE: TStringField;
    cdsTempESCENDCEP: TStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EscolaInsert;
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

procedure TfrmCadastroEscola.EscolaInsert;
begin
  cdsTemp.Append;
  cdsTemp.FieldByName('ESCCOD').AsInteger := StrToInt(edtEscolaCodigo.Text);
  cdsTemp.FieldByName('ESCNOME').AsString := edtEscolaCodigo.Text;
  cdsTemp.FieldByName('ESCDATACAD').AsDateTime := StrToDateTime(edtEscolaDataCadastro.Text);
  cdsTemp.FieldByName('ESCENDRUA').AsString := edtEscolaEndRua.Text;
  cdsTemp.FieldByName('ESCENDNUM').AsInteger := StrToInt(edtEscolaEndNumero.Text);
  cdsTemp.FieldByName('ESCENDCOMP').AsString := edtEscolaEndComplemento.Text;
  cdsTemp.FieldByName('ESCENDBAIRRO').AsString := edtEscolaEndBairro.Text;
  cdsTemp.FieldByName('ESCENDCIDADE').AsString := edtEscolaEndCidade.Text;
  cdsTemp.FieldByName('ESCENDCEP').AsString := edtEscolaEndCep.Text;
  cdsTemp.Post;
end;

end.
