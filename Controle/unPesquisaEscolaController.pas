unit unPesquisaEscolaController;

interface

uses DB, DBClient;  

type
    TPesquisaEscolaController = class
  public
    function DadosCDS: TClientDataSet;
  end;

implementation

uses
  unDados;

function TPesquisaEscolaController.DadosCDS: TClientDataSet;
begin
  Result := fmdados.ClientDSEscola;
end;

end.
