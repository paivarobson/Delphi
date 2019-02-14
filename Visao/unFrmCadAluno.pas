unit unFrmCadAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmCadPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ComCtrls, dxCore, cxDateUtils,
  Mask, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, unFrmPrincipal,
  unCadAlunoController, DB, unFrmPesquisaAluno;

type
  TfrmCadAluno = class(TfrmCadPadrao)
    Label1: TLabel;
    lblMatricula: TLabel;
    edtMatricula: TEdit;
    Label2: TLabel;
    edtNomeMae: TEdit;
    edtNomePai: TEdit;
    Label3: TLabel;
    maskEditCPF: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction); override;
    
    procedure btnConsultarClick(Sender: TObject);
    procedure btnNovoCadastroClick(Sender: TObject); override;
    procedure btnLimparClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure maskEditCPFKeyPress(Sender: TObject; var Key: Char);
    procedure maskEditEndCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edtEndNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    
  private
    FControladorAluno: TCadAlunoController;
    procedure SetControladorAluno(const Value: TCadAlunoController);

  public
    destructor Destroy; override;

    procedure CarregarComponentesCadEscola;
    procedure CarregarEntidadeAluno;
    procedure LimparCamposForm; override;
    procedure LimparCamposModelo;
    procedure HabilitarDesabilitarComponentesDados;
    procedure AfterConstruction; override;
    procedure CarregarEscola;

    property ControladorAluno: TCadAlunoController read FControladorAluno write SetControladorAluno;

  end;

var
  frmCadAluno: TfrmCadAluno;

implementation

{$R *.dfm}

procedure TfrmCadAluno.AfterConstruction;
begin
  inherited;
  ControladorAluno := TCadAlunoController.Create; //Instãncia da Classe Controller
  if ControladorAluno.EstadoClientDS = dsBrowse then
  begin
    ControladorAluno.CarregarEntidadeModeloDoClientDS;
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

procedure TfrmCadAluno.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja cancelar a edição deste registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorAluno.CancelarEdicaoClientDS;
    HabilitarDesabilitarComponentesDados;
    CarregarComponentesCadEscola;
  end;
end;

procedure TfrmCadAluno.btnConsultarClick(Sender: TObject);
begin
  if not Assigned(frmPesquisaAluno) then //Verifica se o Form PESQUISA ESCOLA está FECHADO para ser CRIADO
  begin
    frmPesquisaAluno := TfrmPesquisaAluno.Create(frmPrincipal);
    ControladorAluno.FecharConexaoClientDS;
  end;
  frmPesquisaAluno.Show;
  Close;
end;

procedure TfrmCadAluno.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadAluno.btnGravarClick(Sender: TObject);
begin
  inherited;
  CarregarEntidadeAluno;
  try
    if Self.ValidaCampos then
      if MessageDlg('Tem certeza que deseja gravar este registro?', mtConfirmation,
        mbYesNo, 0) = mrYes then
      begin
        if ControladorAluno.Gravar then
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

procedure TfrmCadAluno.btnLimparClick(Sender: TObject);
begin
  LimparCamposForm;
end;

procedure TfrmCadAluno.btnNovoCadastroClick(Sender: TObject);
begin
  ControladorAluno.NovoCadastroClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necessários para NOVO CADASTRO
  LimparCamposModelo; //Limpa os campos necessários para NOVO CADASTRO caso possuam algum dado
  ControladorAluno.AlunoModelo.Codigo := ControladorAluno.DevolverUltimoCodigo + 1; //Aplica o CÓDIGO IDENTIFICADOR
  edtCodigo.Text := IntToStr(ControladorAluno.AlunoModelo.Codigo);
  inherited;
  edtMatricula.SetFocus;
end;

procedure TfrmCadAluno.CarregarComponentesCadEscola;
begin
  edtCodigo.Text := IntToStr(ControladorAluno.AlunoModelo.Codigo);
  edtMatricula.Text := ControladorAluno.AlunoModelo.Matricula;
  edtNome.Text := ControladorAluno.AlunoModelo.Nome;
  cxDateEditDataCadastro.Date := ControladorAluno.AlunoModelo.DataCadastro;
  maskEditCPF.Text := ControladorAluno.AlunoModelo.Cpf;
  edtNomeMae.Text := ControladorAluno.AlunoModelo.NomeMae;
  edtNomePai.Text := ControladorAluno.AlunoModelo.NomePai;
  maskEditEndCEP.Text := ControladorAluno.AlunoModelo.Cep;
  edtEndRua.Text := ControladorAluno.AlunoModelo.Rua;
  edtEndNumero.Text := ControladorAluno.AlunoModelo.Numero;
  edtEndComplemento.Text := ControladorAluno.AlunoModelo.Complemento;
  edtEndBairro.Text := ControladorAluno.AlunoModelo.Bairro;
  edtEndCidade.Text := ControladorAluno.AlunoModelo.Cidade;
end;

procedure TfrmCadAluno.CarregarEntidadeAluno;
begin
  ControladorAluno.AlunoModelo.Codigo := StrToInt(edtCodigo.Text);
  ControladorAluno.AlunoModelo.Matricula := edtMatricula.Text;
  ControladorAluno.AlunoModelo.Nome := edtNome.Text;
  ControladorAluno.AlunoModelo.DataCadastro := cxDateEditDataCadastro.Date;
  ControladorAluno.AlunoModelo.Cpf := maskEditCPF.Text;
  ControladorAluno.AlunoModelo.NomeMae := edtNomeMae.Text;
  ControladorAluno.AlunoModelo.NomePai := edtNomePai.Text;
  ControladorAluno.AlunoModelo.Cep := maskEditEndCEP.Text;
  ControladorAluno.AlunoModelo.Rua := edtEndRua.Text;
  ControladorAluno.AlunoModelo.Numero := edtEndNumero.Text;
  ControladorAluno.AlunoModelo.Complemento := edtEndComplemento.Text;
  ControladorAluno.AlunoModelo.Bairro := edtEndBairro.Text;
  ControladorAluno.AlunoModelo.Cidade := edtEndCidade.Text;
end;

procedure TfrmCadAluno.CarregarEscola;
begin

end;

destructor TfrmCadAluno.Destroy;
begin
  FreeAndNil(FControladorAluno);
  inherited;
end;

procedure TfrmCadAluno.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  PermitirSomenteNumeros(Sender, Key);
end;

procedure TfrmCadAluno.edtEndNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  PermitirSomenteNumeros(Sender, Key);
end;

procedure TfrmCadAluno.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  AvancarCampo(Sender, Key);
end;

procedure TfrmCadAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadAluno := nil;
end;

procedure TfrmCadAluno.HabilitarDesabilitarComponentesDados;
begin
  btnNovoCadastro.Enabled := (ControladorAluno.EstadoClientDS in [dsInactive, dsBrowse]);
  btnGravar.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  btnLimpar.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  btnConsultar.Enabled := (ControladorAluno.EstadoClientDS in [dsInactive, dsBrowse]);
  btnFechar.Enabled := (ControladorAluno.EstadoClientDS in [dsInactive, dsBrowse]);
  edtMatricula.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtNome.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  maskEditCPF.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtNomePai.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtNomeMae.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndRua.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndNumero.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndComplemento.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndCidade.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  maskEditEndCEP.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);
  edtEndBairro.Enabled := (ControladorAluno.EstadoClientDS in [dsInsert, dsEdit]);

  if not (ControladorAluno.AlunoModelo.Codigo = ControladorAluno.DevolverUltimoCodigo + 1) then
  begin
    btnAlterar.Enabled := ControladorAluno.EstadoClientDS = dsBrowse;
    btnExcluir.Enabled := ControladorAluno.EstadoClientDS = dsBrowse;
  end
  else
  begin
    btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
  end;
end;

procedure TfrmCadAluno.LimparCamposForm;
begin
  inherited;
  edtMatricula.Text := EmptyStr;
  maskEditCpf.Text := EmptyStr;
  edtNomeMae.Text := EmptyStr;
  edtNomePai.Text := EmptyStr;
end;

procedure TfrmCadAluno.LimparCamposModelo;
begin
  inherited;
  ControladorAluno.LimparCamposModelo;
  CarregarComponentesCadEscola;
end;

procedure TfrmCadAluno.maskEditCPFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  PermitirSomenteNumeros(Sender, Key);
end;

procedure TfrmCadAluno.maskEditEndCEPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  PermitirSomenteNumeros(Sender, Key);
end;

procedure TfrmCadAluno.SetControladorAluno(const Value: TCadAlunoController);
begin
  FControladorAluno := Value;
end;

end.
