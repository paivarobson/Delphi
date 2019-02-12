unit unFrmCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmCadPadrao, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ComCtrls, dxCore, cxDateUtils, DB,
  Mask, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, unCadEscolaController, unFrmPrincipal;

type
  TfrmCadEscola = class(TfrmCadPadrao)
    procedure btnNovoCadastroClick(Sender: TObject); override;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction); override;
    procedure btnEscolaPesquisarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtEndNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FControladorEscola: TCadEscolaController;
    procedure SetControladorEscola(const Value: TCadEscolaController);

  public
    destructor Destroy; override;

    procedure CarregarComponentesCadEscola;
    procedure CarregarEscolaModeloDosComponentesForm;
    procedure LimparCamposModelo;
    procedure HabilitarDesabilitarComponentesDados;
    procedure AfterConstruction; override;
    procedure CarregarEscola;

    property ControladorEscola: TCadEscolaController read FControladorEscola write SetControladorEscola;
  end;

var
  frmCadEscola: TfrmCadEscola;

implementation

uses unFrmPesquisaEscola;

{$R *.dfm}


//(Botão NOVO CADASTRO) Evento para habilitar campos para a inclusão
procedure TfrmCadEscola.AfterConstruction;
begin
//  inherited;
//  ControladorEscola := TCadEscolaController.Create; //Instãncia da Classe Controller
//  if ControladorEscola.EstadoClientDS = dsBrowse then
//  begin
//    ControladorEscola.CarregarEntidade;
//    CarregarComponentesCadEscola;
//  end
//  else
//  begin
//    CarregarComponentesCadEscola;
//    edtCodigo.Text := EmptyStr;
//    cxDateEditDataCadastro.Text := EmptyStr;
//  end;
//  HabilitarDesabilitarComponentesDados;
end;

procedure TfrmCadEscola.btnAlterarClick(Sender: TObject);
begin
  inherited;
  ControladorEscola := TCadEscolaController.Create;
  ControladorEscola.AlterarClientDS;
  ControladorEscola.EstadoClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necessários para EDIÇÃO
end;

procedure TfrmCadEscola.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja cancelar a edição deste registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorEscola.CancelarEdicaoClientDS;
    HabilitarDesabilitarComponentesDados;

    //Fazer consulta do item pelo CÓDIGO desde que o código exista no BD
    //Fazer isto para garantir a exibição dos dados ao cancelar edição caso aqueles campos tenham sido limpos
    ControladorEscola.EscolaModelo.Codigo := StrToInt(edtCodigo.Text);
    if ControladorEscola.ClientDSPossuiDado then
      CarregarComponentesCadEscola;
  end;
end;

procedure TfrmCadEscola.btnConsultarClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA está FECHADO para ser CRIADO
  begin
    frmPesquisaEscola := TfrmPesquisaEscola.Create(frmPrincipal);
    ControladorEscola.FecharConexaoClientDS;
  end;
  frmPesquisaEscola.Show;
  Close;
end;

procedure TfrmCadEscola.btnEscolaPesquisarClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA está FECHADO para ser CRIADO
    frmPesquisaEscola := TfrmPesquisaEscola.Create(frmPrincipal);
  frmPesquisaEscola.Show;
  Close;
end;

procedure TfrmCadEscola.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorEscola.ExcluirClientDS;
    LimparCamposModelo;
    edtCodigo.Text := '';
    HabilitarDesabilitarComponentesDados;
    ShowMessage('Registro excluído com sucesso!');
  end
end;

procedure TfrmCadEscola.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadEscola.btnGravarClick(Sender: TObject);
begin
  inherited;
  CarregarEscolaModeloDosComponentesForm;
  try
    if Self.ValidaCampos then
      if MessageDlg('Tem certeza que deseja gravar este registro?', mtConfirmation,
        mbYesNo, 0) = mrYes then
      begin
        if ControladorEscola.Gravar then
        begin
          HabilitarDesabilitarComponentesDados;
          btnCancelar.Enabled := False;

          btnConsultar.Enabled := True;
          btnFechar.Enabled := True;

          ShowMessage('Registro gravado com sucesso!');
        end
        else
          raise ExceptClass.Create('');
      end
  except
    Application.MessageBox('Não se preocupe, apenas clique em OK e tente novamente.',
      'Algo deu errado!', MB_ICONWARNING);
  end;
end;

procedure TfrmCadEscola.btnLimparClick(Sender: TObject);
begin
  inherited;
  LimparCamposForm;
end;

procedure TfrmCadEscola.btnNovoCadastroClick(Sender: TObject);
begin
  ControladorEscola.NovoCadastroClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necessários para NOVO CADASTRO
  LimparCamposModelo; //Limpa os campos necessários para NOVO CADASTRO caso possuam algum dado
  ControladorEscola.EscolaModelo.Codigo := ControladorEscola.DevolverUltimoCodigo + 1; //Aplica o CÓDIGO IDENTIFICADOR
  edtCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
  inherited;
end;

procedure TfrmCadEscola.CarregarComponentesCadEscola;
begin
  edtCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
  edtNome.Text := ControladorEscola.EscolaModelo.Nome;
  cxDateEditDataCadastro.Date := ControladorEscola.EscolaModelo.DataCadastro;
  maskEditEndCEP.Text := ControladorEscola.EscolaModelo.Cep;
  edtEndRua.Text := ControladorEscola.EscolaModelo.Rua;
  edtEndNumero.Text := ControladorEscola.EscolaModelo.Numero;
  edtEndComplemento.Text := ControladorEscola.EscolaModelo.Complemento;
  edtEndBairro.Text := ControladorEscola.EscolaModelo.Bairro;
  edtEndCidade.Text := ControladorEscola.EscolaModelo.Cidade;
end;

procedure TfrmCadEscola.CarregarEscolaModeloDosComponentesForm;
begin
  inherited;
  ControladorEscola.EscolaModelo.Codigo := StrToInt(edtCodigo.Text);
  ControladorEscola.EscolaModelo.Nome := edtNome.Text;
  ControladorEscola.EscolaModelo.DataCadastro := cxDateEditDataCadastro.Date;
  ControladorEscola.EscolaModelo.Cep := maskEditEndCEP.Text;
  ControladorEscola.EscolaModelo.Rua := edtEndRua.Text;
  ControladorEscola.EscolaModelo.Numero := edtEndNumero.Text;
  ControladorEscola.EscolaModelo.Complemento := edtEndComplemento.Text;
  ControladorEscola.EscolaModelo.Bairro := edtEndBairro.Text;
  ControladorEscola.EscolaModelo.Cidade := edtEndCidade.Text;
end;

procedure TfrmCadEscola.CarregarEscola;
begin
  inherited;
  ControladorEscola.CarregarEntidadeModeloDoClientDS;
  CarregarComponentesCadEscola;
end;

destructor TfrmCadEscola.Destroy;
begin
  FreeAndNil(FControladorEscola);
  inherited;
end;

procedure TfrmCadEscola.edtEndNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  PermitirSomenteNumeros(Sender, Key);
end;

procedure TfrmCadEscola.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  AvancarCampo(Sender, Key);
end;

//procedure TfrmCadEscola.edtEndNumeroKeyPress(Sender: TObject; var Key: Char);
//begin
//  inherited;
////  if not (Key in ['0'..'9', #8, #13, #27]) then
////  begin
////    Key := #0;
////    Application.MessageBox('Somente números.', 'Caractere inválido', MB_ICONWARNING)
////  end
////  else
////    AvancarCampo(Sender, Key) //Avançar e recuar campo com a tecla ENTER e ESC respectivamente
//end;

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadEscola := nil;
end;

procedure TfrmCadEscola.FormShow(Sender: TObject);
begin
  inherited;
  ControladorEscola := TCadEscolaController.Create; //Instãncia da Classe Controller
  if ControladorEscola.EstadoClientDS = dsBrowse then
  begin
    ControladorEscola.CarregarEntidadeModeloDoClientDS;
    CarregarComponentesCadEscola;
  end
  else
  begin
    CarregarComponentesCadEscola;
    edtCodigo.Text := EmptyStr;
    cxDateEditDataCadastro.Text := EmptyStr;
  end;
  HabilitarDesabilitarComponentesDados;
end;

procedure TfrmCadEscola.HabilitarDesabilitarComponentesDados;
begin
  inherited;
  btnNovoCadastro.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  btnGravar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnLimpar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnConsultar.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  btnFechar.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  edtNome.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndRua.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndNumero.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndComplemento.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndCidade.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  maskEditEndCEP.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndBairro.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);

  if not (ControladorEscola.EscolaModelo.Codigo = ControladorEscola.DevolverUltimoCodigo + 1) then
  begin
    btnAlterar.Enabled := ControladorEscola.EstadoClientDS = dsBrowse;
    btnExcluir.Enabled := ControladorEscola.EstadoClientDS = dsBrowse;
  end
  else
  begin
    btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
  end;   
end;

procedure TfrmCadEscola.LimparCamposModelo;
begin
  inherited;
  ControladorEscola.LimparCamposModelo;
  CarregarComponentesCadEscola;
end;

procedure TfrmCadEscola.SetControladorEscola(const Value: TCadEscolaController);
begin
  FControladorEscola := Value;
end;

end.
