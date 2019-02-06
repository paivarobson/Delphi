unit unFrmCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unCadEscolaController, ADODB, ComCtrls, Mask,              
  JvExMask, JvToolEdit, JvDBControls, cxDropDownEdit, cxCalendar,
  dxCore, cxDateUtils, StrUtils, unCadPadraoController;

type
  TfrmCadPadrao = class(TForm)
    btnNovoCadastro: TButton;
    btnGravar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnLimpar: TButton;
    btnFechar: TButton;
    lbCodigo: TLabel;
    edtCodigo: TEdit;
    lblDataCadastro: TLabel;
    cxDateEditDataCadastro: TcxDateEdit;
    lblFrmTitulo: TLabel;
    lbDescricao: TLabel;
    edtNome: TEdit;
    lblEndRua: TLabel;
    lbEndNumero: TLabel;
    lbEndComplemento: TLabel;
    lblEndBairro: TLabel;
    lblEndCidade: TLabel;
    lblEndCep: TLabel;
    maskEditEndCEP: TMaskEdit;
    edtEndRua: TEdit;
    edtEndNumero: TEdit;
    edtEndComplemento: TEdit;
    edtEndBairro: TEdit;
    edtEndCidade: TEdit;
    btnConsultar: TButton;
  private
    FControladorPadrao: TCadPadraoController;
    procedure SetControladorPadrao(const Value: TCadPadraoController);

  protected
    procedure btnNovoCadastroClick(Sender: TObject); virtual;
//    procedure btnGravarClick(Sender: TObject); virtual; abstract;
//    procedure btnCancelarClick(Sender: TObject); virtual; abstract;
//    procedure btnLimparClick(Sender: TObject); virtual;
//    procedure btnExcluirClick(Sender: TObject); virtual; abstract;
//    procedure btnAlterarClick(Sender: TObject); virtual; abstract;
//    procedure btnPesquisarClick(Sender: TObject); virtual;
    procedure PermitirSomenteNumeros(Sender: TObject; var Key: Char); virtual;
    procedure FormClose(Sender: TObject; var Action: TCloseAction); virtual;
    procedure AvancarCampo(Sender: TObject; var Key: Char);
//    procedure btnFecharClick(Sender: TObject); virtual;

//    procedure CarregarComponentesCadEscola; virtual; abstract;
//    procedure LimparCampos; virtual; abstract;
    procedure LimparCamposForm; virtual;
//    procedure HabilitarDesabilitarComponentesDados; virtual; abstract;


  public
//    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

//    procedure CarregarEntidadeEscola; virtual; abstract;

    function ValidaCampos: Boolean; virtual;

    property ControladorPadrao: TCadPadraoController read FControladorPadrao write SetControladorPadrao;
//    property EntidadeModelo

  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

{$R *.dfm}

//procedure TfrmCadPadrao.CarregarComponentesCadPadrao;
//begin
//  edtCodigo.Text := IntToStr(ControladorPadrao.EntidadeModelo.Codigo);
//  edtNome.Text := ControladorPadrao.EntidadeModelo.Nome;
////  cxDateEditDataCadastro.Date := ControladorPadrao.EntidadeModelo.DataCadastro;
////  maskEditEndCEP.Text := ControladorPadrao.EntidadeModelo.Cep;
//  edtEndRua.Text := ControladorPadrao.EntidadeModelo.Rua;
//  edtEndNumero.Text := ControladorPadrao.EntidadeModelo.Numero;
//  edtEndComplemento.Text := ControladorPadrao.EntidadeModelo.Complemento;
//  edtEndBairro.Text := ControladorPadrao.EntidadeModelo.Bairro;
//  edtEndCidade.Text := ControladorPadrao.EntidadeModelo.Cidade;
//end;

//procedure TfrmCadPadrao.CarregarEntidade;
//begin
//  ControladorPadrao.CarregarEntidade;
//  CarregarComponentesCadPadrao;
//end;

//procedure TfrmCadPadrao.CarregarEntidadePadrao;
//begin
//  ControladorPadrao.EntidadeModelo.Codigo := StrToInt(edtCodigo.Text);
//  ControladorPadrao.EntidadeModelo.Nome := edtNome.Text;
//  ControladorPadrao.EntidadeModelo.DataCadastro := cxDateEditDataCadastro.Date;
//  ControladorPadrao.EntidadeModelo.Cep := maskEditEndCEP.Text;
//  ControladorPadrao.EntidadeModelo.Rua := edtEndRua.Text;
//  ControladorPadrao.EntidadeModelo.Numero := edtEndNumero.Text;
//  ControladorPadrao.EntidadeModelo.Complemento := edtEndComplemento.Text;
//  ControladorPadrao.EntidadeModelo.Bairro := edtEndBairro.Text;
//  ControladorPadrao.EntidadeModelo.Cidade := edtEndCidade.Text;
//end;

//constructor TfrmCadPadrao.Create(AOwner: TComponent);
//begin
//  ControladorPadrao := TCadPadraoController.Create; //Instãncia da Classe Controller
//  if ControladorPadrao.EstadoClientDS = dsBrowse then
//  begin
//    ControladorPadrao.CarregarEntidade;
//    CarregarComponentesCadPadrao;
//  end
//  else
//  begin
//    CarregarComponentesCadPadrao;
//    HabilitarDesabilitarComponentesDados;
//    edtCodigo.Text := EmptyStr;
//    cxDateEditDataCadastro.Text := EmptyStr;
//  end;
//end;

procedure TfrmCadPadrao.AvancarCampo(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then //Verifica se a tecla pressionada é ENTER
    Perform(WM_nextdlgctl,0,0)
  else
  begin
    if Key = #27 then //Verifica se a tecla pressionada é ESC
      Perform(WM_nextdlgctl,1,0)
  end;
end;

procedure TfrmCadPadrao.btnNovoCadastroClick(Sender: TObject);
begin
  edtNome.SetFocus;
  cxDateEditDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now); //Atribui DATA ATUAL do SO
end;

destructor TfrmCadPadrao.Destroy;
begin
  inherited;
  FreeAndNil(FControladorPadrao);
end;

procedure TfrmCadPadrao.PermitirSomenteNumeros(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13, #27]) then
  begin
    Key := #0;
    Application.MessageBox('Somente números.', 'Caractere inválido', MB_ICONWARNING)
  end
  else
    AvancarCampo(Sender, Key) //Avançar e recuar campo com a tecla ENTER e ESC respectivamente
end;

procedure TfrmCadPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release; //Libera o Form da memória permitindo a execução da fila antes que receba o Free
end;

procedure TfrmCadPadrao.LimparCamposForm;
begin
  if MessageDlg('Tem certeza que deseja limpar os campos?', mtConfirmation,
    mbYesNo, 0) = mrYes then
  begin


    edtNome.Text := EmptyStr;
    maskEditEndCEP.Text := EmptyStr;
    edtEndRua.Text := EmptyStr;
    edtEndNumero.Text := EmptyStr;
    edtEndComplemento.Text := EmptyStr;
    edtEndBairro.Text := EmptyStr;
    edtEndCidade.Text := EmptyStr;
  end;
end;

//procedure TfrmCadPadrao.HabilitarDesabilitarComponentesDados;
//begin
//  btnNovoCadastro.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
//  btnGravar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  btnLimpar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  btnCancelar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
////  btnEscolaPesquisar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
//  btnFechar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
//  edtNome.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  edtEndRua.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  edtEndNumero.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  edtEndComplemento.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  edtEndCidade.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  maskEditEndCEP.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  edtEndBairro.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//end;

//procedure TfrmCadPadrao.LimparCampos;
//begin
//  ControladorPadrao.LimparCampos;
//  CarregarComponentesCadPadrao;
//end;

procedure TfrmCadPadrao.SetControladorPadrao(const Value: TCadPadraoController);
begin
  FControladorPadrao := Value;
end;

function TfrmCadPadrao.ValidaCampos: Boolean;
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
          (TEdit(Components[i]).Text = EmptyStr) and
          (TcxDateEdit(Components[i]).Text = EmptyStr) or
          (TMaskEdit(Components[i]).Text = '     -   ') or
          (TMaskEdit(Components[i]).Text = '   .   .   -  ') then
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

//procedure TfrmCadPadrao.LimparCamposForm;
//begin
//  edtNome.Text := EmptyStr;
//  maskEditEndCEP.Text := EmptyStr;
//  edtEndRua.Text := EmptyStr;
//  edtEndNumero.Text := EmptyStr;
//  edtEndComplemento.Text := EmptyStr;
//  edtEndBairro.Text := EmptyStr;
//  edtEndCidade.Text := EmptyStr;
//end;

end.
