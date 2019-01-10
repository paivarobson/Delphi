unit unConexao;

interface

uses
  SqlExpr, SysUtils;

type
  TConexao = class
  private
    FConnection: TSQLConnection;

    procedure ConfigurarConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function CriarQuery: TSQLQuery;

    function GetConnection: TSQLConnection;
  end;

implementation

{ TConexao }

procedure TConexao.ConfigurarConexao;
begin
  FConnection.ConnectionName                  := 'MSSQLConnection';
  FConnection.DriverName                      := 'MSSQL';
  FConnection.GetDriverFunc                   := 'getSQLDriverMSSQL';
  FConnection.LibraryName                     := 'dbxmss30.dll';
  FConnection.Params.Values['SchemaOverride'] := 'sa.dbo';
  FConnection.Params.Values['HostName']       := 'NCDEV28';
  FConnection.Params.Values['DataBase']       := 'ESCOLA';
  FConnection.Params.Values['User_Name']      := 'sa';
  FConnection.Params.Values['Password']       := 'fcm123';
  FConnection.VendorLib                       := 'oledb';
  FConnection.LoginPrompt                     := False;
end;
              
constructor TConexao.Create;
begin
  FConnection := TSQLConnection.Create(nil);

  Self.ConfigurarConexao();
end;

function TConexao.CriarQuery: TSQLQuery;
var
  VQuery: TSQLQuery;
begin
  VQuery := TSQLQuery.Create(nil);
  VQuery.SQLConnection := FConnection;

  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

function TConexao.GetConnection: TSQLConnection;
begin
  Result := FConnection;
end;

end.