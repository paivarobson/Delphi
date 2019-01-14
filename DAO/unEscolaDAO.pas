unit unEscolaDAO;

interface

uses
  unEscolaModelo, unDados, SqlExpr, SysUtils, unSistemaControle, DBClient;

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
  VClientDS: TClientDataSet;
begin
  VQuery := fmdados.tbEscola;
  VClientDS := fmdados.cdsEscola;
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
    VClientDS.Open;
    try
      AEscolaModelo.Codigo       := VClientDS.Fields[0].AsInteger;
      AEscolaModelo.Nome         := VClientDS.Fields[1].AsString;
      AEscolaModelo.DataCadastro := VClientDS.Fields[2].AsDateTime;
      AEscolaModelo.Cep          := VClientDS.Fields[3].AsString;
      AEscolaModelo.Rua          := VClientDS.Fields[4].AsString;
      AEscolaModelo.Numero       := VClientDS.Fields[5].AsString;
      AEscolaModelo.Complemento  := VClientDS.Fields[6].AsString;
      AEscolaModelo.Bairro       := VClientDS.Fields[7].AsString;
      AEscolaModelo.Cidade       := VClientDS.Fields[8].AsString;
    finally
      VClientDS.Close;
    end;
  finally
    FreeAndNil(VClientDS);
  end;
end;

end.
