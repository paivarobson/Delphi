unit unCadastroEscolaController;

interface

uses DB, DBClient, SqlExpr, Windows, Dialogs, SysUtils, DateUtils, StdCtrls;

type
  TDadosEscola = record
    Codigo: Integer;
    Nome: string;
    DataCadastro: TDateTime;
    CEP: string;
    Rua: string;
    Numero: string;
    Complemento: string;
    Bairro: string;
    Cidade: string;
  end;

  TCadastroEscolaController = class
  public
//    function Gravar(ADadosEscola: TDadosEscola): string;
    procedure CarregarEscola(const AFontesDados: TSQLQuery);
    function DevolverUltimoCodigo: Integer;
    function ValidaCampos(const ADadoCampo: string): Boolean;
  end;

implementation

uses
  unDados;

{ TCadastroEscolaController }
procedure TCadastroEscolaController.CarregarEscola(const AFontesDados: TSQLQuery);
begin
  AFontesDados.SQLConnection := fmdados.conexaoBDEscola;
  AFontesDados.SQL.Clear;
  AFontesDados.SQL.Add('SELECT * FROM ESCOLA');
end;

function TCadastroEscolaController.ValidaCampos(const ADadoCampo: string): Boolean;
begin
  if Trim(ADadoCampo) = '' then
    Result := True
  else
    Result := False;
end;

function TCadastroEscolaController.DevolverUltimoCodigo: Integer;
begin
  fmdados.tbAux.Close;
  fmdados.tbAux.SQL.Clear;

  fmdados.tbAux.SQL.Text := 'SELECT MAX(ESCCOD) FROM ESCOLA';
  fmdados.tbAux.Open;
  Result := fmdados.tbAux.Fields[0].AsInteger;
end;

//function TCadastroEscolaController.Gravar(ADadosEscola: TDadosEscola): string;
//var
//  FQuery: TSQLQuery;
//begin
//  FQuery := TSQLQuery.Create(nil);
//  try
//   // ADadosEscola.Codigo :=
//    FQuery.SQLConnection := fmdados.conexaoBDEscola;
//    FQuery.SQL.Clear;
//    FQuery.SQL.Add(Format(
//        'INSERT INTO ESCOLA ' +
//          '(ESCNOME, ' +
//          'ESCDATACAD, ' +
//          'ESCENDRUA, ' +
//          'ESCENDNUM, ' +
//          'ESCENDCOMP, ' +
//          'ESCENDBAIRRO, ' +
//          'ESCENDCIDADE, ' +
//          'ESCENDCEP) ' +
//        ' VALUES ' +
//        '       (''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'') ',
//        [ADadosEscola.Nome, ADadosEscola.DataCadastro,
//         ADadosEscola.Rua, ADadosEscola.Numero, ADadosEscola.Complemento, ADadosEscola.Bairro,
//         ADadosEscola.Cidade, ADadosEscola.CEP]));
//    if FQuery.ExecSQL(True) = 1 then
//    begin
//      FQuery.SQL.Clear;
//      FQuery.SQL.Add('SELECT MAX(ESCCOD) AS CODIGO FROM ESCOLA');
//      FQuery.Open;
//      if FQuery.RecordCount > 0 then
//        Result := FQuery.Fields[0].AsString;
//    end
//    else
//      raise Exception.Create('Erro ao criar uma escola');
//  finally
//    FreeAndNil(FQuery);
//  end;
//
//end;

end.
