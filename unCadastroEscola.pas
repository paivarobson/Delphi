unit unCadastroEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBClient;

type
  TfrmCadastroEscola = class(TForm)
    cdsTemp: TClientDataSet;
    mMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Escola1: TMenuItem;
    intgrfldTempESCCOD: TIntegerField;
    strngfldTempESCNOME: TStringField;
    dtmfldTempESCDATACAD: TDateTimeField;
    strngfldTempESCEND: TStringField;
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
