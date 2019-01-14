unit unAlunoControle;

interface

uses
  unAlunoModelo, SysUtils, SqlExpr, Provider;

type
  TAlunoControle = class
  private
    FAlunoModelo: TAlunoModelo;
  public
    constructor Create;
    destructor Destroy; override;

//    function Obter: TSQLQuery;
//    function ObterProvider: TDataSetProvider;

  end;

implementation


constructor TAlunoControle.Create;
begin
  FAlunoModelo := TAlunoModelo.Create;
end;

destructor TAlunoControle.Destroy;
begin
  FAlunoModelo.Free;
  inherited;
end;

//function TAlunoControle.Obter: TSQLQuery;
//begin
//  Result := FAlunoModelo.Obter;//
//end;

//function TAlunoControle.ObterProvider: TDataSetProvider;
//begin
////  Result := FAlunoModelo.ObterProvider;
//end;

end.
