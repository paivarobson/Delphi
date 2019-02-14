unit unFrmPesquisaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmPesquisaPadrao = class(TForm)
    lblConsultaOrdenada: TLabel;
    lblTituloLista: TLabel;
    ComboBoxConsultaOrdenada: TComboBox;
    rgPesquisar: TRadioGroup;
    dtpBuscarData: TDateTimePicker;
    edtBuscarCodigo: TEdit;
    btnBuscar: TButton;
    rgImpressao: TRadioGroup;
    btnImprimir: TButton;
    btnNovoCadastro: TButton;
    btnConsultaFechar: TButton;
    DBGridLista: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

{$R *.dfm}

end.
