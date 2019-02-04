unit unCadPadraoController;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB, unEntidadeModelo;

type
  TCadPadraoController = class
  private
//    FEntidadeModelo: TEntidadeModelo;

  public
    function DevolverUltimoCodigo: Integer; virtual; abstract;
    function CarregarDadosParaClientDS: Boolean; virtual; abstract;
    function ValidarCampos: Boolean; virtual; abstract;
    function Gravar: Boolean; virtual; abstract;
    function StatusInsertEditClientDS: Boolean; virtual; abstract;
//    function VerificaClientDSSeEstaAtivo: Boolean; virtual; abstract;

    procedure LimparCampos; virtual; abstract;
    procedure LimparDadosClientDS; virtual; abstract;
    procedure NovoCadastroClientDS; virtual; abstract;
    procedure AlterarEscolaClientDS; virtual; abstract;
    procedure ExcluirClientDS; virtual; abstract;
    procedure CancelarEdicaoClientDS; virtual; abstract;
    procedure CarregarEscola; virtual; abstract;
    procedure AbrirConexaoClientDS; virtual; abstract;
    procedure FecharConexaoClientDS; virtual; abstract;

    function EstadoClientDS: TDataSetState; virtual; abstract;

  end;

implementation

end.
