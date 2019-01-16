unit unEscolaDAO;

interface

uses
  unEscolaModelo, unDados, SqlExpr, SysUtils, unSistemaControle, DBClient;

type
  TEscolaDAO = class
    FDataModule: Tfmdados;
  private
    FClientDS: TClientDataSet;
    FEscolaDAO: TEscolaDAO;

    function GetClientDS: TClientDataSet;

    procedure SetClientDS(const Value: TClientDataSet);
    procedure SetEscolaDAO(const Value: TEscolaDAO);

  public
    destructor Destroy; override;
    function Gravar(AEscolaModelo: TEscolaModelo): Boolean;

    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
    procedure LimparDadosClient;

    property ClientDS: TClientDataSet read GetClientDS write SetClientDS;
    property EscolaDAO: TEscolaDAO read FEscolaDAO write SetEscolaDAO;

  end;

implementation

{ TEscolaDAO }

destructor TEscolaDAO.Destroy;
begin
  FreeAndNil(FEscolaDAO);
  FreeAndNil(FClientDS);
  inherited;
end;

procedure TEscolaDAO.Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
var
  VQuery: TSQLQuery;
begin
  VQuery := fmdados.tbEscola;
  try
    VQuery.SQL.Text := Format('SELECT ' +
                 'ESCCOD, ' +
                 'ESCNOME, ' +
                 'ESCDATACAD, ' +
                 'ESCENDCEP, ' +
                 'ESCENDRUA, ' +
                 'ESCENDNUM, ' +
                 'ESCENDCOMP, ' +
                 'ESCENDBAIRRO, ' +
                 'ESCENDCIDADE ' +
               'FROM ' +
                 'ESCOLA ' +
               'WHERE ESCCOD = %d',
               [ACodigo]);
    ClientDS.Open;
    try
      AEscolaModelo.Codigo       := ClientDS.Fields[0].AsInteger;
      AEscolaModelo.Nome         := ClientDS.Fields[1].AsString;
      AEscolaModelo.DataCadastro := ClientDS.Fields[2].AsDateTime;
      AEscolaModelo.Cep          := ClientDS.Fields[3].AsString;
      AEscolaModelo.Rua          := ClientDS.Fields[4].AsString;
      AEscolaModelo.Numero       := ClientDS.Fields[5].AsString;
      AEscolaModelo.Complemento  := ClientDS.Fields[6].AsString;
      AEscolaModelo.Bairro       := ClientDS.Fields[7].AsString;
      AEscolaModelo.Cidade       := ClientDS.Fields[8].AsString;
    finally
      ClientDS.Close;
    end;
  finally
    FreeAndNil(FClientDS);
  end;
end;

function TEscolaDAO.GetClientDS: TClientDataSet;
begin
  Result := fmdados.cdsEscola;
end;

function TEscolaDAO.Gravar(AEscolaModelo: TEscolaModelo): Boolean;
begin
  try
    ClientDS.Open;
    ClientDS.FieldByName('ESCCOD').AsInteger := AEscolaModelo.Codigo;
    ClientDS.FieldByName('ESCNOME').AsString := AEscolaModelo.Nome;
    ClientDS.FieldByName('ESCDATACAD').AsDateTime := AEscolaModelo.DataCadastro;
    ClientDS.FieldByName('ESCENDCEP').AsString := AEscolaModelo.Cep;
    ClientDS.FieldByName('ESCENDRUA').AsString := AEscolaModelo.Rua;
    ClientDS.FieldByName('ESCENDNUM').AsString := AEscolaModelo.Numero;
    ClientDS.FieldByName('ESCENDCOMP').AsString := AEscolaModelo.Complemento;
    ClientDS.FieldByName('ESCENDBAIRRO').AsString := AEscolaModelo.Bairro;
    ClientDS.FieldByName('ESCENDCIDADE').AsString := AEscolaModelo.Cidade;

    Result := True;
  finally
    FreeAndNil(FClientDS);
  end;
end;

procedure TEscolaDAO.LimparDadosClient;
begin
  fmdados.cdsEscola.ClearFields;
end;

procedure TEscolaDAO.SetClientDS(const Value: TClientDataSet);
begin
  FClientDS := Value;
end;

procedure TEscolaDAO.SetEscolaDAO(const Value: TEscolaDAO);
begin
  FEscolaDAO := Value;
end;

end.
