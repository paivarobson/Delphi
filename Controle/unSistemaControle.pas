unit unSistemaControle;

interface

uses
  unDados, SysUtils;

type
  TSistemaControle = class
  private
    FConexao: Tfmdados;
    class var FInstancia: TSistemaControle;

  public
    constructor Create;
    destructor Destroy; override;
    class function GetInstancia: TSistemaControle;
//    property Conexao: Tfmdados read GetInstancia write FConexao;
  end;

implementation

{ TSistemaControle }

constructor TSistemaControle.Create;
begin
  if not Assigned(Self.FInstancia) then
    Self.FInstancia.Create;

end;

destructor TSistemaControle.Destroy;
begin
  FreeAndNil(FInstancia);
  inherited;
end;

class function TSistemaControle.GetInstancia: TSistemaControle;
begin

end;

end.
