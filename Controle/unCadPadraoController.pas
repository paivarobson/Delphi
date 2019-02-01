unit unCadPadraoController;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB, unEntidadeModelo;

type
  TCadPadraoController = class
  private
    FEntidadeModelo: TEntidadeModelo;

  public
    function DevolverUltimoCodigo: Integer; virtual;
    function CarregarDadosParaClientDS: Boolean; virtual;
    function ValidarCampos: Boolean; virtual;
    function Gravar: Boolean; virtual;
    function StatusInsertEditClientDS: Boolean; virtual;
    function VerificaClientDSSeEstaAtivo: Boolean; virtual;

    procedure LimparCampos; virtual;
    procedure LimparDadosClientDS; virtual;
    procedure NovoCadastroClientDS; virtual;
    procedure AlterarClientDS; virtual;
    procedure ExcluirClientDS; virtual;
    procedure CancelarEdicaoClientDS; virtual;
    procedure CarregarEscola; virtual;
    procedure AbrirConexaoClientDS; virtual;
    procedure FecharConexaoClientDS; virtual;

    function EstadoClientDS: TDataSetState; virtual;

  end;

implementation

end.
