unit unValidacoes;

interface

uses
  Classes, DBClient, Dialogs, SysUtils;

type
  TValidacoes = class
  public
    class function ValidarCampos(AClientDS: TClientDataSet): Boolean;
  end;

implementation

class function TValidacoes.ValidarCampos(AClientDS: TClientDataSet): Boolean;
var
  i: Integer;
  Campos: TStrings;
begin
  Campos := TStringList.Create;
  try
    for i := 0 to AClientDS.Fields.Count - 1 do
    begin
      if (AClientDS.Fields[i].Tag = 1) and
        (AClientDS.Fields.Fields[i].AsString = EmptyStr) then
        Campos.Add('- ' + AClientDS.Fields.Fields[i].DisplayName) //Armazena o NOME DO CAMPO dentro de uma LISTA
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

end.

