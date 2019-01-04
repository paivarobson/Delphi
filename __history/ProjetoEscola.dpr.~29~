program ProjetoEscola;

uses
  Forms,
  unDados in 'DAO\unDados.pas' {fmdados: TDataModule},
  unCadastroEscolaController in 'Controle\unCadastroEscolaController.pas',
  unEscolaIndex in 'Visao\unEscolaIndex.pas' {frmEscolaIndex},
  UnCadEscola in 'Visao\UnCadEscola.pas' {frmCadEscola},
  unPesquisaEscola in 'Visao\unPesquisaEscola.pas' {frmPesquisaEscola},
  unRelEscola in 'Visao\unRelEscola.pas' {frmRelEscola},
  unClasseEscola in 'Modelo\unClasseEscola.pas',
  unPesquisaEscolaController in 'Controle\unPesquisaEscolaController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEscolaIndex, frmEscolaIndex);
  Application.CreateForm(Tfmdados, fmdados);
  Application.Run;
end.
