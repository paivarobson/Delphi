program ProjetoEscola;

uses
  Forms,
  unDados in 'DAO\unDados.pas' {fmdados: TDataModule},
  unCadEscolaController in 'Controle\unCadEscolaController.pas',
  unFrmPrincipal in 'Visao\unFrmPrincipal.pas' {frmPrincipal},
  unFrmCadEscola_old in 'Visao\unFrmCadEscola_old.pas' {frmCadEscola_old},
  unFrmPesquisaEscola in 'Visao\unFrmPesquisaEscola.pas' {frmPesquisaEscola},
  unRelEscola in 'Visao\unRelEscola.pas' {frmRelEscola},
  unEscolaModelo in 'Modelo\unEscolaModelo.pas',
  unPesquisaEscolaController in 'Controle\unPesquisaEscolaController.pas',
  unEscolaDAO in 'DAO\unEscolaDAO.pas',
  unSistemaControle in 'Controle\unSistemaControle.pas',
  unConexao in 'DAO\unConexao.pas',
  unAlunoModelo in 'Modelo\unAlunoModelo.pas',
  unFrmCadAluno_old in 'Visao\unFrmCadAluno_old.pas' {frmCadAluno},
  unAlunoDAO in 'DAO\unAlunoDAO.pas',
  unAlunoControle in 'Controle\unAlunoControle.pas',
  unFrmCadPadrao in 'Visao\unFrmCadPadrao.pas' {frmCadPadrao},
  unCadPadraoController in 'Controle\unCadPadraoController.pas',
  unFrmCadEscola in 'Visao\unFrmCadEscola.pas' {frmCadEscola},
  unEntidadeModelo in 'Modelo\unEntidadeModelo.pas',
  unEntidadeDAO in 'DAO\unEntidadeDAO.pas',
  unFrmCadAluno in 'Visao\unFrmCadAluno.pas' {frmCadPadrao1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmdados, fmdados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadPadrao1, frmCadPadrao1);
  Application.Run;
end.
