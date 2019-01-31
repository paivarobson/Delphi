unit unEntidadeDAO;

interface

uses
  unDados, SqlExpr, SysUtils, DBClient, Classes, Dialogs, DB,
  StdCtrls, unEntidadeModelo;

type
  TEntidadeDAO = class
    FDataModule: Tfmdados;
  protected
    FClientDS: TClientDataSet;

    function GetEstadoClientDS: TDataSetState; virtual;
//    procedure CarregarDadosParaClientDS(AEscolaModelo: TEscolaModelo);

  public
    destructor Destroy; override;

    class procedure AbrirConexaoClientDS; virtual; abstract;
    class procedure FecharConexaoClientDS; virtual; abstract;
//    procedure Carregar(AEscolaModelo: TEscolaModelo; ACodigo: Integer);
    class procedure CarregarEntidadePadrao(AEntidadeModelo: TEntidadeModelo);
//    procedure GravarEscolaClientDS;
    class procedure NovoCadastroClientDS; virtual; abstract;
    class procedure AlterarEscolaClientDS; virtual; abstract;
    class procedure CancelarEdicaoClientDS; virtual; abstract;
    class procedure ExcluirClientDS; virtual; abstract;
    class procedure LimparDadosClientDS; virtual; abstract;
    class procedure DesabilitarFilteredClientDS; virtual; abstract;
    class procedure HabilitarFilteredClientDS; virtual; abstract;
    class procedure CarregarTodosRegistrosClientDS; virtual; abstract;
//    procedure ConsultaOrdenada(AIndiceComboBox: Integer);

    class function DevolverUltimoCodigo: Integer; virtual; abstract;
//    function Gravar(AEscola: TEscolaModelo): Boolean;
    class function ValidarCampos: Boolean; virtual;
    class function CarregarConsultaClientDS(ACampoTabelaFiltrado: string; ADado: string): Boolean; virtual;
    class function StatusInsertEditClientDS: Boolean; virtual; abstract;
    class function VerificaClientDSSeEstaAtivo: Boolean; virtual; abstract;

    class function ClientDS: TClientDataSet; virtual; abstract;
    property EstadoClientDS: TDataSetState read GetEstadoClientDS;
  end;

implementation

class procedure TEntidadeDAO.CarregarEntidadePadrao(AEntidadeModelo: TEntidadeModelo);
begin
  AEntidadeModelo.Codigo       := ClientDS.Fields[0].AsInteger;
  AEntidadeModelo.Nome         := ClientDS.Fields[1].AsString;
  AEntidadeModelo.DataCadastro := ClientDS.Fields[2].AsDateTime;
  AEntidadeModelo.Cep          := ClientDS.Fields[3].AsString;
  AEntidadeModelo.Rua          := ClientDS.Fields[4].AsString;
  AEntidadeModelo.Numero       := ClientDS.Fields[5].AsString;
  AEntidadeModelo.Complemento  := ClientDS.Fields[6].AsString;
  AEntidadeModelo.Bairro       := ClientDS.Fields[7].AsString;
  AEntidadeModelo.Cidade       := ClientDS.Fields[8].AsString;
end;

destructor TEntidadeDAO.Destroy;
begin
  FreeAndNil(FClientDS);
  inherited;
end;
//Verificação de campos obrigatórios se estão vazios
class function TEntidadeDAO.ValidarCampos: Boolean;
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
    if (Campos.Count > 0) then //Verifica se há algum campo obrigatório vazio
    begin
      Result := False;
      ShowMessage('Preencha os campos obrigatórios:' + #13 + #13 + Campos.Text); //Exibe os CAMPOS por NOME
    end
    else
      Result := True;
  finally
    Campos.Free; //Libera a lista da memória
  end;
end;

class function TEntidadeDAO.CarregarConsultaClientDS(ACampoTabelaFiltrado: string;
  ADado: string): Boolean;
begin
  if ClientDS.Locate(ACampoTabelaFiltrado, ADado, []) then
  begin
    ClientDS.Filtered := False;
    ClientDS.Filter := ACampoTabelaFiltrado + ' = ' + QuotedStr(ADado); //Aplicação do filtro
    ClientDS.Filtered := True;
    Result := True;
  end
  else
    Result := False
end;
//COLOCAR PARAMENTRO PRA ENTRAR COM O CLIENTDATASET A SER USADO NO DATAMODULE (AClientDataSet:  TClientDataSet)
function TEntidadeDAO.GetEstadoClientDS: TDataSetState;
begin
  Result := fmdados.EstadoClientDS(ClientDS);
end;

end.
