unit unFrmCadAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmCadPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ComCtrls, dxCore, cxDateUtils,
  Mask, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls;

type
  TfrmCadAluno = class(TfrmCadPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAluno: TfrmCadAluno;

implementation

{$R *.dfm}

procedure TfrmCadAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadAluno := nil;
end;

end.
