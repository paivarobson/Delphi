unit unEscolaDAO;

interface

uses
  unDados, SqlExpr, SysUtils, DBClient, unEscolaModelo, Classes, Dialogs, DB,
  StdCtrls, unEntidadeDAO, unValidacoes;

type
  TEscolaDAO = class(TEntidadeDAO)
    FDataModule: Tfmdados;
  private

    procedure CarregarDadosParaClientDS(AEscolaModelo: TEscolaModelo);
  public

    procedure AbrirConexaoClientDS; override;
    procedure FecharConexaoClientDS; override;
    procedure CarregarEntidadeModeloDoClientDS(AEscolaModelo: TEscolaModelo);
    procedure GravarClientDS; override;
    procedure NovoCadastroClientDS; override;
    procedure AlterarClientDS; override;
    procedure CancelarEdicaoClientDS; override;
    procedure ExcluirClientDS; override;
    procedure LimparDadosClientDS; override;
    procedure DesabilitarFilteredClientDS; override;
    procedure HabilitarFilteredClientDS; override;
    procedure CarregarTodosRegistrosClientDS; override;
    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

    function DevolverUltimoCodigo: Integer; override;
    function Gravar(AEscola: TEscolaModelo): Boolean;
    function ValidarCampos: Boolean; override;
    function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; override;
    function ConsultaEntidadePorCodigo(AEscolaModelo: TEscolaModelo; ACodigo: Integer): Boolean;
    function StatusInsertEditClientDS: Boolean; override;
    function VerificaClientDSSeEstaAtivo: Boolean; override;
    function ClientDSPossuiDado: Boolean;

    function ClientDS: TClientDataSet; override;
    function EstadoClientDS: TDataSetState; override;
  end;

implementation

{ TEscolaDAO }

function TEscolaDAO.DevolverUltimoCodigo: Integer;
begin
  Result := fmdados.DevolverUltimoCodigo('ESCCOD', 'ESCOLA');
end;

function TEscolaDAO.EstadoClientDS: TDataSetState;
begin
  Result := fmdados.EstadoClientDS(ClientDS);
end;

procedure TEscolaDAO.ExcluirClientDS;
begin
  fmdados.ExcluirClientDS(ClientDS);
end;

procedure TEscolaDAO.AbrirConexaoClientDS;
begin
  fmdados.tbEscola.SQL.Text := 'SELECT * FROM ESCOLA';
  fmdados.AbrirConexaoClientDS(ClientDS);
end;

procedure TEscolaDAO.FecharConexaoClientDS;
begin
  fmdados.FecharConexaoClientDS(ClientDS);
end;

procedure TEscolaDAO.AlterarClientDS;
begin
  inherited;
  fmdados.AlterarClientDS(ClientDS);
end;

function TEscolaDAO.ValidarCampos: Boolean;
begin
  Result := TValidacoes.ValidarCampos(ClientDS);
end;

function TEscolaDAO.VerificaClientDSSeEstaAtivo: Boolean;
begin
  Result := fmdados.VerificaClientDSSeEstaAtivo(ClientDS);
end;

procedure TEscolaDAO.CancelarEdicaoClientDS;
begin
  fmdados.CancelarEdicaoClientDS(ClientDS);
end;

procedure TEscolaDAO.CarregarEntidadeModeloDoClientDS(AEscolaModelo: TEscolaModelo);
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

function TEscolaDAO.ConsultaEntidadePorCodigo(AEscolaModelo: TEscolaModelo; ACodigo: Integer): Boolean;
begin
  FecharConexaoClientDS;
  fmdados.tbEscola.SQL.Text := Format('SELECT ' +
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
  Result := fmdados.tbEscola.RecordCount > 0;
  ClientDS.Open;
  CarregarEntidadeModeloDoClientDS(AEscolaModelo);
end;

function TEscolaDAO.Gravar(AEscola: TEscolaModelo): Boolean;
begin
  CarregarDadosParaClientDS(AEscola);
//  ValidarCampos;
  Result := fmdados.GravarDB(ClientDS);
end;

procedure TEscolaDAO.GravarClientDS;
begin
  fmdados.GravarDB(ClientDS);
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

function TEscolaDAO.ClientDS: TClientDataSet;
begin
  Result := fmdados.ClientDSEscola;
end;

function TEscolaDAO.ClientDSPossuiDado: Boolean;
begin
  Result := fmdados.ClientDSPossuiDado(ClientDS);
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
  fmdados.tbEscola.SQL.Text := 'SELECT * FROM ESCOLA';
  fmdados.NovoCadastroClientDS(ClientDS);
end;

function TEscolaDAO.StatusInsertEditClientDS: Boolean;
begin
  Result := fmdados.StatusInsertEditClientDS(ClientDS);
end;              
//Verifica��o de campos obrigat�rios se est�o vazios
//function TEscolaDAO.ValidarCampos: Boolean;
//var
//  i: Integer;
//  Campos: TStrings;
//begin
//  Campos := TStringList.Create;
//  try
//    for i := 0 to ClientDS.Fields.Count - 1 do
//    begin
//      if (ClientDS.Fields[i].Tag = 1) and
//        (ClientDS.Fields.Fields[i].AsString = EmptyStr) then
//        Campos.Add('- ' + ClientDS.Fields.Fields[i].DisplayName) //Armazena o NOME DO CAMPO dentro de uma LISTA
//    end;
//    if (Campos.Count > 0) then //Verifica se h� algum campo obrigat�rio vazio
//    begin
//      Result := False;
//      ShowMessage('Preencha os campos obrigat�rios:' + #13 + #13 + Campos.Text); //Exibe os CAMPOS por NOME
//    end
//    else
//      Result := True;
//  finally
//    Campos.Free; //Libera a lista da mem�ria
//  end;
//end;

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
