unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient;

type
  TfrmCadastroEscola = class(TForm)
    cliente: TMainMenu;
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
