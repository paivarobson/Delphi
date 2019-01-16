unit unFrmCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unCadEscolaController, ADODB, ComCtrls, Mask,
  JvExMask, JvToolEdit, JvDBControls, cxDropDownEdit, cxCalendar,
  dxCore, cxDateUtils;

type
  TfrmCadEscola = class(TForm)
    lblEscolaCodigo: TLabel;
    lblEscolaNome: TLabel;
    lblEscolaDataCadastro: TLabel;
    lblEscolaEndRua: TLabel;
    lblEscolaEndNumero: TLabel;
    lblEscolaEndComplemento: TLabel;
    lblEscolaEndBairro: TLabel;
    lblEscolaEndCidade: TLabel;
    lblEscolaendCep: TLabel;
    lblEscolaFrmTitulo: TLabel;
    btnEscolaNovoCadastro: TButton;
    btnEscolaGravar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaCancelar: TButton;
    btnEscolaLimpar: TButton;
    btnEscolaPesquisar: TButton;
    btnEscolaFechar: TButton;
    edtEscolaCodigo: TEdit;
    maskEditEscolaEndCEP: TMaskEdit;
    edtEscolaNome: TEdit;
    edtEscolaEndRua: TEdit;
    edtEscolaEndNumero: TEdit;
    edtEscolaEndComplemento: TEdit;
    edtEscolaEndBairro: TEdit;
    edtEscolaEndCidade: TEdit;
    cxDateEditEscolaDataCadastro: TcxDateEdit;
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
    procedure btnEscolaGravarClick(Sender: TObject);
    procedure btnEscolaCancelarClick(Sender: TObject);
    procedure DesabilitarComponentesDados;
    procedure btnEscolaLimparClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaPesquisarClick(Sender: TObject);
    procedure edtEscolaEndNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AvancarCampo(Sender: TObject; var Key: Char);
    procedure btnEscolaFecharClick(Sender: TObject);
  private
    FControlador: TCadEscolaController;
    function HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados: Boolean;
    procedure SetControlador(const Value: TCadEscolaController);
    { Private declarations }
  public
    destructor Destroy; override;

    procedure CarregarComponentesCadEscola;
    procedure CarregarClientDS;
    procedure HabilitarComponentesDados;
    procedure AfterConstruction; override;

    function CamposValidados: Boolean;
    
    property ControladorEscola: TCadEscolaController read FControlador write SetControlador;

  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

uses
  unRelEscola, unFrmPesquisaEscola, unFrmPrincipal, unDados;

{$R *.dfm}
procedure TfrmCadEscola.CarregarClientDS;
begin
  ControladorEscola.EscolaModelo.Codigo := StrToInt(edtEscolaCodigo.Text);
  ControladorEscola.EscolaModelo.Nome := edtEscolaNome.Text;
  ControladorEscola.EscolaModelo.DataCadastro := cxDateEditEscolaDataCadastro.Date;
  ControladorEscola.EscolaModelo.Cep := maskEditEscolaEndCEP.Text;
  ControladorEscola.EscolaModelo.Rua := edtEscolaEndRua.Text;
  ControladorEscola.EscolaModelo.Numero := edtEscolaEndNumero.Text;
  ControladorEscola.EscolaModelo.Complemento := edtEscolaEndComplemento.Text;
  ControladorEscola.EscolaModelo.Bairro := edtEscolaEndBairro.Text;
  ControladorEscola.EscolaModelo.Cidade := edtEscolaEndCidade.Text;
end;

procedure TfrmCadEscola.CarregarComponentesCadEscola;
begin
  edtEscolaCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
  edtEscolaNome.Text := ControladorEscola.EscolaModelo.Nome;
  cxDateEditEscolaDataCadastro.Date := ControladorEscola.EscolaModelo.DataCadastro;
  maskEditEscolaEndCEP.Text := ControladorEscola.EscolaModelo.Cep;
  edtEscolaEndRua.Text := ControladorEscola.EscolaModelo.Rua;
  edtEscolaEndNumero.Text := ControladorEscola.EscolaModelo.Numero;
  edtEscolaEndComplemento.Text := ControladorEscola.EscolaModelo.Complemento;
  edtEscolaEndBairro.Text := ControladorEscola.EscolaModelo.Bairro;
  edtEscolaEndCidade.Text := ControladorEscola.EscolaModelo.Cidade;
end;

//M�todo executado logo depois do Construtor
procedure TfrmCadEscola.AfterConstruction;
begin
  inherited;
//  StatusBar1.Panels[0].Text :=
//    IntToStr(Controlador.EscolaModelo.Codigo) + #13 + ' - ' +
//    Controlador.EscolaModelo.Nome + #13 + ' - ' +
//    DateToStr(Controlador.EscolaModelo.DataCadastro) + #13 + ' - ' +
//    Controlador.EscolaModelo.Cep + #13 + ' - ' +
//    Controlador.EscolaModelo.Rua + #13 + ' - ' +
//    Controlador.EscolaModelo.Numero + #13 + ' - ' +
//    Controlador.EscolaModelo.Complemento + #13 + ' - ' +
//    Controlador.EscolaModelo.Bairro + #13 + ' - ' +
//    Controlador.EscolaModelo.Cidade;
end;

procedure TfrmCadEscola.FormShow(Sender: TObject);
begin
  ControladorEscola := TCadEscolaController.Create; //Inst�ncia da Classe Controller
//  ControladorEscola.CarregarEscola(1);
  CarregarComponentesCadEscola;
//  HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
end;
//(BOT�O PESQUISAR) Evento para abrir o Form PESQUISA ESCOLA 
procedure TfrmCadEscola.btnEscolaPesquisarClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA est� FECHADO para ser CRIADO
    frmPesquisaEscola := TfrmPesquisaEscola.Create(frmPrincipal);
  frmPesquisaEscola.Show;
  Close;
end;
//(Bot�o NOVO CADASTRO) Evento para habilitar campos para a inclus�o
procedure TfrmCadEscola.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  ControladorEscola.NovoCadastroEscola;
  HabilitarComponentesDados; //Habilita os componentes necess�rios para NOVO CADASTRO
  ControladorEscola.LimparFieldsCDS; //Limpa os campos necess�rios para NOVO CADASTRO caso possuam algum dado
  ControladorEscola.EscolaModelo.Codigo := ControladorEscola.DevolverUltimoCodigo + 1; //Aplica o C�DIGO IDENTIFICADOR
  edtEscolaCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
  btnEscolaPesquisar.Enabled := False;
  btnEscolaAlterar.Enabled := False;
  btnEscolaExcluir.Enabled := False;
  cxDateEditEscolaDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now); //Atribui DATA ATUAL do SO
end;
//(BOT�O GRAVAR)
procedure TfrmCadEscola.btnEscolaGravarClick(Sender: TObject);
begin
  CarregarClientDS;
  ControladorEscola.Gravar;
  try
    if ControladorEscola.EscolaModelo.ValidarCampos then
      if MessageDlg('Tem certeza que deseja gravar este registro?', mtConfirmation,
        mbYesNo, 0) = mrYes then
      begin
//        ControladorEscola.Gravar;
        DesabilitarComponentesDados;
        btnEscolaCancelar.Enabled := False;
        btnEscolaPesquisar.Enabled := True;
//        HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
        fmdados.Gravar;
        ShowMessage('Registro gravado com sucesso!');
      end
  except
    Application.MessageBox('N�o se preocupe, apenas clique em OK e tente novamente.',
      'Algo deu errado!', MB_ICONWARNING);
  end;
end;
//(BOT�O ALTERAR) Evento para habilitar campos para a edi��o
procedure TfrmCadEscola.btnEscolaAlterarClick(Sender: TObject);
begin  
  ControladorEscola.DadosCDS.Edit;
  HabilitarComponentesDados; //Habilita os componentes necess�rios para EDI��O
  HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
  btnEscolaPesquisar.Enabled := False;
end;
//(BOT�O LIMPAR)
procedure TfrmCadEscola.btnEscolaLimparClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja limpar os campos?', mtConfirmation,
    mbYesNo, 0) = mrYes then
    ControladorEscola.LimparFieldsCDS
end;
//(BOT�O CANCELAR) Evento para Habilitar/Desabilitar componentes de acordo com as verifica��es
procedure TfrmCadEscola.btnEscolaCancelarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja cancelar a edi��o deste registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
    ControladorEscola.CancelarEdicaoEscola;
    DesabilitarComponentesDados;
    btnEscolaPesquisar.Enabled := True;
  end;
end;
//(BOT�O EXCLUIR) 
procedure TfrmCadEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorEscola.ExcluirEscola;
    HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
    DesabilitarComponentesDados;
    btnEscolaPesquisar.Enabled := True;
    ShowMessage('Registro exclu�do com sucesso!');
  end
end;
//Valida��o de campos obrigat�rios se est�o vazios
function TfrmCadEscola.CamposValidados: Boolean;
var
  i: Integer;
  Campos: TStrings;
begin
  Campos := TStringList.Create;
  try
    for i := 0 to ControladorEscola.DadosCDS.Fields.Count - 1 do
    begin
      if (ControladorEscola.DadosCDS.Fields[i].Tag = 1) and
        (ControladorEscola.DadosCDS.Fields[i].AsString = EmptyStr) then
        Campos.Add('- ' + ControladorEscola.DadosCDS.Fields[i].DisplayName) //Armazena o NOME DO CAMPO dentro de uma LISTA
    end;
    if (Campos.Count > 0) then //Verifica se h� algum campo obrigat�rio vazio
    begin
      Result := False;
      ShowMessage('unFrmCadEscola - Preencha os campos obrigat�rios:' + #13 + #13 + Campos.Text); //Exibe os CAMPOS por NOME
    end
    else
      Result := True;
  finally
    Campos.Free; //Libera a lista da mem�ria
  end;
end;

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release; //Libera o Form da mem�ria permitindo a execu��o da fila antes que receba o Free
  frmCadEscola := nil;
end;
//M�t�do verifica as ocasi�es que os BOT�ES ALTERAR e EXCLUIR devem serem habilitados ou n�o
function TfrmCadEscola.HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados: Boolean;
begin
  if ControladorEscola.DadosCDS.Active then
  begin
    if ControladorEscola.EscolaModelo.Codigo = (ControladorEscola.DevolverUltimoCodigo + 1) then
    begin
      btnEscolaAlterar.Enabled := False;
      btnEscolaExcluir.Enabled := False;
      ControladorEscola.DadosCDS.Close;
      Result := False;
    end
    else
    begin
      btnEscolaAlterar.Enabled := True;
      btnEscolaExcluir.Enabled := True;
      Result := True;
    end;
  end
  else
  begin
    btnEscolaAlterar.Enabled := False;
    btnEscolaExcluir.Enabled := False;
    Result := False;
  end;
end;
procedure TfrmCadEscola.SetControlador(const Value: TCadEscolaController);
begin
  FControlador := Value;
end;

//M�todo para permitir escrita de somente n�meros
procedure TfrmCadEscola.edtEscolaEndNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13, #27]) then
  begin
    Key := #0;
    Application.MessageBox('Somente n�meros.','Caractere inv�lido', MB_ICONWARNING)
  end
  else
    AvancarCampo(Sender, Key) //Avan�ar e recuar campo com a tecla ENTER e ESC respectivamente
end;
//M�todo para avan�ar e recuar campo com a tecla ENTER e ESC respectivamente
procedure TfrmCadEscola.AvancarCampo(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then //Verifica se a tecla pressionada � ENTER
    Perform(WM_nextdlgctl,0,0)
  else
    if Key = #27 then //Verifica se a tecla pressionada � ESC
      Perform(WM_nextdlgctl,1,0)
end;
//M�todo desabilitador da maioria dos componentes
procedure TfrmCadEscola.DesabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := True;
  btnEscolaGravar.Enabled := False;
  btnEscolaLimpar.Enabled := False;
  btnEscolaCancelar.Enabled := False;
  edtEscolaCodigo.Enabled := False;
  edtEscolaNome.Enabled := False;
  edtEscolaEndRua.Enabled := False;
  edtEscolaEndNumero.Enabled := False;
  edtEscolaEndComplemento.Enabled := False;
  edtEscolaEndCidade.Enabled := False;
  maskEditEscolaEndCEP.Enabled := False;
  edtEscolaEndBairro.Enabled := False;
end;
//M�todo habilitador da maioria dos componentes
procedure TfrmCadEscola.HabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := False;
  btnEscolaGravar.Enabled := True;
  btnEscolaLimpar.Enabled := True;
  btnEscolaCancelar.Enabled := True;
  edtEscolaNome.Enabled := True;
  edtEscolaEndRua.Enabled := True;
  edtEscolaEndNumero.Enabled := True;
  edtEscolaEndComplemento.Enabled := True;
  edtEscolaEndCidade.Enabled := True;
  maskEditEscolaEndCEP.Enabled := True;
  edtEscolaEndBairro.Enabled := True;
  edtEscolaNome.SetFocus;
end;

procedure TfrmCadEscola.btnEscolaFecharClick(Sender: TObject);
begin
  Close;
end;

destructor TfrmCadEscola.Destroy;
begin
  FreeAndNil(FControlador);
  inherited;
end;

end.
