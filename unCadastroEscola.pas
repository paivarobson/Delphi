unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient, StdCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEscola: TfrmCadastroEscola;

implementation

{$R *.dfm}

end.
