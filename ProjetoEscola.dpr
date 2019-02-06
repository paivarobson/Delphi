program ProjetoEscola;

uses
  Forms,
  unDados in 'DAO\unDados.pas' {fmdados: TDataModule},
  unCadEscolaController in 'Controle\unCadEscolaController.pas',
  unFrmPrincipal in 'Visao\unFrmPrincipal.pas' {frmPrincipal},
  unFrmPesquisaEscola in 'Visao\unFrmPesquisaEscola.pas' {frmPesquisaEscola},
  unRelEscola in 'Visao\unRelEscola.pas' {frmRelEscola},
  unEscolaModelo in 'Modelo\unEscolaModelo.pas',
  unPesquisaEscolaController in 'Controle\unPesquisaEscolaController.pas',
  unEscolaDAO in 'DAO\unEscolaDAO.pas',
  unSistemaControle in 'Controle\unSistemaControle.pas',
  unConexao in 'DAO\unConexao.pas',
  unAlunoModelo in 'Modelo\unAlunoModelo.pas',
  unAlunoDAO in 'DAO\unAlunoDAO.pas',
  unCadAlunoController in 'Controle\unCadAlunoController.pas',
  unFrmCadPadrao in 'Visao\unFrmCadPadrao.pas' {frmCadPadrao},
  unCadPadraoController in 'Controle\unCadPadraoController.pas',
  unFrmCadEscola in 'Visao\unFrmCadEscola.pas' {frmCadEscola},
  unEntidadeModelo in 'Modelo\unEntidadeModelo.pas',
  unEntidadeDAO in 'DAO\unEntidadeDAO.pas',
  unFrmCadAluno in 'Visao\unFrmCadAluno.pas' {frmCadAluno},
  unValidacoes in 'DAO\unValidacoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmdados, fmdados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
