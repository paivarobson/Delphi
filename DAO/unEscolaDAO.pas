unit unEscolaDAO;

interface

uses
  unDados, SqlExpr, SysUtils, DBClient, unEscolaModelo, Classes, Dialogs, DB,
  StdCtrls;

type
  TEscolaDAO = class
    FDataModule: Tfmdados;
  private
    FClientDS: TClientDataSet;
    function GetClientDS: TClientDataSet;
    procedure SetClientDS(const Value: TClientDataSet);
    procedure CarregarDadosParaClientDS(AEscolaModelo: TEscolaModelo);
    function GetEstadoClientDS: TDataSetState;
  public
    destructor Destroy; override;

    procedure AbrirConexaoClientDS;
    procedure FecharConexaoClientDS;
    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
    procedure CarregarEscola(AEscolaModelo: TEscolaModelo);
    procedure GravarEscolaClientDS;
    procedure NovoCadastroClientDS;
    procedure AlterarEscolaClientDS;
    procedure CancelarEdicaoClientDS;
    procedure ExcluirClientDS;
    procedure LimparDadosClientDS;
    procedure DesabilitarFilteredClientDS;
    procedure HabilitarFilteredClientDS;
    procedure CarregarTodosRegistrosClientDS;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

    function DevolverUltimoCodigo: Integer;
    function Gravar(AEscola: TEscolaModelo): Boolean;
    function ValidarCampos: Boolean;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean;
    function StatusInsertEditClientDS: Boolean;
    function VerificaClientDSSeEstaAtivo: Boolean;

    property ClientDS: TClientDataSet read GetClientDS write SetClientDS;
    property EstadoClientDS: TDataSetState read GetEstadoClientDS;
  end;

implementation

{ TEscolaDAO }

destructor TEscolaDAO.Destroy;
begin
//  FreeAndNil(FEscolaDAO);
  FreeAndNil(FClientDS);
  inherited;
end;

function TEscolaDAO.DevolverUltimoCodigo: Integer;
begin
  fmdados.tbAux.Close;
  fmdados.tbAux.SQL.Clear;
  fmdados.tbAux.SQL.Text := 'SELECT MAX(ESCCOD) FROM ESCOLA';
  fmdados.tbAux.Open;
  Result := fmdados.tbAux.Fields[0].AsInteger;
end;

procedure TEscolaDAO.ExcluirClientDS;
begin
  fmdados.ExcluirClientDS(ClientDS);
end;

procedure TEscolaDAO.AbrirConexaoClientDS;
begin
  fmdados.AbrirConexaoClientDS(ClientDS);
end;

procedure TEscolaDAO.FecharConexaoClientDS;
begin
  fmdados.FecharConexaoClientDS(ClientDS);
end;

procedure TEscolaDAO.AlterarEscolaClientDS;
begin
  fmdados.AlterarClientDS(ClientDS);
end;

function TEscolaDAO.VerificaClientDSSeEstaAtivo: Boolean;
begin
  Result := fmdados.VerificaClientDSSeEstaAtivo(ClientDS);
end;

procedure TEscolaDAO.CancelarEdicaoClientDS;
begin
  fmdados.CancelarEdicaoClientDS(ClientDS);
end;

procedure TEscolaDAO.CarregarEscola(AEscolaModelo: TEscolaModelo);
begin
  AEscolaModelo.Codigo       := ClientDS.Fields[0].AsInteger;
  AEscolaModelo.Nome         := ClientDS.Fields[1].AsString;
  AEscolaModelo.DataCadastro := ClientDS.Fields[2].AsDateTime;
  AEscolaModelo.Cep          := ClientDS.Fields[3].AsString;
  AEscolaModelo.Rua          := ClientDS.Fields[4].AsString;
  AEscolaModelo.Numero       := ClientDS.Fields[5].AsString;
  AEscolaModelo.Complemento  := ClientDS.Fields[6].AsString;
  AEscolaModelo.Bairro       := ClientDS.Fields[7].AsString;
  AEscolaModelo.Cidade       := ClientDS.Fields[8].AsString;
end;

procedure TEscolaDAO.Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
var
  VQuery: TSQLQuery;
begin
  VQuery := fmdados.ComponenteQuery;
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
  Result := fmdados.ClientDSEscola
end;

function TEscolaDAO.GetEstadoClientDS: TDataSetState;
begin
  Result := fmdados.EstadoClientDS(ClientDS);
end;

function TEscolaDAO.Gravar(AEscola: TEscolaModelo): Boolean;
begin
  CarregarDadosParaClientDS(AEscola);
//  ValidarCampos;
  Result := fmdados.GravarDB(ClientDS);
end;

procedure TEscolaDAO.GravarEscolaClientDS;
begin

end;

procedure TEscolaDAO.CarregarDadosParaClientDS(AEscolaModelo: TEscolaModelo);
begin
  ClientDS.FieldByName('ESCCOD').AsInteger := AEscolaModelo.Codigo;
  ClientDS.FieldByName('ESCNOME').AsString := AEscolaModelo.Nome;
  ClientDS.FieldByName('ESCDATACAD').AsDateTime := AEscolaModelo.DataCadastro;
  ClientDS.FieldByName('ESCENDCEP').AsString := AEscolaModelo.Cep;
  ClientDS.FieldByName('ESCENDRUA').AsString := AEscolaModelo.Rua;
  ClientDS.FieldByName('ESCENDNUM').AsString := AEscolaModelo.Numero;
  ClientDS.FieldByName('ESCENDCOMP').AsString := AEscolaModelo.Complemento;
  ClientDS.FieldByName('ESCENDBAIRRO').AsString := AEscolaModelo.Bairro;
  ClientDS.FieldByName('ESCENDCIDADE').AsString := AEscolaModelo.Cidade;
end;

function TEscolaDAO.CarregarConsultaClientDS(ACampoTabelaFiltrado: string;
  ADado: string): Boolean;
begin
  if ClientDS.Locate(ACampoTabelaFiltrado, ADado, []) then
  begin
    ClientDS.Filtered := False;
    ClientDS.Filter := ACampoTabelaFiltrado + ' = ' + QuotedStr(ADado); //Aplica��o do filtro
    ClientDS.Filtered := True;
    Result := True;
  end
  else
    Result := False
end;

procedure TEscolaDAO.HabilitarFilteredClientDS;
begin
  fmdados.HabilitarFilteredClientDS(ClientDS);
end;

procedure TEscolaDAO.CarregarTodosRegistrosClientDS;
begin
  fmdados.CarregarTodosRegistrosClientDS(ClientDS);
end;

procedure TEscolaDAO.LimparDadosClientDS;
begin
  fmdados.LimparDadosClientDS(ClientDS);
end;

procedure TEscolaDAO.DesabilitarFilteredClientDS;
begin
  fmdados.DesabilitarFilteredClientDS(ClientDS);
end;

procedure TEscolaDAO.NovoCadastroClientDS;
begin
  fmdados.NovoCadastroClientDS(ClientDS);
end;

procedure TEscolaDAO.SetClientDS(const Value: TClientDataSet);
begin
  FClientDS := Value;
end;

function TEscolaDAO.StatusInsertEditClientDS: Boolean;
begin
  Result := fmdados.StatusInsertEditClientDS(ClientDS);
end;

//Verifica��o de campos obrigat�rios se est�o vazios
function TEscolaDAO.ValidarCampos: Boolean;
var
  i: Integer;
  Campos: TStrings;
begin
  Campos := TStringList.Create;
  try
    for i := 0 to ClientDS.Fields.Count - 1 do
    begin
      if (ClientDS.Fields[i].Tag = 1) and
        (ClientDS.Fields.Fields[i].AsString = EmptyStr) then
        Campos.Add('- ' + ClientDS.Fields.Fields[i].DisplayName) //Armazena o NOME DO CAMPO dentro de uma LISTA
    end;
    if (Campos.Count > 0) then //Verifica se h� algum campo obrigat�rio vazio
    begin
      Result := False;
      ShowMessage('Preencha os campos obrigat�rios:' + #13 + #13 + Campos.Text); //Exibe os CAMPOS por NOME
    end
    else
      Result := True;
  finally
    Campos.Free; //Libera a lista da mem�ria
  end;
end;

//############# PESQUISA ESCOLA ################
//M�todo para ordena��o da lista de consulta por C�DIGO, DESCRI��O ou DATA DE CADASTRO
procedure TEscolaDAO.ConsultaOrdenada(AIndiceComboBox: Integer);
begin
  case AIndiceComboBox of
    0: ClientDS.IndexFieldNames := 'ESCCOD'; //Ordena por C�DIGO
    1: ClientDS.IndexFieldNames := 'ESCNOME'; //Ordena por DESCRI��O
    2: ClientDS.IndexFieldNames := 'ESCDATACAD'; //Ordena por DATA DE CADASTRO
  end;
end;

end.
