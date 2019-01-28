unit unFrmCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WideStrings, FMTBcd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, DB, SqlExpr, Grids, DBGrids, Provider, DBClient,
  ExtCtrls, DBCtrls, unCadEscolaController, ADODB, ComCtrls, Mask,              
  JvExMask, JvToolEdit, JvDBControls, cxDropDownEdit, cxCalendar,
  dxCore, cxDateUtils, StrUtils, unControladorPadrao;

type
  TfrmCadPadrao = class(TForm)
    btnEscolaNovoCadastro: TButton;
    btnEscolaGravar: TButton;
    btnEscolaAlterar: TButton;
    btnEscolaExcluir: TButton;
    btnEscolaCancelar: TButton;
    btnEscolaLimpar: TButton;
    btnEscolaFechar: TButton;
    procedure btnEscolaNovoCadastroClick(Sender: TObject);
  private
    FControladorPadrao: TCadPadraoController;
    procedure SetControladorPadrao(const Value: TCadPadraoController);

  protected
    procedure HabilitarDesabilitarComponentesDados; virtual;

  public
    property ControladorPadrao: TCadPadraoController read FControladorPadrao write SetControladorPadrao;
    
  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

{$R *.dfm}

procedure TfrmCadPadrao.btnEscolaNovoCadastroClick(Sender: TObject);
begin
  ControladorPadrao.NovoCadastroClientDS;
  HabilitarDesabilitarComponentesDados; //Habilita os componentes necess�rios para NOVO CADASTRO




  LimparCampos; //Limpa os campos necess�rios para NOVO CADASTRO caso possuam algum dado



//  ControladorPadrao.EscolaModelo.Codigo := ControladorEscola.DevolverUltimoCodigo + 1; //Aplica o C�DIGO IDENTIFICADOR
//  edtEscolaCodigo.Text := IntToStr(ControladorEscola.EscolaModelo.Codigo);
//  cxDateEditEscolaDataCadastro.Text := FormatDateTime('DD/MM/YYYY', Now); //Atribui DATA ATUAL do SO
end;

procedure TfrmCadPadrao.HabilitarDesabilitarComponentesDados;
begin
  btnEscolaNovoCadastro.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
  btnEscolaGravar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  btnEscolaLimpar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
  btnEscolaCancelar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInsert, dsEdit]);
//  btnEscolaPesquisar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
  btnEscolaFechar.Enabled := (ControladorPadrao.EstadoClientDS in [dsInactive, dsBrowse]);
end;

procedure TfrmCadPadrao.SetControladorPadrao(const Value: TCadPadraoController);
begin
  FControladorPadrao := Value;
end;

end.
