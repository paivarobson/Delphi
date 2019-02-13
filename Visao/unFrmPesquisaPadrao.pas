unit unFrmPesquisaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids;

type
  TfrmPesquisaPadrao = class(TForm)
    lblConsultaOrdenada: TLabel;
    lblTituloLista: TLabel;
    DBGridLista: TDBGrid;
    ComboBoxConsultaOrdenada: TComboBox;
    rgPesquisar: TRadioGroup;
    dtpBuscarData: TDateTimePicker;
    edtBuscarCodigo: TEdit;
    btnBuscar: TButton;
    rgImpressao: TRadioGroup;
    btnImprimir: TButton;
    btnNovoCadastro: TButton;
    btnConsultaFechar: TButton;
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
