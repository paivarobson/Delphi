unit unRelEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, UnCadEscola, unDados;

type
  TfrmRelEscola = class(TForm)
    RLReportEscola: TRLReport;
    RLBand1: TRLBand;
    rlblRelEscolaTitulo: TRLLabel;
    RLBand2: TRLBand;
    rlblRelEscolaCod: TRLLabel;
    rlblRelEscolaNome: TRLLabel;
    RLBand3: TRLBand;
    rldbtxtEscolaNome: TRLDBText;
    rldbtxtEscolaCod: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    rlblRelEscolaDataCadastro: TRLLabel;
    RLDBText1: TRLDBText;
    rlblRelEscolaRua: TRLLabel;
    rlblRelEscolaNumero: TRLLabel;
    rlblRelEscolaComplemento: TRLLabel;
    rlblRelEscolaBairro: TRLLabel;
    rlblRelEscolaCidade: TRLLabel;
    rlblRelEscolaCEP: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEscola: TfrmRelEscola;

implementation

{$R *.dfm}

procedure TfrmRelEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  frmRelEscola := nil;
end;

end.
