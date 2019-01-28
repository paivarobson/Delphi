unit unFrmCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, StdCtrls, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unCadEscolaController, ADODB, ComCtrls, Mask,              
  JvExMask, JvToolEdit, JvDBControls, cxDropDownEdit, cxCalendar,
  dxCore, cxDateUtils, StrUtils;

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
    procedure btnEscolaLimparClick(Sender: TObject);
    procedure btnEscolaExcluirClick(Sender: TObject);
    procedure btnEscolaAlterarClick(Sender: TObject);
    procedure btnEscolaPesquisarClick(Sender: TObject);
    procedure edtEscolaEndNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AvancarCampo(Sender: TObject; var Key: Char);
    procedure btnEscolaFecharClick(Sender: TObject);
  private
    FControladorEscola: TCadEscolaController;
//    function HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados: Boolean;
    procedure SetControlador(const Value: TCadEscolaController);
    { Private declarations }
  public
    destructor Destroy; override;

    procedure CarregarComponentesCadEscola;
    procedure CarregarEntidadeEscola;
    procedure LimparCampos;
    procedure HabilitarDesabilitarComponentesDados;
    procedure AfterConstruction; override;
    procedure CarregarEscola;
    procedure LimparCamposForm;

    function ValidaCampos: Boolean;
    
    property ControladorEscola: TCadEscolaController read FControladorEscola write SetControlador;

  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

uses
  unRelEscola, unFrmPesquisaEscola, unFrmPrincipal;

{$R *.dfm}
procedure TfrmCadEscola.CarregarEntidadeEscola;
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

procedure TfrmCadEscola.CarregarEscola;
begin
  ControladorEscola.CarregarEscola;
  CarregarComponentesCadEscola;
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
  ControladorEscola := TCadEscolaController.Create; //Inst�ncia da Classe Controller
  if ControladorEscola.EstadoClientDS = dsBrowse then
  begin
    ControladorEscola.CarregarEscola;
    CarregarComponentesCadEscola;
  end
  else
  begin
    CarregarComponentesCadEscola;
    HabilitarDesabilitarComponentesDados;
    edtEscolaCodigo.Text := EmptyStr;
    cxDateEditEscolaDataCadastro.Text := EmptyStr;
  end;
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
  ControladorEscola.NovoCadastroClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necess�rios para NOVO CADASTRO
  edtEscolaNome.SetFocus;
  LimparCampos; //Limpa os campos necess�rios para NOVO CADASTRO caso possuam algum dado
  ControladorEscola.EscolaModelo.Codigo := ControladorEscola.DevolverUltimoCodigo + 1; //Aplica o C�DIGO IDENTIFICADOR
  edtEscolaCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
  cxDateEditEscolaDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now); //Atribui DATA ATUAL do SO
end;
//(BOT�O GRAVAR)
procedure TfrmCadEscola.btnEscolaGravarClick(Sender: TObject);
begin
  CarregarEntidadeEscola;
  try
    if Self.ValidaCampos then
      if MessageDlg('Tem certeza que deseja gravar este registro?', mtConfirmation,
        mbYesNo, 0) = mrYes then
      begin
//        ControladorEscola.EscolaModelo.GravarEscolaClientDS;
        if ControladorEscola.Gravar then
        begin
          HabilitarDesabilitarComponentesDados;
          btnEscolaCancelar.Enabled := False;


          btnEscolaPesquisar.Enabled := True;
          btnEscolaFechar.Enabled := True;
          

//          HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
          ShowMessage('Registro gravado com sucesso!');
        end
        else
          raise ExceptClass.Create('');
      end
  except
    Application.MessageBox('N�o se preocupe, apenas clique em OK e tente novamente.',
      'Algo deu errado!', MB_ICONWARNING);
  end;
end;
//(BOT�O ALTERAR) Evento para habilitar campos para a edi��o
procedure TfrmCadEscola.btnEscolaAlterarClick(Sender: TObject);
begin  
  ControladorEscola.EscolaModelo.AlterarClientDS;
   ControladorEscola.EstadoClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necess�rios para EDI��O
end;
//(BOT�O LIMPAR)
procedure TfrmCadEscola.btnEscolaLimparClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja limpar os campos?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    LimparCamposForm;
  end;
end;
//(BOT�O CANCELAR) Evento para Habilitar/Desabilitar componentes de acordo com as verifica��es
procedure TfrmCadEscola.btnEscolaCancelarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja cancelar a edi��o deste registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorEscola.CancelarEdicaoClientDS;
//    ControladorEscola.LimparCampos;
    HabilitarDesabilitarComponentesDados;
    CarregarComponentesCadEscola;
  end;
end;
//(BOT�O EXCLUIR)
procedure TfrmCadEscola.btnEscolaExcluirClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorEscola.ExcluirClientDS;
    LimparCampos;
    edtEscolaCodigo.Text := '';
    HabilitarDesabilitarComponentesDados;
    ShowMessage('Registro exclu�do com sucesso!');
  end
end;

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release; //Libera o Form da mem�ria permitindo a execu��o da fila antes que receba o Free
  frmCadEscola := nil;
end;
procedure TfrmCadEscola.LimparCampos;
begin
  ControladorEscola.LimparCampos;
  CarregarComponentesCadEscola;
end;

procedure TfrmCadEscola.LimparCamposForm;
begin
  edtEscolaNome.Text := EmptyStr;
  maskEditEscolaEndCEP.Text := EmptyStr;
  edtEscolaEndRua.Text := EmptyStr;
  edtEscolaEndNumero.Text := EmptyStr;
  edtEscolaEndComplemento.Text := EmptyStr;
  edtEscolaEndBairro.Text := EmptyStr;
  edtEscolaEndCidade.Text := EmptyStr;
end;

procedure TfrmCadEscola.SetControlador(const Value: TCadEscolaController);
begin
  FControladorEscola := Value;
end;
function TfrmCadEscola.ValidaCampos: Boolean;
var
  i: Integer;
  Campos: TStrings;
begin
  Campos := TStringList.Create;
  try
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i].ClassType = TEdit) or 
        (Components[i].ClassType = TcxDateEdit) or
        (Components[i].ClassType = TMaskEdit) then
      begin
        if (Components[i].Tag = 1) and 
          (TEdit(Components[i]).Text = EmptyStr) or
          (TcxDateEdit(Components[i]).Text = EmptyStr) or
          (TMaskEdit(Components[i]).Text = '     -   ') then
        begin  
          Campos.Add('- ' + (TWinControl(Components[i]).Hint)); //Armazena o NOME DO CAMPO dentro de uma LISTA
        end;
      end;
    end;
    if (Campos.Count > 0) then //Verifica se h� algum campo obrigat�rio vazio
    begin
      Result := False;
      ShowMessage('Preencha os campos obrigat�rios:' + #13 + #13 + Campos.Text); //Exibe os CAMPOS por NOME
    end
    else
      Result := True;
  finally
    Campos.Free; //Libera a lista da mem�ria
  end;
end;

//M�todo para permitir escrita de somente n�meros
procedure TfrmCadEscola.edtEscolaEndNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13, #27]) then
  begin
    Key := #0;
    Application.MessageBox('Somente n�meros.', 'Caractere inv�lido', MB_ICONWARNING)
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
procedure TfrmCadEscola.HabilitarDesabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  btnEscolaGravar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnEscolaLimpar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnEscolaCancelar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnEscolaPesquisar.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  btnEscolaFechar.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  edtEscolaNome.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEscolaEndRua.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEscolaEndNumero.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEscolaEndComplemento.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEscolaEndCidade.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  maskEditEscolaEndCEP.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEscolaEndBairro.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);

  if not (ControladorEscola.EscolaModelo.Codigo = ControladorEscola.DevolverUltimoCodigo + 1) then
  begin
    btnEscolaAlterar.Enabled := ControladorEscola.EstadoClientDS = dsBrowse;
    btnEscolaExcluir.Enabled := ControladorEscola.EstadoClientDS = dsBrowse;
  end
  else
  begin
    btnEscolaAlterar.Enabled := False;
    btnEscolaExcluir.Enabled := False;
  end;                                
end;

procedure TfrmCadEscola.btnEscolaFecharClick(Sender: TObject);
begin
  Close;
end;

destructor TfrmCadEscola.Destroy;
begin
  inherited;
  FreeAndNil(FControladorEscola);
end;

end.
