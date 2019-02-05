unit unFrmCadEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFrmCadPadrao, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, ComCtrls, dxCore, cxDateUtils, DB,
  Mask, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, unCadEscolaController, unFrmPrincipal;

type
  TfrmCadEscola = class(TfrmCadPadrao)
    btnEscolaPesquisar: TButton;
    procedure btnNovoCadastroClick(Sender: TObject); override;
    procedure btnGravarClick(Sender: TObject); override;
    procedure btnCancelarClick(Sender: TObject); override;
    procedure btnLimparClick(Sender: TObject); override;
    procedure btnExcluirClick(Sender: TObject); override;
    procedure btnAlterarClick(Sender: TObject); override;
    procedure btnPesquisarClick(Sender: TObject); override;
    procedure edtEndNumeroKeyPress(Sender: TObject; var Key: Char); override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction); override;
//    procedure AvancarCampo(Sender: TObject; var Key: Char); override;
    procedure btnFecharClick(Sender: TObject); override;
    procedure btnEscolaPesquisarClick(Sender: TObject);
  private
    FControladorEscola: TCadEscolaController;
    procedure SetControladorEscola(const Value: TCadEscolaController);

  public
//    constructor Create;
    destructor Destroy; override;

    procedure CarregarComponentesCadEscola; override;
    procedure CarregarEntidadeEscola; override;
    procedure LimparCampos; override;
    procedure LimparCamposForm; override;
    procedure HabilitarDesabilitarComponentesDados; override;
    procedure AfterConstruction; override;
    procedure CarregarEscola; override;

    function ValidaCampos: Boolean; override;

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
  inherited;
  ControladorEscola := TCadEscolaController.Create; //Instãncia da Classe Controller
  if ControladorEscola.EstadoClientDS = dsBrowse then
  begin
    ControladorEscola.CarregarEscola;
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

procedure TfrmCadEscola.btnAlterarClick(Sender: TObject);
begin
  inherited;
  ControladorEscola.AlterarEscolaClientDS;
  ControladorEscola.EstadoClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necessários para EDIÇÃO
end;

procedure TfrmCadEscola.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza que deseja cancelar a edição deste registro?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    ControladorEscola.CancelarEdicaoClientDS;
//    ControladorEscola.LimparCampos;
    HabilitarDesabilitarComponentesDados;
    CarregarComponentesCadEscola;
  end;
end;

procedure TfrmCadEscola.btnEscolaPesquisarClick(Sender: TObject);
begin
  inherited;
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
    LimparCampos;
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
          btnCancelar.Enabled := False;


          btnEscolaPesquisar.Enabled := True;
          btnFechar.Enabled := True;
          

//          HabilitarDesabilitarBotoesAlterarExcluirCasoPossuaDados;
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
  if MessageDlg('Tem certeza que deseja limpar os campos?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin
    LimparCamposForm;
  end;
end;

procedure TfrmCadEscola.btnNovoCadastroClick(Sender: TObject);
begin
  inherited;
  ControladorEscola.NovoCadastroClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necessários para NOVO CADASTRO
  edtNome.SetFocus;
  LimparCampos; //Limpa os campos necessários para NOVO CADASTRO caso possuam algum dado
  ControladorEscola.EscolaModelo.Codigo := ControladorEscola.DevolverUltimoCodigo + 1; //Aplica o CÓDIGO IDENTIFICADOR
  edtCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
  cxDateEditDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now); //Atribui DATA ATUAL do SO
end;

procedure TfrmCadEscola.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmPesquisaEscola) then //Verifica se o Form PESQUISA ESCOLA está FECHADO para ser CRIADO
    frmPesquisaEscola := TfrmPesquisaEscola.Create(frmPrincipal);
  frmPesquisaEscola.Show;
  Close;
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

procedure TfrmCadEscola.CarregarEntidadeEscola;
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
  ControladorEscola.CarregarEscola;
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
  if not (Key in ['0'..'9', #8, #13, #27]) then
  begin
    Key := #0;
    Application.MessageBox('Somente números.', 'Caractere inválido', MB_ICONWARNING)
  end
  else
    AvancarCampo(Sender, Key) //Avançar e recuar campo com a tecla ENTER e ESC respectivamente
end;

procedure TfrmCadEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadEscola := nil;
end;

procedure TfrmCadEscola.HabilitarDesabilitarComponentesDados;
begin
  inherited;
  btnNovoCadastro.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
  btnGravar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnLimpar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnCancelar.Enabled := (ControladorEscola.EstadoClientDS in [dsInsert, dsEdit]);
  btnEscolaPesquisar.Enabled := (ControladorEscola.EstadoClientDS in [dsInactive, dsBrowse]);
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

procedure TfrmCadEscola.LimparCampos;
begin
  inherited;
  ControladorEscola.LimparCampos;
  CarregarComponentesCadEscola;
end;

procedure TfrmCadEscola.LimparCamposForm;
begin
  inherited;
  edtNome.Text := EmptyStr;
  maskEditEndCEP.Text := EmptyStr;
  edtEndRua.Text := EmptyStr;
  edtEndNumero.Text := EmptyStr;
  edtEndComplemento.Text := EmptyStr;
  edtEndBairro.Text := EmptyStr;
  edtEndCidade.Text := EmptyStr;
end;

procedure TfrmCadEscola.SetControladorEscola(const Value: TCadEscolaController);
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
    if (Campos.Count > 0) then //Verifica se há algum campo obrigatório vazio
    begin
      Result := False;
      ShowMessage('Preencha os campos obrigatórios:' + #13 + #13 + Campos.Text); //Exibe os CAMPOS por NOME
    end
    else
      Result := True;
  finally
    Campos.Free; //Libera a lista da memória
  end;
end;

end.
