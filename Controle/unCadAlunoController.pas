unit unCadAlunoController;

interface

uses
  unAlunoModelo, SysUtils, SqlExpr, Provider, unCadPadraoController, DB;

type
  TCadAlunoController = class(TCadPadraoController)
  private
    FAlunoModelo: TAlunoModelo;
    procedure SetAlunoModelo(const Value: TAlunoModelo);
  public
    constructor Create;
    destructor Destroy; override;

    function DevolverUltimoCodigo: Integer; override;
//    function CarregarDadosParaClientDS: Boolean; override;
    function ValidarCampos: Boolean; override;
    function Gravar: Boolean; override;
    function StatusInsertEditClientDS: Boolean; override;

    procedure LimparCamposModelo; override;
    procedure LimparDadosClientDS; override;
    procedure NovoCadastroClientDS; override;
    procedure AlterarClientDS; override;
    procedure ExcluirClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure CarregarEntidadeModeloDoClientDS; override;
    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;

    function EstadoClientDS: TDataSetState; override;

    property AlunoModelo: TAlunoModelo read FAlunoModelo write SetAlunoModelo;

  end;

implementation

procedure TCadAlunoController.AbrirConexaoClientDS;
begin
  inherited;
  AlunoModelo.AbrirConexaoClientDS;
end;

procedure TCadAlunoController.AlterarClientDS;
begin
  inherited;
  AlunoModelo.AlterarClientDS;
end;

procedure TCadAlunoController.CancelarEdicaoClientDS;
begin
  inherited;
  AlunoModelo.CancelarEdicaoClientDS;
end;

procedure TCadAlunoController.CarregarEntidadeModeloDoClientDS;
begin
  inherited;
  AlunoModelo.CarregarEntidadeModeloDoClientDS;
end;

constructor TCadAlunoController.Create;
begin
  FAlunoModelo := TAlunoModelo.Create;
end;

destructor TCadAlunoController.Destroy;
begin
  FreeAndNil(FAlunoModelo);
  inherited;
end;

function TCadAlunoController.DevolverUltimoCodigo: Integer;
begin
  Result := AlunoModelo.DevolverUltimoCodigo;
end;

function TCadAlunoController.EstadoClientDS: TDataSetState;
begin
  Result := AlunoModelo.EstadoClientDS;
end;

procedure TCadAlunoController.ExcluirClientDS;
begin
  inherited;
  AlunoModelo.ExcluirClientDS
end;

procedure TCadAlunoController.FecharConexaoClientDS;
begin
  inherited;
  AlunoModelo.FecharConexaoClientDS;
end;

function TCadAlunoController.Gravar: Boolean;
begin
  Result := AlunoModelo.Gravar;
end;

procedure TCadAlunoController.LimparCamposModelo;
begin
  inherited;
  AlunoModelo.LimparCamposModelo;
end;

procedure TCadAlunoController.LimparDadosClientDS;
begin
  inherited;
  AlunoModelo.LimparDadosClientDS
end;

procedure TCadAlunoController.NovoCadastroClientDS;
begin
  inherited;
  AlunoModelo.NovoCadastroClientDS;
end;

procedure TCadAlunoController.SetAlunoModelo(const Value: TAlunoModelo);
begin
  FAlunoModelo := Value;
end;

function TCadAlunoController.StatusInsertEditClientDS: Boolean;
begin
  Result := AlunoModelo.StatusInsertEditClientDS;
end;

function TCadAlunoController.ValidarCampos: Boolean;
begin
  Result := AlunoModelo.ValidarCampos;
end;

end.
