unit unPesquisaEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DB, ExtCtrls, unCadastroEscolaController;

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
    btnEscolaNovoCadastro: TButton;
    btnEscolaConsultaFechar: TButton;
    procedure DBGridListaEscolaDblClick(Sender: TObject);
    procedure btnEscolaBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpEscolaBuscarDataKeyPress(Sender: TObject; var Key: Char);
    procedure edtEscolaBuscarCodigoChange(Sender: TObject);
    procedure edtEscolaBuscarCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxEscolaConsultaOrdenadaChange(Sender: TObject);
    procedure btnEscolaImprimirClick(Sender: TObject);
    procedure rgEscolaPesquisarClick(Sender: TObject);
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
    procedure btnEscolaConsultaFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //FCodigoEscolaSelecionado: Integer;
//    procedure SetCodigoEscolaSelecionado(const Value: Integer);
    procedure ConsultaOrdenada;
  public
    FController: TCadastroEscolaController;
    procedure AfterConstruction; override;
//    property CodigoEscolaSelecionado: Integer read FCodigoEscolaSelecionado write SetCodigoEscolaSelecionado;
  end;

var
  frmPesquisaEscola: TfrmPesquisaEscola;

implementation

uses
  unRelEscola, unEscolaIndex, UnCadEscola;

{$R *.dfm}
//Método executado logo depois do Construtor
procedure TfrmPesquisaEscola.AfterConstruction;
begin
  inherited;
  FController := TCadastroEscolaController.Create; //Instãncia da Classe Controller
end;

procedure TfrmPesquisaEscola.btnEscolaConsultaFecharClick(Sender: TObject);
begin
  Close;
end;
//(BOTÃO IMPRIMIR)
procedure TfrmPesquisaEscola.btnEscolaImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelEscola, frmRelEscola);
  if rgImpressao.ItemIndex = 0 then
    frmRelEscola.RLReportEscola.Preview()
  else
    frmRelEscola.RLReportEscola.Print
end;

procedure TfrmPesquisaEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then
    frmCadEscola := TfrmCadEscola.Create(frmEscolaIndex);
  frmCadEscola.Show;
  frmCadEscola.btnEscolaNovoCadastroClick(Sender);
  Close;
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
  rgEscolaPesquisar.SetFocus;
  FController.DadosCDS.Close;
end;

procedure TfrmPesquisaEscola.ComboBoxEscolaConsultaOrdenadaChange(
  Sender: TObject);
begin
  ConsultaOrdenada;
end;

procedure TfrmPesquisaEscola.ConsultaOrdenada;
begin
  case ComboBoxEscolaConsultaOrdenada.ItemIndex of
    0: FController.DadosCDS.IndexFieldNames := 'ESCCOD';
    1: FController.DadosCDS.IndexFieldNames := 'ESCNOME';
    2: FController.DadosCDS.IndexFieldNames := 'ESCDATACAD';
  end;
end;

procedure TfrmPesquisaEscola.btnEscolaBuscarClick(Sender: TObject);
begin
  FController.DadosCDS.Open;
  FController.DadosCDS.Filtered := False;
  if rgEscolaPesquisar.ItemIndex = 0 then
  begin
    edtEscolaBuscarCodigo.SelectAll;
    if (edtEscolaBuscarCodigo.Text = '') then
    begin
      FController.DadosCDS.Filtered := False;
      FController.DadosCDS.Filter := '1 = 1';
      FController.DadosCDS.Filtered := True;
    end
    else
    begin
      if FController.DadosCDS.Locate('ESCCOD', edtEscolaBuscarCodigo.Text, [LopartialKey]) then
      begin
        FController.DadosCDS.Filtered := False;
        FController.DadosCDS.Filter := 'ESCCOD = ' + QuotedStr(edtEscolaBuscarCodigo.Text);
        FController.DadosCDS.Filtered := True;
      end
      else
        ShowMessage('Registro não localizado. Verifique o código digitado e tente novamente.')
    end;
    edtEscolaBuscarCodigo.SetFocus;
  end
  else
  begin
    if not FController.DadosCDS.Locate('ESCDATACAD',
      FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date), [LopartialKey]) then
      ShowMessage('Registro não localizado. Verifique a data consultada e tente novamente.')
    else
    begin
      FController.DadosCDS.Filtered := False;
      FController.DadosCDS.Filter := 'ESCDATACAD = ' + QuotedStr(
        FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date));
      FController.DadosCDS.Filtered := True;
    end;
    dtpEscolaBuscarData.SetFocus;
  end;
end;

procedure TfrmPesquisaEscola.DBGridListaEscolaDblClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then
    frmCadEscola := TfrmCadEscola.Create(frmEscolaIndex);
  Close;
  frmCadEscola.Show;
  FController.DadosCDS.Open;
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
    FController.DadosCDS.Filtered := False
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

procedure TfrmPesquisaEscola.rgEscolaPesquisarClick(Sender: TObject);
begin
  if rgEscolaPesquisar.ItemIndex = 0 then
  begin
    edtEscolaBuscarCodigo.Enabled := True;
    dtpEscolaBuscarData.Enabled := False;
  end
  else
  begin
    dtpEscolaBuscarData.Enabled := True;
    edtEscolaBuscarCodigo.Enabled := False;
  end;
end;

//procedure TfrmPesquisaEscola.SetCodigoEscolaSelecionado(const Value: Integer);
//begin
////  FCodigoEscolaSelecionado := Value;
//end;

end.
