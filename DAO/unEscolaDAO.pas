unit unEscolaDAO;

interface

uses
  unEscolaModelo, unDados, SqlExpr, SysUtils, unSistemaControle;

type
  TEscolaDAO = class
    FDataModule: Tfmdados;

  public
    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
  end;

implementation

{ TEscolaDAO }

procedure TEscolaDAO.Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
var
  VQuery: TSQLQuery;
begin
  VQuery := TSistemaControle.GetInstancia().Conexao.CriarQuery;
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
    VQuery.Open;
    try
      AEscolaModelo.Codigo       := VQuery.Fields[0].AsInteger;
      AEscolaModelo.Nome         := VQuery.Fields[1].AsString;
      AEscolaModelo.DataCadastro := VQuery.Fields[2].AsDateTime;
      AEscolaModelo.Cep          := VQuery.Fields[3].AsString;
      AEscolaModelo.Rua          := VQuery.Fields[4].AsString;
      AEscolaModelo.Numero       := VQuery.Fields[5].AsString;
      AEscolaModelo.Complemento  := VQuery.Fields[6].AsString;
      AEscolaModelo.Bairro       := VQuery.Fields[7].AsString;
      AEscolaModelo.Cidade       := VQuery.Fields[8].AsString;
    finally
      VQuery.Close;
    end;
  finally
    FreeAndNil(VQuery);
  end;
end;

end.
