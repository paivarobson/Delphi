unit unControladorPadrao;

interface

uses
  Windows, Dialogs, SysUtils, DateUtils, StdCtrls,
  Messages, unEscolaModelo, DB;

type
  TCadPadraoController = class

  public
    procedure NovoCadastroClientDS; virtual; abstract;
    function EstadoClientDS: TDataSetState; virtual; abstract;
  end;

implementation

{ TCadPadraoController }

end.
