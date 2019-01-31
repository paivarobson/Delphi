unit unCadPadraoController;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB, unEntidadeModelo;

type
  TCadPadraoController = class
  private
    FEntidadeModelo: TEntidadeModelo;
    procedure SetEntidadeModelo(const Value: TEntidadeModelo);

  public
    procedure NovoCadastroClientDS; virtual; abstract;
    procedure LimparCampos; virtual; abstract;
    procedure CarregarEntidade; virtual;

    function EstadoClientDS: TDataSetState; virtual; abstract;

    property EntidadeModelo: TEntidadeModelo read FEntidadeModelo write SetEntidadeModelo;

  end;

implementation

procedure TCadPadraoController.CarregarEntidade;
begin
  EntidadeModelo.CarregarEntidadePadrao;
end;

procedure TCadPadraoController.SetEntidadeModelo(const Value: TEntidadeModelo);
begin
  FEntidadeModelo := Value;
end;

end.
