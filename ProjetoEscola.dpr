program ProjetoEscola;

uses
  Forms,
  unDados in 'DAO\unDados.pas' {fmdados: TDataModule},
  unCadEscolaController in 'Controle\unCadEscolaController.pas',
  unFrmPrincipal in 'Visao\unFrmPrincipal.pas' {frmPrincipal},
  unFrmCadEscola in 'Visao\unFrmCadEscola.pas' {frmCadEscola},
  unFrmPesquisaEscola in 'Visao\unFrmPesquisaEscola.pas' {frmPesquisaEscola},
  unRelEscola in 'Visao\unRelEscola.pas' {frmRelEscola},
  unEscolaModelo in 'Modelo\unEscolaModelo.pas',
  unPesquisaEscolaController in 'Controle\unPesquisaEscolaController.pas',
  unEscolaDAO in 'DAO\unEscolaDAO.pas',
  unSistemaControle in 'Controle\unSistemaControle.pas',
  unConexao in 'DAO\unConexao.pas',
  unAlunoModelo in 'Modelo\unAlunoModelo.pas',
  unFrmCadAluno in 'Visao\unFrmCadAluno.pas' {frmCadAluno},
  unAlunoDAO in 'DAO\unAlunoDAO.pas',
  unAlunoControle in 'Controle\unAlunoControle.pas',
  unFrmCadPadrao in 'Visao\unFrmCadPadrao.pas' {frmCadPadrao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmdados, fmdados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadPadrao, frmCadPadrao);
  Application.Run;
end.
