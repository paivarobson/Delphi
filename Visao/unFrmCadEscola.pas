unit unFrmCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmCadPadrao, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ComCtrls, dxCore, cxDateUtils,
  Mask, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmCadEscola = class(TfrmCadPadrao)
    btnEscolaPesquisar: TButton;

  public
    procedure CarregarComponentesCadEscola;
//    procedure CarregarEntidadeEscola; override;
    procedure LimparCampos; override;        
  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

{$R *.dfm}


{ TfrmCadEscola }

procedure TfrmCadEscola.CarregarComponentesCadEscola;
begin

end;

procedure TfrmCadEscola.LimparCampos;
begin
  inherited;
  CarregarComponentesCadEscola;
end;

end.
