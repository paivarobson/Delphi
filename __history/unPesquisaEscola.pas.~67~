unit unPesquisaEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DB, ExtCtrls;

type
  TfrmPesquisaEscola = class(TForm)
    DBGridListaEscola: TDBGrid;
    lblEscolaConsultaOrdenada: TLabel;
    ComboBoxEscolaConsultaOrdenada: TComboBox;
    rgEscolaPesquisar: TRadioGroup;
    dtpEscolaBuscarData: TDateTimePicker;
    edtEscolaBuscarCodigo: TEdit;
    btnEscolaBuscar: TButton;
    lblEscolaTituloLista: TLabel;
    rgImpressao: TRadioGroup;
    btnEscolaImprimir: TButton;
    procedure DBGridListaEscolaDblClick(Sender: TObject);
    procedure btnEscolaBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpEscolaBuscarDataKeyPress(Sender: TObject; var Key: Char);
    procedure edtEscolaBuscarCodigoChange(Sender: TObject);
    procedure edtEscolaBuscarCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxEscolaConsultaOrdenadaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEscolaImprimirClick(Sender: TObject);
  private
    //FCodigoEscolaSelecionado: Integer;
//    procedure SetCodigoEscolaSelecionado(const Value: Integer);
    procedure ConsultaOrdenada;
  public
//    property CodigoEscolaSelecionado: Integer read FCodigoEscolaSelecionado write SetCodigoEscolaSelecionado;
  end;

var
  frmPesquisaEscola: TfrmPesquisaEscola;

implementation

uses
  unDados, unRelEscola;

{$R *.dfm}

procedure TfrmPesquisaEscola.btnEscolaImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelEscola, frmRelEscola);
  if rgImpressao.ItemIndex = 0 then
    frmRelEscola.RLReportEscola.Preview()
  else
    frmRelEscola.RLReportEscola.Print
end;

procedure TfrmPesquisaEscola.ComboBoxEscolaConsultaOrdenadaChange(
  Sender: TObject);
begin
  ConsultaOrdenada;
end;

procedure TfrmPesquisaEscola.ConsultaOrdenada;
begin
  case ComboBoxEscolaConsultaOrdenada.ItemIndex of
    0: fmdados.tbdsEscola.IndexFieldNames := 'ESCCOD';
    1: fmdados.tbdsEscola.IndexFieldNames := 'ESCNOME';
    2: fmdados.tbdsEscola.IndexFieldNames := 'ESCDATACAD';
  end;
end;

procedure TfrmPesquisaEscola.btnEscolaBuscarClick(Sender: TObject);
begin
  fmdados.tbdsEscola.Filtered := False;
  if rgEscolaPesquisar.ItemIndex = 0 then
  begin
    if edtEscolaBuscarCodigo.Text = '' then
    begin
      fmdados.tbdsEscola.Filtered := False;
      fmdados.tbdsEscola.Filter := '1 = 1';
      fmdados.tbdsEscola.Filtered := True;
    end
    else
      if fmdados.tbdsEscola.Locate('ESCCOD', edtEscolaBuscarCodigo.Text, [LopartialKey]) then
      begin
        fmdados.tbdsEscola.Filtered := False;
        fmdados.tbdsEscola.Filter := 'ESCCOD = ' + QuotedStr(edtEscolaBuscarCodigo.Text);
        fmdados.tbdsEscola.Filtered := True;
      end
      else
      begin
        ShowMessage('Registro não localizado. Verifique o código digitado e tente novamente.');
        edtEscolaBuscarCodigo.SetFocus;
      end;
    edtEscolaBuscarCodigo.SetFocus;
  end
  else
  begin
    if not fmdados.tbdsEscola.Locate('ESCDATACAD',
      FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date), [LopartialKey]) then
    begin
      ShowMessage('Registro não localizado. Verifique a data consultada e tente novamente.');
      dtpEscolaBuscarData.SetFocus;
    end
    else
    begin
      fmdados.tbdsEscola.Filtered := False;
      fmdados.tbdsEscola.Filter := 'ESCDATACAD = ' + QuotedStr(
        FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date));
      fmdados.tbdsEscola.Filtered := True;
    end;
    dtpEscolaBuscarData.SetFocus;
  end;
end;

procedure TfrmPesquisaEscola.DBGridListaEscolaDblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisaEscola.dtpEscolaBuscarDataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnEscolaBuscarClick(Sender)
end;

procedure TfrmPesquisaEscola.edtEscolaBuscarCodigoChange(Sender: TObject);
begin
  if (edtEscolaBuscarCodigo.Text = EmptyStr) then
    fmdados.tbdsEscola.Filtered := False;
end;

procedure TfrmPesquisaEscola.edtEscolaBuscarCodigoKeyPress(Sender: TObject;
  var Key: Char);
  var
  keyAux: Char;
begin
  keyAux := Key;
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
  if keyAux = #13 then
    btnEscolaBuscarClick(Sender)
end;

procedure TfrmPesquisaEscola.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  frmPesquisaEscola := nil;
end;

procedure TfrmPesquisaEscola.FormShow(Sender: TObject);
begin
  fmdados.tbdsEscola.Open;
end;

//procedure TfrmPesquisaEscola.SetCodigoEscolaSelecionado(const Value: Integer);
//begin
////  FCodigoEscolaSelecionado := Value;
//end;

end.
