unit unEscolaIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TfrmEscolaIndex = class(TForm)
    lblEscolaBoasVindas: TLabel;
    mmEscola: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastro1: TMenuItem;
    escola1: TMenuItem;
    procedure escola1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolaIndex: TfrmEscolaIndex;

implementation

uses
  UnCadEscola;

{$R *.dfm}

procedure TfrmEscolaIndex.escola1Click(Sender: TObject);
begin
  frmCadEscola := TfrmCadEscola.Create(Application);
  frmCadEscola.ShowModal;
end;

end.
