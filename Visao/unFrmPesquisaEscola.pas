unit unFrmPesquisaEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, unPesquisaEscolaController, unRelEscola;

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
    FControladorPesquisaEscola: TPesquisaEscolaController;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);
    procedure SetControladorPesquisaEscola(const Value: TPesquisaEscolaController);

  public
    FRelatorio: TfrmRelEscola;

    constructor Create(AOwen: TComponent); override;
    destructor Destroy; override;

    property ControladorPesquisaEscola: TPesquisaEscolaController read FControladorPesquisaEscola write SetControladorPesquisaEscola;
  end;

var
  frmPesquisaEscola: TfrmPesquisaEscola;

implementation

uses
  unFrmPrincipal, unFrmCadEscola;

{$R *.dfm}
//Método executado logo depois do Construtor
constructor TfrmPesquisaEscola.Create(AOwen: TComponent);
begin
  inherited;
  FControladorPesquisaEscola := TPesquisaEscolaController.Create; //Instãncia da Classe Controller
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
//(BOTÃO NOVO CADASTRO)
procedure TfrmPesquisaEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA está FECHADO para ser CRIADO
    frmCadEscola := TfrmCadEscola.Create(frmPrincipal);
  frmCadEscola.Show;
  frmCadEscola.btnNovoCadastroClick(Sender); //Evento do botão NOVO CADASTRO do Form CADASTRO ESCOLA
  Close;
end;

procedure TfrmPesquisaEscola.FormShow(Sender: TObject);
begin
  rgEscolaPesquisar.SetFocus; //Inicia o Form setado a opção de CONSULTA POR CÓDIGO
  dtpEscolaBuscarData.DateTime := StrToDateTime(FormatDateTime('DD/MM/YYYY', Now)); //Seta data atual do SO
end;
//(COMBOBOX 'ORDENAR POR')
procedure TfrmPesquisaEscola.ComboBoxEscolaConsultaOrdenadaChange(
  Sender: TObject);
begin
  ConsultaOrdenada(ComboBoxEscolaConsultaOrdenada.ItemIndex); //Método ordenador conforme a seleção da COMBOBOX
end;
//Método para ordenação da lista de consulta por CÓDIGO, DESCRIÇÃO ou DATA DE CADASTRO
procedure TfrmPesquisaEscola.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  FControladorPesquisaEscola.ConsultaOrdenada(AIndiceComboBox);
end;
//(BOTÃO PESQUISAR)
procedure TfrmPesquisaEscola.btnEscolaBuscarClick(Sender: TObject);
begin
  FControladorPesquisaEscola.Create;
  FControladorPesquisaEscola.AbrirConexaoClientDS;
  FControladorPesquisaEscola.DesabilitarFilteredClientDS; //Desabilita filtro
  if rgEscolaPesquisar.ItemIndex = 0 then //Verifica se RadioButton selecionado para consulta é o CÓDIGO
  begin
    edtEscolaBuscarCodigo.SelectAll; //Selecionar todo conteúdo uqe Edit Código possuir
    if (edtEscolaBuscarCodigo.Text = '') then
    begin
      FControladorPesquisaEscola.DesabilitarFilteredClientDS;;
      FControladorPesquisaEscola.CarregarTodosRegistrosClientDS; //Exibe todos os registros se a consulta for vazia
      FControladorPesquisaEscola.HabilitarFilteredClientDS; //Habilita filtro
    end
    else
    begin
      if not FControladorPesquisaEscola.CarregarConsultaClientDS('ESCCOD', edtEscolaBuscarCodigo.Text) then
        ShowMessage('Registro não localizado. Verifique o código digitado e tente novamente.')
    end;
    edtEscolaBuscarCodigo.SetFocus; //Sempre será setado foco após a consulta por CÓDIGO
  end
  else
  begin
    if not FControladorPesquisaEscola.CarregarConsultaClientDS('ESCDATACAD',
      FormatDateTime('DD/MM/YYYY', dtpEscolaBuscarData.Date)) then
      ShowMessage('Registro não localizado. Verifique a data consultada e tente novamente.');

    dtpEscolaBuscarData.SetFocus; //Sempre será setado foco após a consulta por DATA
  end;
end;
//(BOTÃO TELA PRINCIPAL)
procedure TfrmPesquisaEscola.btnEscolaConsultaFecharClick(Sender: TObject);
begin
  Close;
end;
//Evento Click do DBGRID. Fecha o Form atual para abrir o Form CADASTRO ESCOLA
procedure TfrmPesquisaEscola.DBGridListaEscolaDblClick(Sender: TObject);
begin
  if not Assigned(frmCadEscola) then //Verifica se o Form CADASTRO ESCOLA está FECHADO para ser CRIADO
    frmCadEscola := TfrmCadEscola.Create(frmPrincipal);
  Close;
  frmCadEscola.Show;
  FControladorPesquisaEscola.AbrirConexaoClientDS; //Certifica se manter a conexão aberta para que o dado clicado seja consultado
end;
destructor TfrmPesquisaEscola.Destroy;
begin
  FreeAndNil(FControladorPesquisaEscola);
  inherited;
end;

//Evento para click do ENTER no campo de consulta por DATA DE CADASTRO
procedure TfrmPesquisaEscola.dtpEscolaBuscarDataKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnEscolaBuscarClick(Sender)
end;
//Evento para carregar todos os registros quando limpar conteúdo do Edit
procedure TfrmPesquisaEscola.edtEscolaBuscarCodigoChange(Sender: TObject);
begin
  if (edtEscolaBuscarCodigo.Text = EmptyStr) then
    FControladorPesquisaEscola.DesabilitarFilteredClientDS;
end;
//Evento para permitir somente números e click do ENTER no campo de consulta por CÓDIGO
procedure TfrmPesquisaEscola.edtEscolaBuscarCodigoKeyPress(Sender: TObject;
  var Key: Char);
var
  keyAux: Char;
begin
  keyAux := Key; //Variável auxiliar para fazer nova verificação depois de ser limpado na primeira verificação
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
  dtpEscolaBuscarDataKeyPress(Sender, KeyAux); //Método permite ação da tecla ENTER
end;
//Habilitar campos de consulta CÓDIGO ou DATA DE CADASTRO conforme seleção correspondente dos RadioButtons
procedure TfrmPesquisaEscola.rgEscolaPesquisarClick(Sender: TObject);
begin
  if rgEscolaPesquisar.ItemIndex = 0 then //ItemIndex = 0 = Código
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

procedure TfrmPesquisaEscola.SetControladorPesquisaEscola(const Value: TPesquisaEscolaController);
begin
  FControladorPesquisaEscola := Value;
end;

procedure TfrmPesquisaEscola.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Release; //Libera o Form da memória permitindo a execução da fila antes que receba o Free
  frmPesquisaEscola := nil;
end;

end.
