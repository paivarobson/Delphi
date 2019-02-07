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
//    function CarregarDadosParaClientDS: Boolean; virtual; abstract;
    function ValidarCampos: Boolean; virtual; abstract;
    function Gravar: Boolean; virtual; abstract;
    function StatusInsertEditClientDS: Boolean; virtual; abstract;

    procedure LimparCamposModelo; virtual; abstract;
    procedure LimparDadosClientDS; virtual; abstract;
    procedure NovoCadastroClientDS; virtual; abstract;
    procedure AlterarClientDS; virtual; abstract;
    procedure ExcluirClientDS; virtual; abstract;
    procedure CancelarEdicaoClientDS; virtual; abstract;
    procedure CarregarEntidade; virtual; abstract;
    procedure AbrirConexaoClientDS; virtual; abstract;
    procedure FecharConexaoClientDS; virtual; abstract;

    function EstadoClientDS: TDataSetState; virtual; abstract;

  end;

implementation

end.
