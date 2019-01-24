unit unAlunoModelo;

interface

uses
  SqlExpr, Provider;

type
  TAlunoModelo = class
  private
    FNome: string;
    FMatricula: Integer;

    procedure SetMatricula(const Value: Integer);
    procedure SetNome(const Value: string);
  public
//    function Obter: TSQLQuery;
//    function ObterProvider: TDataSetProvider;

    property Matricula: Integer read FMatricula write SetMatricula;
    property Nome: string read FNome write SetNome;
  end;

implementation

{ TClienteModelo }

//function TAlunoModelo.Obter: TSQLQuery;
//var
//  VAlunoDAO: TAlunoDAO;
//begin
//  VAlunoDAO := TAlunoDAO.Create;
//  try
//    Result := VAlunoDAO.Obter;
//  finally
//    VAlunoDAO.Free;
//  end;
//end;
//
//function TAlunoModelo.ObterProvider: TDataSetProvider;
//var
//  VAlunoDAO: TAlunoDAO;
//begin
//  VAlunoDAO := TAlunoDAO.Create;
//  try
//    Result := VAlunoDAO.ObterProvider;
//  finally
//    VAlunoDAO.Free;
//  end;
//end;

procedure TAlunoModelo.SetMatricula(const Value: Integer);
begin
  FMatricula := Value;
end;

procedure TAlunoModelo.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
