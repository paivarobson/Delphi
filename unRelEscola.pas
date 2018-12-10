unit unRelEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, UnCadEscola;

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
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEscola: TfrmRelEscola;

implementation

{$R *.dfm}

end.
